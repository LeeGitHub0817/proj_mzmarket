<?php
	require_once("../init.php");
	@$uname = $_REQUEST["uname"];
	@$upwd1 = $_REQUEST["upwd1"];
	@$upwd2 = $_REQUEST["upwd2"];
	@$phone = $_REQUEST["phone"];
	@$email = $_REQUEST["email"];
	@$username = $_REQUEST["username"];
	@$sex = $_REQUEST["sex"];
	
	if($uname&&$upwd1&&$upwd2&&$phone&&$email&&$username&&$sex!==null){
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
		//参数验证
		$regUname = '/^[a-zA-Z0-9]{4,18}$/';
		if(!preg_match($regUname, $uname)){
			die('{"code":-1,"msg":"请输入4-18位数字字母组合用户名"}');
		}
		$regUpwd = '/^[a-zA-Z0-9]{6,12}$/';
		if(!preg_match($regUpwd, $upwd1)){
			die('{"code":-1,"msg":"请输入6-12位数字字母组合密码"}');
		}
		if($upwd1 !== $upwd2){
			die('{"code":-1,"msg":"前后密码不一致"}');
		}
		$regPhone = '/^1[35789]\d{9}$/';
		if(!preg_match($regPhone, $phone)){
			die('{"code":-1,"msg":"请输入合法的手机号码"}');
		}
		$regEmail = '/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$/';
		if(!preg_match($regEmail, $email)){
			die('{"code":-1,"msg":"请输入合法的邮箱地址"}');
		}
		$regUserName = '/^[a-zA-Z\x80-\xff]{2,}$/'; //\u4e00-\u9fa5(php中不支持\u匹配)
		if(!preg_match($regUserName, $username)){
			die('{"code":-1,"msg":"请输入正确的用户姓名"}');
		}
//		$regSex = '/^(-)?[0-1]$/';
//		if(!preg_match($regSex, $sex)){
//			die('{"code":-1,"msg":"性别参数不正确"}');
//		}
		
		//向数据库写入注册信息
		$sql = "INSERT INTO mz_user VALUES(null,'$uname',md5('$upwd1'),'$phone','$email',null,'$username',$sex)";
		$result = mysqli_query($conn, $sql);
		if(mysqli_error($conn)){
			echo mysqli_error($conn);
		}
		if($result){
			echo '{"code":1,"msg":"注册成功"}';
		}
		else{
			echo '{"code":-1,"msg":"注册失败"}';
		}
	}
	else{
		echo '{"code":-1,"msg":"有未填完项目，请检查后重试！"}';
	}
?>