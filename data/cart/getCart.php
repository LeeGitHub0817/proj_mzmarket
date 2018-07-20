<?php
require_once("../init.php");
session_start();
$uid = $_SESSION["uid"];
$cart = [];
if($uid != null){
	$sql = "select *, (select sm from mz_product_pic where product_id = pid limit 1)
		as sm from mz_shoppingcart_item inner join mz_product on product_id = pid where user_id = $uid";
	$result = mysqli_query($conn, $sql);
	if(mysqli_error($conn)){
		echo mysqli_error($conn);
	}
	$cart = mysqli_fetch_all($result, 1);
}
echo json_encode($cart);