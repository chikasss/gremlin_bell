module MentionProcessor
  def process_mentions(content)
    mentions = []

    processed_content = content.gsub(/@\[(.+?)\]/) do |mention|
      user_or_route_name = $1.strip
      user = User.find_by(username: user_or_route_name)
      route = Route.where("LOWER(title) = ?", user_or_route_name.downcase).first

      if user
        mentions << user.username
        "<a href='/users/#{user.id}'>@#{user.username}</a>"
      elsif route
        mentions << route.title
        "<a href='/routes/#{route.id}'>#{route.title}</a>"
      else
        mention
      end
    end

    { content: processed_content, mentions: mentions }
  end
end
