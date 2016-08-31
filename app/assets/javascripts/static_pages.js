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
$(document).on("click", ".pagination a", function(){
	$(this).parent().parent().html("Loading Sick Shit . . .");
	$.getScript(this.href);
	return false;
});
