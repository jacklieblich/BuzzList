$(document).on("turbolinks:load", function() {
$('.my-flipster').flipster({
    itemContainer: 'ul',
    itemSelector: 'li'
});
});