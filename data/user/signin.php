<?php
	require_once("../init.php");
	@$uname = $_REQUEST["uname"];
	@$upwd = $_REQUEST["upwd"];
	
	if($uname&&$upwd){
		$regUname = '/^[a-zA-Z0-9]{4,18}$/';
		if(!preg_match($regUname, $uname)){
			die('{"code":-1,"msg":"请输入4-18位数字字母组合用户名"}');
		}
		$regUpwd = '/^[a-zA-Z0-9]{6,12}$/';
		if(!preg_match($regUpwd, $upwd)){
			die('{"code":-1,"msg":"请输入6-12位数字字母组合密码"}');
		}
		$sql = "SELECT uid FROM mz_user WHERE uname='$uname' AND upwd=md5('$upwd')";
		$result = mysqli_query($conn, $sql);
		if(mysqli_error($conn)){
			echo mysqli_error($conn);
		}
		$row = mysqli_fetch_row($result);
		if($row){
			session_start();
			$_SESSION["uid"] = $row[0];
			echo '{"code":1,"msg":"登录成功！"}';
		}
		else{
			echo '{"code":-1,"msg":"登录失败，请检查用户名和密码后重试"}';
		}
	}
	else{
		echo '{"code": -1,"msg":"请输入用户名和密码"}';
	}
?>