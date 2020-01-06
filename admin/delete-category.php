<?php
include "../functions/db.php";
  if(isset($_GET['cat_id'])){
		$id = $_GET['cat_id'];
	}
	if(empty($id)){
		header("location:index.php");
	}

	$run = mysqli_query($con,"DELETE FROM category WHERE cat_id = '$id' and voided = 0")
	or die(mysqli_error($con));  	

	header("Location:category.php");
	
?>