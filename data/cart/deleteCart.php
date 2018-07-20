<?php
	require_once("../init.php");
	$sid = $_REQUEST["sid"];
	$sql = "DELETE FROM mz_shoppingcart_item WHERE sid=$sid";
	if($sid != null){
		$result = mysqli_query($conn, $sql);
		if(mysqli_error($conn)){
			echo mysqli_error($conn);
		}
		echo '{"code": 1, "msg": "success"}';
	}
?>