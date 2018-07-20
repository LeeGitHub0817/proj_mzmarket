(function(){
	$("#uname").blur(function(e){
		var that = $(this);
		$.ajax({
			type:"post",
			url:"data/register/register_check.php",
			dataType: "json",
			data: "uname="+ that.val(),
			success: function(data){
				if(data.code < 0){
					$(".error").css("visibility", "visible")
						.children(".err-msg").html(data.msg);
				}
				setTimeout(function(){
					$(".error").css("visibility", "hidden");
				}, 2000);	
			},
			error: function(){
				alert("网络错误！请检查");
			}
		});
	});
})();

$("#submit").click(function(e){
	var formdata = $("#register").serialize();
	$.ajax({
		type: "post",
		url: "data/register/register.php",
		dataType: "json",
		data: formdata,
		success: function(data){
			if(data.code < 0){
					$(".error").css("visibility", "visible")
						.children(".err-msg").html(data.msg);
				}
				setTimeout(function(){
					$(".error").css("visibility", "hidden");
				}, 1000);
			if(data.code > 0){
				$(".ok").css("visibility", "visible");
				setTimeout(function(){
					location.href = "login.html";
				}, 3000);
			}
		},
		error: function(){
			alert("网络错误！请检查");
		}
	})
})
