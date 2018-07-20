(function(){
	$("#submit").click(function(){
		var formdata = $("#login").serialize();
		$.ajax({
			type:"post",
			url:"data/user/signin.php",
			dataType: "json",
			data: formdata,
			success: function(data){
				if(data.code < 0){
					$(".error").css("visibility", "visible")
						.children(".err-msg").html(data.msg);
				}
				setTimeout(function(){
					$(".error").css("visibility", "hidden");
				}, 2000);
				if(data.code > 0){
					var index = location.search.indexOf("=");
					if(index == -1){
						var i = location.href.lastIndexOf("/");
						location.href = location.href.slice(0, i);
					}
					else{
						location.href = location.search.slice(index+1);			
					}
				}
			},
			error: function(){
				alert("网络错误，请检查后重试！");
			}
		});
	});
})();
