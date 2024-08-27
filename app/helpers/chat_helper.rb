module ChatHelper
  def truncate_words(text, word_limit)
    words = text.split(/\s+/)
    if words.size > word_limit
      words.first(word_limit).join(' ') + '...'
    else
      text
    end
  end
end
