<?php
	ob_start();
	session_start();
	require('db.php');
	ini_set('display_errors', 0);
	$userid = $_POST['user_Id'];
	$username = $_POST['username'];
	$_SESSION['expire']='no';
	if($_SERVER['REQUEST_METHOD'] == 'POST'){
		if(empty($_FILES['uploadedfile']['name'])){
			$_SESSION['error']='<script type="text/javascript">
                        alert("Choose the User\'s Image Before Clicking Upload");
                        </script>';
                header('location:../images/avatar/?id='.$userid);    
		}else{					
			$target_path = "../image/avatar/";
		        $basename = "user_".$userid;
					
			$imgName = explode('.', $_FILES['uploadedfile']['name']);
			//echo $imgName[1];
			
			if($_FILES['uploadedfile']['type'] == 'image/pjpeg' || $_FILES['uploadedfile']['type'] == 'image/jpeg' || $_FILES['uploadedfile']['type'] == 'image/png'){
				if($_FILES['uploadedfile']['type'] == 'image/pjpeg' || $_FILES['uploadedfile']['type'] == 'image/jpeg'){
	 				$basename = $basename.".jpg";
					$target_path = $target_path . $basename;
				}else if($_FILES['uploadedfile']['type'] == 'image/png'){
					$basename = $basename.".png";
					$target_path = $target_path . $basename;
				}

				if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $target_path)) {
					$sql = "UPDATE tbluser SET avatar = '$basename', updated_by = '$username', updated_at = now() WHERE user_Id = '$userid'";
					mysqli_query($conn, $sql);
					chmod($target_path, 0777);	
				
					$_SESSION['error']='<script type="text/javascript">
                                        alert("Student\'s Profile Image Uploaded Successfully");
                                        </script>';
                                        header('location:../pages/profile.php/?id='.$userid);   
				}else{					                                     
                                        $_SESSION['error']='<script type="text/javascript">
                                        alert("There was an error uploading the image, please try again!!");
                                        </script>';
                                        //header('location:../pages/profile.php/?id='.$userid);
				} 
			}else{
			       $_SESSION['error']='<script type="text/javascript">
                                           alert("ERROR: Only jpeg or png file format allowed!!");
                                           </script>';
                                header('location:../pages/profile.php/?id='.$userid);
			}
		}
	}
?>
