module MentionProcessor
  # using this module for the seeding process
  def process_mentions(content)
    mentions = []

    processed_content = content.gsub(/@\[(.+?)\]|@(\w+)/) do |match|
      route_or_user_name = $1 || $2

      if $1
        route = Route.where("LOWER(title) = ?", route_or_user_name.downcase).first
        if route
          mentions << route.title
          "<a href='#{Rails.application.routes.url_helpers.route_path(route)}'>@#{route.title}</a>"
        else
          match
        end
      elsif $2
        user = User.find_by(username: route_or_user_name)
        if user
          mentions << user.username
          "<a href='#{Rails.application.routes.url_helpers.user_path(user)}'>@#{user.username}</a>"
        else
          match
        end
      else
        match
      end
    end

    { content: processed_content, mentions: mentions }
  end
end
