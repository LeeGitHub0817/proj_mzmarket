<?php
	require_once("../init.php");
	$sql = "SELECT * FROM mz_index_carousel";
	$result = mysqli_query($conn, $sql);
	if(mysqli_error($conn)){
		echo mysqli_error($conn);
	}
	$data = mysqli_fetch_all($result, 1);
	echo json_encode($data);
