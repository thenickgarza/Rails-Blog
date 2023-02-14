class CommentsController < ApplicationController

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
    @post = Post.find_by(params[:post_id])
    @comment = @post.comments.find_by(params[:comment_id])
  end

  # GET /comments/new
  def new
    @post = Post.find_by(params[:post_id])
    @comment = @post.comments.new
  end

  # GET /comments/1/edit
  def edit
    @post = Post.find_by(params[:post_id])
    @comment = @post.comments.find_by(params[:comment_id])
  end

  # POST /comments or /comments.json
  def create
     @post = Post.find_by(params[:post_id])
    #@comment = @post.comments.new(comment_params)
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to posts_path, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @post = Post.find_by(params[:post_id])
    @comment = @post.comments.update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @post = Post.find_by(params[:post_id])
    @comment = @post.comments.find_by(params[:comment_id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:comment_id])
    end

    def set_post 
      @post = Post.find(params[:post_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content)
    end
end
