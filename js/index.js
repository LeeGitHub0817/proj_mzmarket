//菜单部分
(function(){
	$("#menu>.menu-container>ul.link").on("mouseenter", "li", function(e){
	e.preventDefault();
	$(this).find(".header-sub").addClass("active").find("li").addClass("active");
	
	});
	$("#menu>.menu-container>ul.link").on("mouseleave", "li", function(e){
		e.preventDefault();
		$(this).find(".header-sub").removeClass("active").find("li").removeClass("active");
	});
})();

//轮播图
(function(){
	var $ulImg = $("#banner>.banner-container>.banner-img");
	var $ulBtn = $("#banner>.banner-container>.btn-link");
	var moveCount = 0;
	var imgWidth = 1240;
	var timer = null;
	$.ajax({
		type:"get",
		url:"data/index/getCarousel.php",
		async:true,
		dataType: "json",
		success: function(data){
			var html = "";
			for(var item of data){
				html += `<li>
					<a href="${item.href}" title="${item.title}"><img src="${item.img}"/></a>	
				</li>`;
			}
			var last = data[0];
			html += `<li>
				<a href="${last.href}" title="${item.title}><img src="${last.img}"/></a>	
			</li>`;
			$ulImg.html(html).css("width", imgWidth * (data.length + 1));
			$ulBtn.html("<li></li>".repeat(data.length)).children(":first").addClass("active");
			
			//调用滚动函数
			autoScroll();
		},
		error: function(){
			alert("网络错误，请检查后重试！");
		}	
	});
	
	function autoScroll(){
		timer = setInterval(function(){
			scroll();
		}, 2500);
	}

	function scroll(){
		moveCount++;
		$ulImg.animate({
			left: -moveCount * imgWidth
		}, 500, function(){
			if(moveCount == $ulImg.children().length - 1){
				$ulImg.css("left", 0);
				moveCount = 0;
			}
			$ulBtn.children(":eq("+moveCount+")").addClass("active")
				.siblings().removeClass("active");
		});
	}
	$("#banner>.banner-container>.banner-img").mouseenter(function(){
		clearInterval(timer);
		timer = null;
	}).mouseleave(function(){
		autoScroll();
	});
	
	//点击指定按钮跳转到相关图片
	$("#banner>.banner-container>.btn-link").on("click", "li", function(e){
		e.preventDefault();
		var $li = $(this);
		moveCount = $li.index();
		$ulImg.stop(true).animate({
			"left": -moveCount * imgWidth
		}, 500, function(){
			if(moveCount == $ulImg.children().length - 1){
				$ulImg.css("left", 0);
				moveCount = 0;
			}
			$ulBtn.children(":eq("+moveCount+")").addClass("active")
				.siblings().removeClass("active");
		});
	});
	
})();

//主体页面内容
(function(){
	$.ajax({
		type:"get",
		url:"data/index/getIndexProduct.php",
		async:true,
		dataType: "json",
		success: function(data){
			var {hot, phone, smart} = data;			
			//热卖商品
			var htmlHot = "";
			for(var item of hot){
				htmlHot += `<div>
					<a href="${item.href}">
						<img src="${item.img}"/>
						<p class="name">${item.ipname}</p>
						<p class="desc">${item.description}</p>
						<p class="price"><i>￥</i><span>${item.price}</span><em>起</em></p>
					</a>	
				</div>`;
			}
			$("#hot-sale>.hotsale-container").html(htmlHot);
			
			//手机
			var htmlPhoneOne = "";
			var htmlPhoneTwo = "";
			phone.forEach(function(value, index){
				var {img, href, ipname, description, price} = value;
				if(index < 4){
					htmlPhoneOne += `<div><a href="${href}"><img src="${img}"/></a></div>`;
				}
				else{
					htmlPhoneTwo += `<div>
						<a href="${href}">
							<img src="${img}"/>
							<p class="name">${ipname}</p>
							<p class="desc">${description}</p>
							<p class="price"><i>￥</i><span>${price}</span><em>起</em></p>
						</a>
					</div>`;
				}				
			});
			$("#phone>.phone-container-one").html(htmlPhoneOne);
			$("#phone>.phone-container-two").html(htmlPhoneTwo);
			
			//智能配件
			var htmlSmartOne = "";
			var htmlSmartTwo = "";
			smart.forEach(function(value, index){
				var {img, href, ipname, description, price} = value;
				if(index < 4){
					htmlSmartOne += `<div><a href="${href}"><img src="${img}"/></a></div>`;
				}
				else{
					htmlSmartTwo += `<div>
						<a href="${href}">
							<img src="${img}"/>
							<p class="name">${ipname}</p>
							<p class="desc">${description}</p>
							<p class="price"><i>￥</i><span>${price}</span></p>
						</a>
					</div>`;
				}
			});
			$("#smart>.smart-container-one").html(htmlSmartOne);
			$("#smart>.smart-container-two").html(htmlSmartTwo);
		},
		error: function(){
			
		}
	});
})();

//头部登录搜索相关
(function(){
	//搜索按钮
	$("#searchBtn").click(function(e){
		e.preventDefault();
		var content = $("#search").val();
		if(content.trim() == ""){
			location.href = "product_search.html";
		}
		else{
			location.href = "product_search.html?kw=" + content;
		}
	})
	$("#search").keyup(function(e){
		if(e.keyCode === 13){
			var content = $(this).val();
			if(content.trim() == ""){
				location.href = "product_search.html";
			}
			else{
				location.href = "product_search.html?kw=" + content;
			}
		}
	})
	//是否登录验证
	$.ajax({
		type: "get",
		url: "data/user/islogin.php",
		dataType: "json",
		success: function(data){
			console.log(data);
			if(data.ok == 0){
				$("#loginlist").show().next().hide();
			}
			else{
				var avator = data.info.avator;
				$("#loginlist").hide().next().show()
					.find(".avator>img").attr("src", avator);
			}
		},
		error: function(){
			alert("网络错误，请检查！");
		}
	});
	//登录按钮事件
	$("#btn-login").click(function(e){
		e.preventDefault();
		location.href = "login.html?back=" + location.href;
	});
	//注销按钮事件
	$("#btn-signout").click(function(e){
		e.preventDefault();
		$.ajax({
			type: "get",
			url: "data/user/signout.php",
			success: function(){
				location.reload(true);
			}
		})
	});
})();
