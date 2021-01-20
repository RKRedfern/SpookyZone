class StoriesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @story = Story.new
    end

    def index 

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

    def show
        
    end
    

    private

    def story_params
        params.require(:story).permit(:title, :content)
    end

end
