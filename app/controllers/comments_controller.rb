class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        #check if it's nested AND check if this method returns anything - nil or something 
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

    def show
        @comment = Comment.find_by(id: params[:id])
    end

    def edit
        @comment = Comment.find_by(id: params[:id])
    end

    def update
        @comment = Comment.find_by(id: params[:id])
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            render :edit
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content,:story_id)
    end

end