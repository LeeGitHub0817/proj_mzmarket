(function(){
	function loadPage(pno){
		var kw;
		if(location.search.indexOf("kw=") != -1){
			kw = location.search.split("=")[1];		
		}
		else{
			kw = '';
		}
		$.ajax({
			type:"get",
			url:"data/products/getProductByKw.php",
			async:true,
			data: "pno="+pno+"&kw="+kw,
			dataType: "json",
			success: function(data){
				console.log(data);
				//显示内容
				var {count, pageCount, pageNo, pageSize, products} = data;
				console.log(products);
				if(products.length != 0){
					var html = "";
					for(var item of products){
						html += `<li>
							<a href="product_detail.html?pid=${item.pid}">
								<div class="imgs"><img src="${item.pic.md}" alt="${item.pname}"/></div>												
								<h5>${item.pname}</h5>
								<p class="one">${item.subtitle}</p>
								<p class="two">${item.spec}</p>
								<div class="price"><small>￥</small><span>${item.price}</span></div>
							</a>
						</li>`;
					}
					$("#result>.result-list>.list-container").html(html);
					//显示页码
					var htmlPage = "";
					htmlPage = `<a href="#" class="privious">上一页</a>`;
					for(var i = 1; i <= pageCount; i++){
						if(pageNo == i){
							htmlPage += `<a href="#" class="current">${i}</a>`;
						}
						else{
							htmlPage += `<a href="#" class="">${i}</a>`;
						}
					}
					htmlPage += `<a href="#" class="next">下一页</a>`;
					$("#result>.page-container").html(htmlPage);
					
					var aPrev = $("#result>.page-container>a.privious");
					var aNext = $("#result>.page-container>a.next");
					if(pageNo == 1){
						aPrev.addClass("disabled");
					}
					if(pageNo == pageCount){
						aNext.addClass("disabled");
					}
				}
				else{
					var html = `<div style="text-align: center; height: 800px; margin-top: 100px;"><img src="img/noproduct.png"></div>`;
					$("#result>.result-list>ul.list-container").html(html);
				}
			},
			error: function(){
				alert("网络错误，请重试！");
			}
		});
	}
	loadPage(1);
	
	//分页点击事件绑定
	$("#result>.page-container").on("click", "a", function(e){
		e.preventDefault();
		var $elem = $(this);
		if($elem.attr("class").indexOf("disabled") == -1 && $elem.attr("class") != 'current'){
			if($elem.attr("class").indexOf("privious") != -1){
				var pno = parseInt($("#result>.page-container>a.current").html()) - 1;
			}
			else if($elem.attr("class").indexOf("next") != -1){
				var pno = parseInt($("#result>.page-container>a.current").html()) + 1;
			}
			else{
				var pno = parseInt($elem.html());
			}
			loadPage(pno);
		}
	});
})();
