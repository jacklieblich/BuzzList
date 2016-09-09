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
	$('#notification-pills a').click(function (e) {
    var tab = $(this);
    if(tab.parent('li').hasClass('active')){
        window.setTimeout(function(){
            $("#notification-content .tab-pane").removeClass('active');
            tab.parent('li').removeClass('active');
        },1);
    }
});
});

$(document).on("click", ".pagination a", function(){
	$(this).parent().parent().html("Loading Sick Shit . . .");
	$.getScript(this.href);
	return false;
});