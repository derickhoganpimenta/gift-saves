class SessionsController < ApplicationController
  def new

  end

  def social
    reset_session
    extra_params = request.env["omniauth.params"]
    u = User.find_by(email: facebook_login[:email])
    respond_to do |format|
      if u
        session[:current_logged_user_id] = u.id
        flash[:notice] = "Welcome, #{u.first_name}."
        if extra_params["next"].present?
          format.html { redirect_to extra_params["next"]}
        else
          format.html { redirect_to dashboard_path}
        end
      else
        @user = User.new(facebook_login)
        @user.save(validate: false)
        @user.assign_customer_id
        session[:current_logged_user_id] = @user.id
=begin
        begin
          Hubspot::Contact.createOrUpdate(@user.email, { lifecyclestage: "subscriber" })
          form = Hubspot::Form.find('62902f92-e5ab-4747-9363-473cb079f577')
          result = form.submit(
            firstname: @user.first_name,
            lastname: @user.last_name,
            email: @user.email,
            lifecyclestage: "subscriber"
          )
        rescue Exception => e
          Raven.capture_exception(e)
        end
=end
        flash[:notice] = "User successfully saved."
        if extra_params["next"].present?
          format.html { redirect_to extra_params["next"]}
        else
          format.html { redirect_to dashboard_path }
        end
      end
    end
  end

  def create
    reset_session
    u = User.find_by(email: sessions_params[:email])
    respond_to do |format|
      if u && u.authenticate(sessions_params[:password])
        if u.email_confirmed
          session[:current_logged_user_id] = u.id
          flash[:notice] = "Welcome, #{u.first_name}."
          if params[:next].present?
            format.html { redirect_to params[:next] }
          else
            format.html { redirect_to dashboard_path}
          end
        else
          if params[:next].present?
            confirmation_url = request.protocol + request.host_with_port + "/users/" + u.token + "/account-confirmation?next=#{params[:next]}"
          else
            confirmation_url = request.protocol + request.host_with_port + "/users/" + u.token + "/account-confirmation"
          end
          substitutions = {
            "-name-": "#{u.first_name} #{u.last_name}",
            "-confirmation_link-": confirmation_url
          }
          DefaultMailer.send(
            u.email,
            u.full_name,
            "Account Verification",
            "b3c37b0c-cf67-4288-a5f9-60af602013ae",
            substitutions
          )
          flash[:error] = "Unconfirmed account. Forwarded verification email"
          format.html { redirect_to "/sessions/new" }
        end
      else
        flash[:error] = "Invalid email/password combination."
        if params[:next].present?
          format.html { redirect_to "/sessions/new?next=#{params[:next]}" }
        else
          format.html { redirect_to "/sessions/new" }
        end
      end
    end
  end

  def destroy
    reset_session
    respond_to do |format|
      flash[:notice] = "You are successfully disconnected"
      format.html { redirect_to root_path}
    end
  end

  private

  def facebook_login
    {
      email: request.env['omniauth.auth'][:info][:email],
      first_name: request.env['omniauth.auth'][:info][:name].split.first,
      last_name: request.env['omniauth.auth'][:info][:name].split.last,
      provider: request.env['omniauth.auth'][:provider],
      email_confirmed: true,
      avatar: URI.parse(request.env['omniauth.auth'][:info][:image])
    }
  end

  def google_plus_login
    {
      email: request.env['omniauth.auth'][:info][:email],
      first_name: request.env['omniauth.auth'][:info][:name].split.first,
      last_name: request.env['omniauth.auth'][:info][:name].split.last,
      provider: request.env['omniauth.auth'][:provider],
      email_confirmed: true,
      avatar: URI.parse(request.env['omniauth.auth'][:info][:image])
    }
  end

  def sessions_params
    params.require(:session).permit(:email, :password)
  end
end
