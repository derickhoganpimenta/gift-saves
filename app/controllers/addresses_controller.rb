class AddressesController < ApplicationController
  def index
    @addresses = current_logged_user.addresses
  end

  def new
    @address = current_logged_user.addresses.new
    params[:next].present? ? @next = "?next=#{params[:next]}" : @next = ""
  end

  def create
    @user = current_logged_user
    @address = @user.addresses.new(address_params)
    respond_to do |format|
      if @address.save
        flash[:notice] = "Address successfully created"
        if params[:next].present?
          format.html { redirect_to params[:next] }
        else
          format.html { redirect_to donors_dashboard_path }
        end
      else
        format.html { render action: :new }
      end
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @user = current_logged_user
    @address = Address.find(params[:id])
    respond_to do |format|
      if @address.update_attributes(address_params)
        flash[:notice] = "Address successfully updated"
        format.html { redirect_to donors_dashboard_path }
      else
        format.html { render action: :edit }
      end
    end
  end

  def delete
    @user = current_logged_user
    @address = Address.find(params[:id])
    @deleted = @address.destroy
    @addresses = @user.addresses
  end

  private

  def address_params
    params.require(:address).permit(:type_cd, :zip_code, :country, :street_address, :city, :state)
  end
end
