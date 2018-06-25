class UsersController < ApplicationController
  def new
    @user = User.new
    params[:next].present? ? @next = "?next=#{params[:next]}" : @next = ""
  end

  def create
    @user = User.new(users_params)
    respond_to do |format|
      if @user.save
        if params[:next].present?
          confirmation_url = request.protocol + request.host_with_port + "/users/" + @user.token + "/account-confirmation?next=#{params[:next]}"
        else
          confirmation_url = request.protocol + request.host_with_port + "/users/" + @user.token + "/account-confirmation"
        end
=begin
        substitutions = {"-name-": "#{@user.first_name} #{@user.last_name}", "-confirmation_link-": confirmation_url}
        DefaultMailer.send(
          @user.email,
          @user.full_name,
          "Account Verification",
          "b3c37b0c-cf67-4288-a5f9-60af602013ae",
          substitutions
        )
=end        
        flash[:notice] = "User successfully saved."
        format.html { redirect_to login_path }
      else
        if params[:next].present?
          format.html { render action: :new, next: params[:next] }
        else
          format.html { render action: :new }
        end
      end
    end
  end

  private

  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
