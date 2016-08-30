# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'turbolinks:load', ->
	$('.items').masonry
		itemSelector: '.panel'
		isFitWidth: true
	if location.href.includes("shows")
		tag = $('#' + location.href.substring(location.href.indexOf('#') + 1) + '')
		tag.css 'border-color', '#32CD32'
		tag.css 'border-width', '3px'
		offset = tag.offset().top - 50
		$('html,body').animate { scrollTop: offset }, 'slow'