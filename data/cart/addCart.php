<?php
	require_once("../init.php");
	session_start();
	$uid = $_SESSION["uid"];
	$pid = $_REQUEST["pid"];
	$count = $_REQUEST["count"];
	if($uid != null && $pid != null && $count != null){
		$sql = "SELECT * FROM mz_shoppingcart_item WHERE user_id=$uid AND product_id=$pid";
		$result = mysqli_query($conn, $sql);
		if(mysqli_error($conn)){
			echo mysqli_error($conn);
		}
		$row = mysqli_fetch_row($result);
		$sid = $row[0];
		if($sid == null){
			$sql = "INSERT INTO mz_shoppingcart_item VALUES(null, $uid, $pid, $count, 1)";
		}
		else{
			$sql = "UPDATE mz_shoppingcart_item SET count=count+$count WHERE sid=$sid";
		}
		$result = mysqli_query($conn, $sql);
		echo '{"code": 1, "msg": "success"}';
	}