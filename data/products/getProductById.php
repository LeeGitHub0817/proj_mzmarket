<?php
	require_once("../init.php");
	@$pid = $_REQUEST["pid"];
    $output = [
        "product"=>[],
        "pics"=>[],
        "specs"=>[]
    ];
	if($pid !== null){
		$pid = intval($pid);
		$regPid = '/^[0-9]{1,}$/';
		if(!preg_match($regPid,$pid)){
			echo("商品编号不正确");
		}
		
		//查询商品表
		$sql = "SELECT pid,family_id,pname,subtitle,spec,price,coupon,details,parameters,qaq FROM mz_product WHERE pid='$pid'";
		$result = mysqli_query($conn, $sql);
		if(mysqli_error($conn)){
			echo mysqli_error($conn);
		}
		$output["product"] = mysqli_fetch_all($result, 1)[0];
		
		//查询图片表
		$sql = "SELECT * FROM mz_product_pic WHERE product_id=$pid";
		$result = mysqli_query($conn, $sql);
		if(mysqli_error($conn)){
			echo mysqli_error($conn);
		}
		$output["pics"] = mysqli_fetch_all($result, 1);
		
		//查询规格信息
		$fid = $output["product"]["family_id"];
		$sql = "SELECT pid,spec,specimg FROM mz_product WHERE family_id=$fid";
		$result = mysqli_query($conn, $sql);
		if(mysqli_error($conn)){
			echo mysqli_error($conn);
		}
		$output["specs"] = mysqli_fetch_all($result, 1);
		
		echo json_encode($output);
	}
?>