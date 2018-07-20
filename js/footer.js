(function(){
	$.ajax({
		type: "get",
		url: "footer.html",
		success: function(html){
			$("#footer").html(html);
			var wx = document.querySelector("#footer>.footer-other>.social>.wx");
			wx.onmouseenter = function(){
				this.parentElement.lastElementChild.style.display = "block";
			}
			wx.onmouseleave = function(){
				this.parentElement.lastElementChild.style.display = "none";
			}
		}
	});
})();
