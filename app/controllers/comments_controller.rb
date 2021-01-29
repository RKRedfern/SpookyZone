class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:story_id] && @story = Story.find_by_id(params[:story_id])
            @comments = @story.comments
        else
            @error = "That story doesn't exist" if params[:story_id]
            @comments = Comment.all
        end
    end

    def new
        if params[:story_id] && @story = Story.find_by_id(params[:story_id])
            @comment = @story.comments.build
        else
            @error = "That story doesn't exist" if params[:story_id]
            @comment = Comment.new
        end
    end

    def create
        @comment = current_user.comments.build(comment_params)
        if @comment.save
            redirect_to comments_path
        else
            render :new
        end
    end

    before_action :find_comment_by_id

    def show
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            render :edit
        end
    end

    def destroy
        @comment.destroy
        redirect_to comments_path
    end

    private

    def comment_params
        params.require(:comment).permit(:content,:story_id)
    end

end