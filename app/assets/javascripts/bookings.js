
$(function () {
	$('div.item_tools')
		.on('click', 'a', function itemToolsAjaxy() {
			console.log("clicky click");
		})
		.on('ajax:beforeSend', "a", function() {
			console.log('the a in div.item_tools is sending its ajax command');
			$(this).closest('div').html('<img src=/assets/ajax-loader-bar.gif>');
		})
		// .on('ajaxComplete', 'a', function() {
		// 	console.log('ajax request completed');
		// });	
});

$(function () {
	$('#registry_items_list')
		.on('ajaxComplete', function() {
			console.log('an ajax request somewhere has completed');
		})
})