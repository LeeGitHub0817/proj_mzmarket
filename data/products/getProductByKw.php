<?php
	require_once("../init.php");
	$output = [
		"count"=>0,
		"pageSize"=>16,
		"pageCount"=>0,
		"pageNo"=>1,
		"products"=>[]
	];
	@$kw = $_REQUEST["kw"];
	if(!$kw){
		$kw = '';
	}
	@$pno = $_REQUEST["pno"];
	if(!$pno){
		$pno = 1;
	}
	else{
		$pno = intval($pno);
	}
	if($pno != null){
		if($kw !== ''){
			$kws = explode(" ", $kw);
			for($i = 0; $i < count($kws); $i++){
				$kws[$i] = " pname like '%" . $kws[$i] . "%' ";
			}
			$where = implode(" and ", $kws);
			$sql = "SELECT * FROM mz_product WHERE $where";
		}
		else{
			$sql = "SELECT * FROM mz_product";
		}
		//计算总记录数
		$result = mysqli_query($conn, $sql);
		if(mysqli_error($conn)){
			echo mysqli_error($conn);
		}
		$data = mysqli_fetch_all($result, 1);
		$count = count($data);
		$output["count"] = $count;
		//计算总页数
		$pageCount = ceil($count / $output["pageSize"]);
		$output["pageCount"] = $pageCount;
		//查询当前页数据
		$start = ($pno - 1) * $output["pageSize"];
		$pageNum = $output["pageSize"];
		$sql .= " LIMIT $start,$pageNum";	
		$result = mysqli_query($conn, $sql);
		$data = mysqli_fetch_all($result, 1);					
		//查询图片
		for($i = 0; $i < count($data); $i++){
			$pid = $data[$i]["pid"];
			$picSql = "SELECT sm,md FROM mz_product_pic WHERE product_id = $pid LIMIT 0,1";
			$picResult = mysqli_query($conn, $picSql);
			$pic = mysqli_fetch_all($picResult, 1);
			$data[$i]["pic"] = $pic[0];
		}
		$output["products"] = $data;
		$output["pageNo"] = $pno;
		
		echo json_encode($output);				
	}
?>