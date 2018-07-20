(function(){
	function loadPage(){
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
							var html = "";
							var sum = 0;
							var sumChecked = 0;
							var total = 0;
							var checkSum = 0;
							for(var item of data){
								var {is_checked, pid, sid, price, pname, spec, sm, count} = item;
								checkSum += parseInt(is_checked);
								sum += parseInt(count);
								if(is_checked == 1){
									total += price * count;
									sumChecked += parseInt(count);
								}
								html += `<tr data-sid="${sid}">
								<td>
									<div id="checkBtn" style="vertical-align: middle;" class="${is_checked!=0 ? "icon-select" : ""}"></div>
								</td>
								<td>
									<a href="product_detail.html?pid=${pid}"><img src="${sm}" alt="" /></a>
								</td>
								<td class="pinfo">
									<p>${pname}</p>
									<p>${spec}</p>
								</td>
								<td>
									<span>${parseFloat(price).toFixed(2)}</span>
								</td>
								<td>
									<div>
										<button class="reduce">-</button>
										<input type="text" name="num" id="num" value="${count}" />
										<button class="add">+</button>
									</div>							
								</td>
								<td>
									<span>${(parseFloat(price * count)).toFixed(2)}</span>
								</td>
								<td>
									<a class="del" href="#">删除</a>
								</td>
							</tr>`;
							}
							$(".cart-body").html(html);
							$(".cart-foot>tr>.two>p>strong:first-child").html(sum);
							$(".cart-foot>tr>.two>p>strong:last-child").html(sumChecked);
							$(".cart-foot>tr>.three>div>span>strong:last-child").html(total);
							if(data.length == checkSum){
								$("#checkAllHead,#checkAllFoot").addClass("icon-select");
							}
							else{
								$("#checkAllHead,#checkAllFoot").removeClass("icon-select");
							}
						},
						error: function(){
							alert("数据请求失败，请检查后重试！");
						}
					});
				}
				else{
					var html = `<div class="cart-empty">
						<div class="cart-empty-content">
							<div class="cart-empty-left">
								<img src="img/notfound.png"/>
							</div>
							<div class="cart-empty-right">
								<h3>你还没有登录</h3>
								<p>登录后可显示您账号中加入的商品哦</p>
								<div><a href="login.html">去登录</a></div>
							</div>
						</div>
					</div>`;
					$("#cart>.cart-container").html(html);
				}
			}
		});
	}
	loadPage();
	//数量加减按钮
	$(".cart-body").on("click", ".reduce,.add", function(e){
		var $ele = $(this);
		var sid = $ele.parent().parent().parent().attr("data-sid");
		var count = parseInt($ele.siblings(":text").val());
		if($ele.html() === "+"){			
			count++;
		}
		if($ele.html() === "-"){
			count--;
			if(count < 1){
				count = 1;
			}
		}
		$.ajax({
			type:"get",
			url:"data/cart/updateCart.php",
			async:true,
			dataType: "json",
			data:{sid, count},
			success: function(){
				loadPage();
			}
		});
	}).on("click", ".del", function(e){ //删除按钮
		e.preventDefault();
		var $ele = $(this);
		var pname = $ele.parent().siblings(".pinfo").find("p:first-child").html();
		var spec = $ele.parent().siblings(".pinfo").find("p:last-child").html();
		if(confirm("是否删除"+pname+" "+spec+"?")){
			var sid = $ele.parent().parent().attr("data-sid");
			$.ajax({
				type:"get",
				url:"data/cart/deleteCart.php",
				async:true,
				data: {sid},
				dataType: "json",
				success: function(){
					loadPage();
				}
			});
		}
	}).on("click", "#checkBtn", function(e){ //是否勾选按钮
		var $check = $(this);
		var sid = $check.parent().parent().attr("data-sid");
		var is_checked = $check.attr("class") ? 0 : 1;
		$.ajax({
			type:"get",
			url:"data/cart/isSelect.php",
			async:true,
			data: {sid, is_checked},
			dataType: "json",
			success: function(data){
				loadPage();
			}
		});
	});
	
	//全选按钮
	$("#checkAllHead").click(function(e){
	    var $ele = $(this);
		var is_checked = $ele.attr("class") ? 0 : 1;
		if(!$ele.attr("class")){
			$ele.addClass("icon-select");
		}
		else{
			$ele.removeClass("icon-select");
		}
		$.ajax({
			type:"get",
			url:"data/cart/isCheckAll.php",
			async:true,
			data: {is_checked},
			dataType: "json",
			success: function(data){
				loadPage();
			}
		});
	})
	$("#checkAllFoot").click(function(e){
	    var $ele = $(this);
		var is_checked = $ele.attr("class") ? 0 : 1;
		if(!$ele.attr("class")){
			$ele.addClass("icon-select");
		}
		else{
			$ele.removeClass("icon-select");
		}
		$.ajax({
			type:"get",
			url:"data/cart/isCheckAll.php",
			async:true,
			data: {is_checked},
			dataType: "json",
			success: function(data){
				loadPage();
			}
		});
	})
})();
