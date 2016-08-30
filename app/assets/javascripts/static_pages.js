$(document).on("turbolinks:load", function() {
	$('.my-flipster').flipster({
		itemContainer: 'ul',
		itemSelector: 'li',
		loop: true,
		fadeIn: 0
	});
	$('.nav-pills a').on('shown.bs.tab', function(){
	$('.items').masonry({
		itemSelector: '.panel',
		isFitWidth: true
	});
});
});
