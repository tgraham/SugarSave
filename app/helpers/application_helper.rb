module ApplicationHelper
  
  def truncate_on(text, length = 30, truncate_string = '...', separator = nil)
    return text unless text.respond_to?(:split) && text.length > 0
    if separator
      new_text = text.split(separator)[0...length].join(separator)
      new_text == text ? new_text : new_text + truncate_string
    else
      truncate(text, :length => 30, :omission => '...')
    end
  end
    
end
