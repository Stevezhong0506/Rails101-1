class Account::PostsController < ApplicationController
  before_action :find_post_and_check_permission, only: [:edit, :destroy]

  before_action :authenticate_user!
  def index
    @posts = current_user.posts
  end

  def edit

  end

private

def find_post_and_check_permission
  @group = Group.find(params[:group_id])
  @post = Post.new(post_params)

    if current_user != @post.user
      redirect_to root_path, alert: "You have no permission."
    end
  end


  def post_params
    params.require(:post).permit(:content)
  end

end
