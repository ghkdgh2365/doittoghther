class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bulletin
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = @bulletin.present? ? @bulletin.posts.all : Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @times = ((@post.end_day-@post.start_day).to_i)/@post.goal_period
    @a = 0
    @today = Date.today

  end

  def check_day
    @post = Post.find(params[:id_of_post])
    @post.check_square[0] = params[:check_value]
    @post.save
    
    redirect_to :back
    
  end
  # GET /posts/new
  def new
    @post = @bulletin.present? ? @bulletin.posts.new : Post.new
  end

  # GET /posts/1/edit
  def edit
    authorize_action_for @post
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @bulletin.present? ? @bulletin.posts.new(post_params) : Post.new(post_params)
    @post.user = current_user
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to (@bulletin.present? ? [@post.bulletin, @post] : @post), notice: '성공적으로 작성되었습니다!' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authorize_action_for @post
    
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to (@bulletin.present? ? [@post.bulletin, @post] : @post), notice: '성공적으로 작성되었습니다!' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authorize_action_for @post
    
    @post.destroy
    respond_to do |format|
      format.html { redirect_to (@bulletin.present? ? bulletin_posts_url : posts_url), notice: '성공적으로 삭제되었습니다!' }
      format.json { head :no_content }
    end
  end
  
  def confirm_goal
    @confirm_goal = Confirm.new
    @confirm_goal.confirm_content = params[:confirm_goal_content]
    @confirm_goal.post_id = params[:id_of_post]
    @confirm_goal.pass_fail = params[:confirm_pass_fail]
    @confirm_goal.save
    
    @check_confirm = Post.find(params[:id_of_post])
    @check_confirm.is_confirmed = params[:checking_confirm]
    @check_confirm.save
    
    redirect_to :back
  end
  
  def confirm_goal_show
    @confirm_goal = Confirm.all
    @posts = Post.all
  end
  
  def check_confirm_goal
    @check_confirm = Confirm.all
  end
  
  private
    def set_bulletin
      @bulletin = Bulletin.find(params[:bulletin_id]) if params[:bulletin_id].present?
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      if @bulletin.present?
        @post = @bulletin.posts.find(params[:id])
      else
        @post = Post.find(params[:id])
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :racer_name, :start_day, :end_day, :set_money, :checker_name, :receiver_name,
      :is_confirmed, :goal_period, :penalty, :receiver_phone_number, :goal_checker, :support_agree, :phone_number,
      :information_agree, :goal_category, :goal_type, :penalty_exist, :checker_email, :check_square)
    end
end
