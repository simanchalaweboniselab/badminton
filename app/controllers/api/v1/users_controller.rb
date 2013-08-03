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

  def all_areas
    @areas = Area.select([:id, :name]);
    logger.info "=======================================#{@areas.inspect}"
    respond_with do |format|
      if(User.find_by_auth_key(params[:auth_key]))
        format.json {render :json => {:success => true, :area => @areas }}
      else
        format.json {render :json => {:success => false, :message => "invalid auth key"}}
      end
    end
  end

  def get_buddies
    @user = User.find_by_auth_key(params[:auth_key])
    respond_with do |format|
      if(@user)
        if(params[:id] == "0")
          users = User.all_users
          format.json {render :json => {:success => true, :users => users}}
        else
          @area = Area.select([:id, :name]).find(params[:id])
          @user.update_attributes(:area_id => @area.id)
          users = @area.users.where("id NOT IN (?)", @user.id).select([:id, :name])
          format.json {render :json => {:success => true, :users => users, :area => @area }}
        end
      else
        format.json {render :json => {:success => false, :message => "invalid auth key"}}
      end
    end
  end

  def send_message
    @user = User.find_by_auth_key(params[:auth_key])
    respond_with do |format|
      if(@user && (params[:message] != ""))
        users = params[:users].gsub('[','');
        users = users.gsub(']','');
        users = users.split(",")
        @message = Message.create(:content => params[:message], :sender_id => @user.id)
        Receiver.create_receiver(users,@message.id) if (!users.empty?)
        count = users.empty? ? 0 : users.count
        message = "cool your message to sent #{count} buddies is sent."
        format.json {render :json => {:success => true, :message => message }}
      else
        message = @user ? "message can't be blank" : "invalid auth key"
        format.json {render :json => {:success => false, :message => message}}
      end
    end
  end

  def my_messages
    @user = User.find_by_auth_key(params[:auth_key])
    respond_with do |format|
      if(@user)
        @messages = @user.messages
        if @messages.empty?
          format.json {render :json => {:success => false, :messages => "No messages for you." }}
        else
          messages = User.get_senders(@messages)
          format.json {render :json => {:success => true, :messages => messages }}
        end
      else
        format.json {render :json => {:success => false, :message => "invalid auth key"}}
      end
    end
  end

  def get_courts
    @user = User.find_by_auth_key(params[:auth_key])
    respond_with do |format|
      if(@user)
        courts = Court.court_details(Court.all)
        format.json {render :json => {:success => true, :courts => courts }}
      else
        format.json {render :json => {:success => false, :message => "invalid auth key"}}
      end
    end
  end

end
