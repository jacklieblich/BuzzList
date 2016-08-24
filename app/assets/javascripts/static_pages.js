$(document).on("turbolinks:load", function() {
$('.my-flipster').flipster({
    itemContainer: 'ul',
    itemSelector: 'li',
    loop: true,
    fadeIn: 0
});
});