# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ajaxComplete ->
    episodes = $('#clip_episode_id').html()
    $('#season_id').change ->
        season = $('#season_id :selected').text()
        options = $(episodes).filter("optgroup[label='#{season}']").html()
        if options
            $('#clip_episode_id').html(options)
        else
            $('#clip_episode_id').empty()
$(document).ready ->
	$('.youtube-thumbnail').on 'click', ->
		$(this).parent().html '<iframe width="560" height="315" src="//www.youtube.com/embed/' + this.id + '?autoplay=1&showinfo=0" frameborder="0" allowfullscreen></iframe>'