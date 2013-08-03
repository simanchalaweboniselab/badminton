class Api::V1::UsersController < ApplicationController

  respond_to :json

  def sign_up
    logger.info "====================================#{params.inspect}";
    key = (0...15).map{ ('a'..'z').to_a[rand(26)] }.join;
    @user = User.new(:name => params[:name], :email => params[:email], :password => params[:password],:phone_number => params[:phone_number], :auth_key => key);
    respond_with do |format|
      if @user.save
        format.json {render :json => {:success => true, :message => "registration successfully",:auth_key => @user.auth_key,:phone_number => @user.phone_number, :name => @user.name, :email => @user.email }}
      else
        message = "";
        @user.errors.messages.each {|key, value| message << key.to_s <<  ':'; value.each do |v| message << v.to_s << ', '; end}
        format.json {render :json => {:success => false, :message => message}}
      end
    end
  end

  def log_in
    @user = User.find_by_email(params[:email]);
    respond_with do |format|
      if(@user &&  @user.password == params[:password])
        @user.update_attributes(:auth_key => (0...15).map{ ('a'..'z').to_a[rand(26)] }.join);
        format.json {render :json => {:success => true, :message => "login successfully", :auth_key => @user.auth_key,:phone_number => @user.phone_number, :name => @user.name, :email => @user.email }}
      else
        message = @user ? "password doesn't match." : "email not found.";
        format.json {render :json => {:success => false, :message => message}}
      end
    end
  end

end
