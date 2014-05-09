$(function(){
	
	
	function heightSelfBox(){
		var liHeight =0;
		$(".selfbox ul").each(function() {
			if ($(this).height() > liHeight){
				liHeight =  $(this).height();
			}
		});
		console.log(liHeight);
		var count = $(".selfbox li").size();
		$(".selfbox ul").each(function() {
			$(this).height(liHeight);
		});
	}
	heightSelfBox();
});