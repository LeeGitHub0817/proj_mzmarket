<?php
	require_once("../init.php");
	@$uname = $_REQUEST["uname"];
	
	if($uname){
		//参数验证
		$regUname = '/^[a-zA-Z0-9]{4,18}$/';
		if(!preg_match($regUname, $uname)){
			die('{"code":-1,"msg":"请输入4-18位数字字母组合"}');
		}
		//查询用户名是否已经被注册
		$sql = "SELECT uname FROM mz_user WHERE uname='$uname'";
		$result = mysqli_query($conn, $sql);
		if(mysqli_error($conn)){
			echo mysqli_error($conn);
		}
		$row = mysqli_fetch_row($result);
		if($row){
			die('{"code":-1,"msg":"该用户名已被占用！"}');
		}
		else{
			die('{"code":1,"msg":"用户名可以使用！"}');
		}
	}
	else{
		echo '{"code":-1,"msg":"用户名未填写，请检查后重试！"}';
	}

?>