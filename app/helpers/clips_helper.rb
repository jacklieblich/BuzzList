module ClipsHelper

  def thumbnail(video_url)
  	video_id = video_url.split("=").last
  	image_tag("//img.youtube.com/vi/"+video_id+"/hqdefault.jpg", class: "youtube-thumbnail", id: video_id)
  end

end
