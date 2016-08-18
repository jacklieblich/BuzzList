module ApplicationHelper
    
    # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "BuzzList"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
    # Stores the URL trying to be accessed.
 
end
