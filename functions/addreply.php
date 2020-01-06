<?php
		include "db.php";
        $commentid = $_POST['commentid'];        
        $reply = mysqli_real_escape_string($con,$_POST['reply'.$commentid]);
        $userid = $_POST['userid'];
        $postid = $_POST['postid'];
        
        //date_default_timezone_set("Africa/Blantyre");
        //$datetime=date("Y-m-d h:i:sa");
        if(mysqli_query($con,"Insert into tblreply (reply,comment_id,post_Id,user_Id,datetime) values ('$reply','$commentid','$postid','$userid', now()) ")){
                header('location:../pages/content.php?post_id='.$postid);
            }else{
                echo "reply unsuccessful";
            }

	 


              ?>