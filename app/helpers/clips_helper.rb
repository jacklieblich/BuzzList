module ClipsHelper
    
  def embed(video_url)
    video_id = video_url.split("=").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{video_id}")
  end

end
