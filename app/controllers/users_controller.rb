class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def create
  	@user = User.new(params_user)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to root_path, notice: 'New account created.'
  	else
  		render :new 
  	end
  end

  def new
  	@user = User.new
  end

  def show
  end

  def edit
  end

  def update
  	if @user.update(params_user)
  		redirect_to @user, notice: 'account updated'
  	else
  		render :edit
  	end
  end

  def destroy
  	@user.destroy
  	session[:user_id] = nil
  	redirect_to root_path, notice: 'account deleted'
  end

  def text_me_now
    @client = Twilio::REST::Client.new ENV['FOODFORGE_ACCOUNT_SID'], ENV['FOODFORGE_AUTH_TOKEN']
    @message = "Don't forget: "
    @message += params[:ingredients].join("\n")

    proper_twilio_number = "+1" + current_user.phone_number

    respond_to do |format|
      format.js
    end

    @client.messages.create(
      from: '+1347-507-7135',
      to: proper_twilio_number,
      body: @message
    )

    # ingredients = JSON.parse json.data
    # JSON object being sent from the client and stored inside a variable
    # This variable will be the body of the Twilio sms message
  end

  private

  	def params_user
  		params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :phone_number)
  	end

  	def set_user
  		@user = User.find(params[:id])
  	end
end
