<?php
include "../functions/db.php";
  if(isset($_GET['post_Id'])){
		$id = $_GET['post_Id'];
	}
	if(empty($id)){
		header("location:index.php");
	}

	$run = mysqli_query($con,"DELETE FROM tblpost WHERE post_Id = '$id' and voided = 0")
	or die(mysqli_error($con));  	

	header("Location:post.php");
	
?>