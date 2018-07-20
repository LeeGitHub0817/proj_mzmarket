<?php
	require_once("../init.php");
	session_start();
	$user_id = $_SESSION["uid"];
	$is_checked = $_REQUEST["is_checked"];
	
	if($is_checked != null){
		$sql = "UPDATE mz_shoppingcart_item SET is_checked=$is_checked WHERE user_id=$user_id";
		mysqli_query($conn, $sql);
		if(mysqli_error($conn)){
			echo mysqli_error($conn);
		}
		echo '{"code": 1, "msg": "success"}';
	}