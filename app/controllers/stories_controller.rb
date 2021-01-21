class StoriesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @story = @user.story.build
        else
            @story = Story.new
        end
    end

    def index 
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @story = @story.posts.build
        else
            @error = "That user doesn't exist" if params[:user_id]
            @stories = Story.all
        end
    end

    def create 
        @story = current_user.stories.build(story_params)
        if @story.save
            redirect_to stories_path
        else
            render :new
        end
    end

    def edit
    
    end

    def destroy

    end

    def show
        @story = Story.find_by_id(params[:id])
        redirect_to stories_path if !@story
    end
    

    private

    def story_params
        params.require(:story).permit(:title, :content)
    end

end
