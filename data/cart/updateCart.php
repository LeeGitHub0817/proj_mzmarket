<?php
	require_once("../init.php");
	$sid = $_REQUEST["sid"];
	$count = $_REQUEST["count"];
	
	if($sid != null && $count != null){
		$sql = "UPDATE mz_shoppingcart_item SET count=$count WHERE sid=$sid";
		$result = mysqli_query($conn, $sql);
		if(mysqli_error($conn)){
			echo mysqli_error($conn);
		}
		echo '{"code": 1, "msg": "success"}';
	}
?>