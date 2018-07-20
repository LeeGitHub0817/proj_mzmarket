<?php
	require_once("../init.php");
	$sid = $_REQUEST["sid"];
	$is_checked = $_REQUEST["is_checked"];
	if($sid != null && $is_checked != null){
		$sql = "UPDATE mz_shoppingcart_item SET is_checked=$is_checked WHERE sid=$sid";
		mysqli_query($conn, $sql);
		if(mysqli_error($conn)){
			echo mysqli_error($conn);
		}
		echo '{"code": 1, "msg": "success"}';
	}
?>