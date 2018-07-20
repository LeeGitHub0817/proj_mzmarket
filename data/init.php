<?php
	header("Content-Type:application/json;charset=utf-8");
	$conn = mysqli_connect("localhost", "root", "", "mz", 3306);
	mysqli_query($conn, "SET NAMES UTF8");
?>