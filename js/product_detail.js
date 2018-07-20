//预览图片切换按钮
(function(){
	$("#page-detail ul.smimg").on("click", "li>img", function(){
		var mdimg = $(this).attr("data-md");
		$(this).parent().addClass("active").siblings().removeClass("active");
		$("#page-detail .mdimg img").attr("src", mdimg);
	})
})();
//页面内容
(function(){
	if(location.href.indexOf("pid") !== -1){
		var pid = location.search.split("=")[1];
		$.ajax({
			type: "get",
			url: "data/products/getProductById.php",
			async: true,
			data: {pid: pid},
			dataType: "json",
			success: function(data){
				//生成价格、名称、券等信息
				var product = data.product;
				$(".link>.link-title").html(product.pname);
				$(".property>h2.title").html(product.pname);
				$(".property>p.subtitle").html(product.subtitle);
				$(".property>.price-ticket>.price>span:last-child").html("￥"+ product.price);
				$(".property>.price-ticket>.ticket-container").html(product.coupon);
				$("#page-detail-tabs>.container>#content1").html(product.details);
				$("#page-detail-tabs>.container>#content2").html(product.parameters);
				$("#page-detail-tabs>.container>#content3").html(product.qaq);
				
				//生成规格选项
				var specs = data.specs;
				var html = "";
				for({pid, spec, specimg} of specs){
					html += `<li class="${pid == product.pid ? 'active' : ''}">
								<a href="product_detail.html?pid=${pid}">
									<img src="${specimg}"/>
									<span>${spec}</span>
								</a>
							</li>`;
				}
				$(".property>.specification>ul.container").html(html);
				
				//生成图片预览
				var pics = data.pics;
				var html = "";
				for({sm, md, lg} of pics){
					html += `<li>
							<img src="${sm}" data-md="${md}" data-lg="${lg}"/>
						</li>`;
				}
				$(".priview>ul.smimg").html(html);
				$(".priview>div.mdimg").html(`<img src="${pics[0].md}"/>`);
				
				//生成向下滚动时出现的购买信息
				$(".shortcut>.shortcut-con").attr("data-pid", product.pid);
				$(".shortcut>.shortcut-con>.info-con>.pname").html(product.pname);
				$(".shortcut>.shortcut-con>.info-con>.price").html('￥' + product.price);
				$(".shortcut>.shortcut-con>.info-con>.spec").html(product.spec);
			},
			error: function(){
				alert("网络错误，请检查！");
			}
		});
	}
})();

//向下滚动出现快捷菜单
(function(){
	$(window).scroll(function(){
		var scrollVal = $(window).scrollTop();
		if(scrollVal >= 200){
			$("#detailFast").addClass("fixed");
		}
		else{
			$("#detailFast").removeClass("fixed");
		}
		
		if(scrollVal >= 720){
			$("#detailFast>.fixed-container>ul").addClass("show");
		}
		else{
			$("#detailFast>.fixed-container>ul").removeClass("show");
		}
	})
	
	$("#detailFast>.fixed-container>ul>li").on("click", "a", function(e){
		e.preventDefault();
		var $tar = $(this);
		$tar.addClass("active").siblings().removeClass("active");
		var id = $tar.attr("href");
		$(id).css("display", "block").siblings().css("display", "none");
		$(window).scrollTop(720);
	});
})();

//加减按钮
$(".property>.other-options>.count").on("click", ".reduce,.add", function(){
	var $ele = $(this);
	console.log($ele);
	var inputVal = parseInt($ele.siblings(".num").val());
	console.log(inputVal);
	if($ele.attr("class") == "reduce"){
		inputVal--;
		if(inputVal < 1){
			inputVal = 1;
		}
	}
	if($ele.attr("class") == "add"){
		inputVal++;
	}
	$ele.siblings(".num").val(inputVal);
});

//立即购买
$(".buy-button>.buy").click(function(){
	$ele = $(this);
	$.ajax({
		type:"get",
		url:"data/user/islogin.php",
		async:true,
		dataType: "json",
		success: function(data){
			if(data.ok == 1){
				//查找产品ID号
				var index = location.search.indexOf("=");
				var pid = parseInt(location.search.slice(index + 1));
				//查找数量
				var inputEle = $ele.parent().siblings(".count").find(".num");
				var count = parseInt(inputEle.val());
				$.ajax({
					type:"post",
					url:"data/cart/addCart.php",
					async:true,
					data: {pid, count},
					dataType: "json",
					success: function(data){
						location.href = "cart.html";
					},
					error: function(){
						alert("添加购物车失败");
					}
				});
			}
			else{
				location.href = "login.html?back=" + location.href;
			}
		},
		error: function(){
			alert("网络错误，请检查后重试！");
		}
	});
});

//下拉菜单立即购买
$(".shortcut>.shortcut-con>.buyBtn-con>a").click(function(){
	$ele = $(this);
	$.ajax({
		type:"get",
		url:"data/user/islogin.php",
		async:true,
		dataType: "json",
		success: function(data){
			if(data.ok == 1){
				//查找产品ID号
				var pid = parseInt($ele.parent().parent().attr("data-pid"));
				//查找数量
				var inputEle = $(".other-options>.count>.num");
				var count = parseInt(inputEle.val());
				$.ajax({
					type:"post",
					url:"data/cart/addCart.php",
					async:true,
					data: {pid, count},
					dataType: "json",
					success: function(data){
						location.href = "cart.html";
					},
					error: function(){
						alert("添加购物车失败");
					}
				});
			}
			else{
				location.href = "login.html?back=" + location.href;
			}
		},
		error: function(){
			alert("网络错误，请检查后重试！");
		}
	});
});

////封装一个购物车加载函数
//function loadCart(){
//	$.ajax({
//		type:"get",
//		url:"data/user/islogin.php",
//		async:true,
//		dataType: "json",
//		success: function(data){
//			if(data.ok == 1){
//				$.ajax({
//					type:"get",
//					url:"data/cart/getCart.php",
//					async:true,
//					dataType: "json",
//					success: function(data){
//						console.log(data);
//						var buyCount = 0;
//						for(var item of data){
//							buyCount += parseInt(item.count);
//						}
//						$("#header>.header-container .showCartNum").html(buyCount);
//					}
//				});
//			}
//		},
//		error: function(){
//			alert("网络错误，请检查后重试！");
//		}
//	});
//}
//loadCart();
//
////加入购物车
//$(".buy-button>.cart").click(function(e){
//	$ele = $(this);
//	$.ajax({
//		type:"get",
//		url:"data/user/islogin.php",
//		async:true,
//		dataType: "json",
//		success: function(data){
//			if(data.ok == 1){
//				//查找产品ID号
//				var index = location.search.indexOf("=");
//				var pid = parseInt(location.search.slice(index + 1));
//				//查找数量
//				var inputEle = $ele.parent().siblings(".count").find(".num");
//				var count = parseInt(inputEle.val());
//				$.ajax({
//					type:"post",
//					url:"data/cart/addCart.php",
//					async:true,
//					data: {pid, count},
//					dataType: "json",
//					success: function(data){
//						loadCart();
//					},
//					error: function(){
//						alert("添加购物车失败");
//					}
//				});
//			}
//			else{
//				location.href = "login.html?back=" + location.href;
//			}
//		},
//		error: function(){
//			alert("网络错误，请检查后重试！");
//		}
//	});
//})