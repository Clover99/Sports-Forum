<?php
		include "db.php";
        $comment = mysqli_real_escape_string($con,$_POST['comment']);
        $userid = $_POST['userid'];
        $postid = $_POST['postid'];
        date_default_timezone_set("Asia/Taipei");
        $datetime=date("Y-m-d h:i:sa");
        
        if(mysqli_query($con,"Insert into tblcomment (comment,post_Id,user_Id,datetime) values ('$comment','$postid','$userid','$datetime') ")){
            header('location:../pages/content.php?post_id='.$postid);
            }else{
                echo "reply unsuccessful";
            }
        


              ?>