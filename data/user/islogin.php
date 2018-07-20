<?php
	require("../init.php");
	session_start();
	@$uid = $_SESSION["uid"];
	if($uid != null){
		$sql = "SELECT uname,avator FROM mz_user WHERE uid='$uid'";
		$result = mysqli_query($conn, $sql);
		if(mysqli_error($conn)){
			echo mysqli_error($conn);
		}
		$data = mysqli_fetch_all($result, 1);
		echo json_encode(["ok"=>1, "info"=>$data[0]]);
	}
	else{
		echo json_encode(["ok"=>0]);
	}
?>