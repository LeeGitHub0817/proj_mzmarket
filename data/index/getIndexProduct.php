<?php
	require_once("../init.php");
	$output = [
		"hot"=>[],
		"phone"=>[],
		"smart"=>[]
	];
	$sql = "SELECT * FROM mz_index_product WHERE floortype=1";
	$result = mysqli_query($conn, $sql);
	if(mysqli_error($conn)){
		echo mysqli_error($conn);
	}
	$output["hot"] = mysqli_fetch_all($result, 1);
	
	$sql = "SELECT * FROM mz_index_product WHERE floortype=2";
	$result = mysqli_query($conn, $sql);
	if(mysqli_error($conn)){
		echo mysqli_error($conn);
	}
	$output["phone"] = mysqli_fetch_all($result, 1);
	
	$sql = "SELECT * FROM mz_index_product WHERE floortype=3";
	$result = mysqli_query($conn, $sql);
	if(mysqli_error($conn)){
		echo mysqli_error($conn);
	}
	$output["smart"] = mysqli_fetch_all($result, 1);
	
	echo json_encode($output);
	
?>