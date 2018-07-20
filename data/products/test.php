<?php
	require_once("../init.php");
	$picSql = "SELECT sm,md FROM mz_product_pic WHERE product_id = 1 LIMIT 0,1";
	$picResult = mysqli_query($conn, $picSql);
	$pic = mysqli_fetch_all($picResult, 1);
	echo json_encode($pic[0]);
?>