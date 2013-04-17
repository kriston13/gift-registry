// $('#registry_items_list')
// 	.delegate('div.item_tools a', 'ajax:beforeSend', function() {
// 		console.log('the a in div.item_tools was clicked');
// 		$(this).nearest('div.item_tools')
// 			.alert("Submitting ajax request");
// 	});

// $(function() {
// 	$('.item_tools a')
// 		.bind('ajax:beforeSend', function(e) {
// 			console.log('the a in div.item_tools was clicked');
// 			// alert("submitting ajax request");
// 		})
// 		.bind('ajax:complete', function(e) {
// 			console.log('ajax request completed');
// 		})
// })

$(function () {
	$('div.item_tools')
		.on('click', 'a', function itemToolsAjaxy() {
			console.log("clicky click")
		})
		.on('ajax:beforeSend', "a", function() {
			console.log('the a in div.item_tools is sending its ajax command');
		})
		.on('ajax:complete', "a", function() {
			console.log('ajax request completed');
		});	
});