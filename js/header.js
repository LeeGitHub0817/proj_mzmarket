(function(){
	$.ajax({
		type:"get",
		url:"header.html",
		success: function(html){
			$("#header").html(html);
			
			//下拉菜单事件绑定
			$("#header>.header-container>ul.two").on("mouseenter", "li.menu-sub", function(e){
				e.preventDefault();
				$(this).find(".header-sub").addClass("active").find("li").addClass("active");
				
			});
			$("#header>.header-container>ul.two").on("mouseleave", "li.menu-sub", function(e){
				e.preventDefault();
				$(this).find(".header-sub").removeClass("active").find("li").removeClass("active");
			});
			
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
			})
			//登录按钮事件
			$("#btn-login").click(function(e){
				e.preventDefault();
				location.href = "login.html?back=" + location.href;
			})
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
			
			//封装一个购物车加载函数
			function loadCart(){
				$.ajax({
					type:"get",
					url:"data/user/islogin.php",
					async:true,
					dataType: "json",
					success: function(data){
						if(data.ok == 1){
							$.ajax({
								type:"get",
								url:"data/cart/getCart.php",
								async:true,
								dataType: "json",
								success: function(data){
									if(data.length > 0){
										var buyCount = 0;
										for(var item of data){
											buyCount += parseInt(item.count);
										}
										$("#header>.header-container .showCartNum").html(buyCount);
										var html = "<p>最近加入的商品</p>";
										for(var item of data){
											html += `<div class="pro-detail">
												<div class="img">
													<a href="product_detail.html?pid=${item.pid}"><img src="${item.sm}"/></a>
												</div>
												<div class="info">
													<p>${item.pname}</p>
													<p>${item.spec}</p>
												</div>
												<div class="option">
													<p>${item.price}*${item.count}</p>
													<p><a data-sid="${item.sid}" id="delete-now" href="#">删除</a></p>
												</div>
											</div>`;
										}
										html += `<div class="im-buy">
												<span>共<strong>${item.count}</strong>商品</span>
												<span class="gocart">去购物车</span>
											</div>`;
										$(".common-cart .store-cart").html(html);
										//去购物车
										$(".gocart").click(function(){
											location.href = "cart.html";
										});										
									}
									else{
										$(".common-cart .store-cart").html(`<div style="text-align: center; position: relative; top: 40px">
											<h3>亲,购物车中还没有商品呢~>_<~</h3>
										</div>`);
									}
								}
							});
						}
					},
					error: function(){
						alert("网络错误，请检查后重试！");
					}
				});
			}
			loadCart();
			
			//加入购物车
			$(".buy-button>.cart").click(function(e){
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
									loadCart();
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
			})
			
			//鼠标放在购物车上
			$("#cart-button").mouseenter(function(){
				$(".common-cart .store-cart").show();
			}).mouseleave(function(){
				$(".common-cart .store-cart").hide();
			})
			//删除按钮事件绑定
			$(".store-cart").on("click", "#delete-now", function(e){
				e.preventDefault();
				var $ele = $(this);
				console.log($ele);
				var sid = $ele.attr("data-sid");
				$.ajax({
					type:"get",
					url:"data/cart/deleteCart.php",
					async:true,
					data: {sid},
					dataType: "json",
					success: function(){
						loadCart();
					}
				});
			});
		}
	});
})();
