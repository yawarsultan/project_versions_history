class CommentsController < ApplicationController

  # POST /comments or /comments.json
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.create(comment_params)

    respond_to do |format|
      @comment.user = current_user
      if @comment.save
        @project.version_histories.create(version_type: :comment, title: "Comment added by #{current_user.first_name}", body: @comment.body)
        format.html { redirect_to @project, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @project, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :project_id, :user_id)
    end
end
