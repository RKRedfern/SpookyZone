class StoriesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @story = Story.new
    end

    def index 
        @stories = Story.all
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
