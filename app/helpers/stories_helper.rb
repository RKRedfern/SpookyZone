module StoriesHelper
    def index_display_header
        if @user
            content_tag(:h1, "#{@user.username}'s Stories:")
        else
            content_tag(:h2, "All Stories")
        end
        end

    # def display_stories
    #     if @user.stories.empty?
    #         tag.h2(link_to('No Stories yet - write a Story here', new_story_path))
    #     else
    #         user = @user == current_user ? 'Your' : "#{@user.username}'s"
    #         content_tag(:h2, "#{user} #{pluralize(@user.stories.count, 'Story')}:")
    #     end
    # end
    
end