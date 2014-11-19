module ApplicationHelper
  def full_title(page_title=nil)
    base_title = "My Rails Project"
    if page_title
      content_for(:title) { "#{page_title} | #{base_title}" }
    else
      content_for?(:title) ? content_for(:title) : base_title
    end
  end
end
