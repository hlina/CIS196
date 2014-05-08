$(document).on("page:load", function(){
	centerQuote();
	centerBookline();
	centerWrapper();
	heightSelfBox();

	function centerQuote(){
		var wrapWidth = $(".wrap").width();
		var docWidth = $(document).width();
		var marg = (docWidth - wrapWidth)/2;
		var rqheight = $(".rquote").height();
		var rqmarg = (250 - rqheight)/2;
		$(".rquote").css({"margin-top": rqmarg, "margin-bottom": rqmarg});
		$(".wrap").css({"margin-left": marg, "margin-right":marg});
	}

	function centerBookline(){
		var liWidth = $(".bookscroll li").width();
		var count = $(".bookscroll li").size();
		var totalWidth = 7 * liWidth;
		$("#bookline").width(totalWidth);
	}

	function centerWrapper(){
		var wrapperWidth = 1100;
		var docWidth = $(".content").width();	
		var marg = (docWidth - wrapperWidth)/2;
		$(".wrapper").css({"margin-left": marg, "margin-right":marg});
	}

	function heightSelfBox(){
		var liHeight = $(".selfbox li").height();
		var count = $(".selfbox li").size();
		var height = count*17;
		$(".selfbox").height(height);
	}

});