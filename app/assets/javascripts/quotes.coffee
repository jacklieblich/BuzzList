# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ajaxComplete ->
    episodes = $('#quote_episode_id').html()
    $('#season_id').change ->
        season = $('#season_id :selected').text()
        options = $(episodes).filter("optgroup[label='#{season}']").html()
        if options
            $('#quote_episode_id').html(options)
        else
            $('#quote_episode_id').empty()