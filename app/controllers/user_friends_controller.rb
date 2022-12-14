class UserFriendsController < ApplicationController
  before_action :set_user_friend, only: %i[ edit update destroy ]

  # GET /user_friends or /user_friends.json
  def index
    @user_friends = UserFriend.all
  end

  # GET /user_friends/1 or /user_friends/1.json
  def show
    @user_friend = UserFriend.find(params[:id])
  end

  def accept
    uf = UserFriend.find(params[:id])
    uf.update(status: "Accepted")
    notif = Notification.create!(message: "#{current_user.full_name} has accepted your invite!", is_read: 1, user: uf.user)
    NotificationChannel.broadcast_to(
      uf.user,
      "<li class=\"dropdown-item\" style=\"background-color:#D2DAFF\">#{notif.message}</li>".html_safe
    )
    redirect_to root_path
  end

  def decline
    @user_friend = UserFriend.find(params[:id])
    notif = Notification.create!(message: "#{current_user.full_name} has declined your invite!", is_read: 1, user: @user_friend.user)
    NotificationChannel.broadcast_to(
       @user_friend.user,
       "<li class=\"dropdown-item\" style=\"background-color:#D2DAFF\">#{notif.message}</li>".html_safe
     )
    redirect_to root_path
    @user_friend.destroy
  end

  # GET /user_friends/new
  def new
    @user_friend = UserFriend.new
    @user = current_user
  end

  # GET /user_friends/1/edit
  def edit
  end

  # POST /user_friends or /user_friends.json
  def create
    @user_friend = UserFriend.new(user_friend_params)
    @user_friend.user_id = current_user.id
    @user_friend.friend_id = User.where(full_name: params[:user_friend][:user]).first.id

    respond_to do |format|
      if @user_friend.save!
        notification = Notification.create!(message: "#{current_user.full_name} want to connect with you!", is_read: 1, user: @user_friend.friend)
        NotificationChannel.broadcast_to(
          @user_friend.friend,
          "<li class=\"dropdown-item\" style=\"background-color:#D2DAFF\">#{notification.message}</li>".html_safe
        )
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_friends/1 or /user_friends/1.json
  def update
    @users = User.all
    respond_to do |format|
      if @user_friend.update(user_friend_params)
        format.html { redirect_to user_friend_url(@user_friend), notice: "User friend was successfully updated." }
        format.json { render :show, status: :ok, location: @user_friend }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_friends/1 or /user_friends/1.json
  def destroy
    @user_friend.destroy
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_friend
    @user_friend = UserFriend.find(params[:user_id])
  end

  # Only allow a list of trusted parameters through.
  def user_friend_params
    params.require(:user_friend).permit(:user_id, :friend_id)
  end
end
