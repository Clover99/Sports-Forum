<?php
  session_start();
  ini_set('display_errors', 1);
  if (isset($_SESSION['username'])&&$_SESSION['username']!=""){
  }
  else
  {
    header("Location:../index.php");
  }
$username=$_SESSION['username'];
$userid = $_SESSION['user_Id'];
  include "../functions/db.php";
                     $id = $_GET['post_id'];
                    
?>
<html>
<head>
	<title></title>

	<!--Custom CSS-->
	<link rel="stylesheet" type="text/css" href="../css/global.css">
	<!--Bootstrap CSS-->
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">

    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <!--Script-->
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function($){
            
        });
    </script>
    <style type="text/css">
        .footer{
            margin-left: 900px;           
        }
    </style>

</head>
<body>
	<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="home.php"></a>
            </div>
            <div class="navbar-header">
                <a class="navbar-brand" href="home.php">Sports Forum</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse">

                <ul class="nav navbar-nav navbar-left">
                    <li><a href="#quest"> Post a Question</a></li>
                </ul>
     				 <ul class="nav navbar-nav navbar-right">
				 <ul class="nav navbar-nav navbar-right">
                         <li><a href="profile.php" ><span class="glyphicon glyphicon-user"></span> <?php echo $username;?></a></li>
                        <li ><a href="logout.php"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                        <li><a href="#"><i class="fab fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                
                </ul>   
               
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    <div class="container" style="margin:7% auto;">
         <div class="panel panel-success ">
                <!-- <div class="panel-heading">
                    <h3 class="panel-title">Latest Discussions</h3>
                </div> -->
                 <div class="panel-body feed">
         
              
                
                            <?php

              
                     
                
                $sql = mysqli_query($con,"SELECT * from tblpost as tp join category as c on c.cat_id=tp.cat_id where tp.post_Id='$id'");
                if($sql==true){
                  while($row=mysqli_fetch_array($sql)){
                    extract($row);
                   // echo $_SESSION['privilege'];
                    if($_SESSION['privilege']=='admin'){
                        
                       echo "<h2>".ucwords($title)."</h2>";                 
                       echo "<p>".$content."</p>";
                       echo '<p>';
                       echo "<span>Posted By: </span> Admin </span>";
                       echo "<span> Under ".$category." Category On </span>";
                       echo "<span>".date('l d M Y', strtotime($datetime))."</span> ";
                       echo '</p>';
                    }
                    else{
                      $sel = mysqli_query($con,"SELECT * from tbluser where user_Id='$userid' ");
                      while($row1=mysqli_fetch_array($sel)){
                        extract($row1);
                       echo "<h2>".ucwords($title)."</h2>";                 
                       echo "<p>".$content."</p>";
                       echo '<p>';
                       echo '<span>Posted By: '.$fname.'&nbsp;'.$lname.'<span>';
                       echo "<span> Under ".$category." Category On </span>";
                       echo "<span>".date('l d M Y', strtotime($datetime))."</span> ";
                       echo '</p>';
                      }
                      
                    }
                    
         
                }
                }else{
                    echo 'some thing wrong happened';
                    
                }
                
              
                    
              ?>

              <br><span>Comments</span><br>
              <div id="comments" class="comments">
                  
              <?php 
              $postid= $_GET['post_id'];
              $sql = mysqli_query($con,"SELECT * from tblcomment as c join tbluser as u on c.user_Id=u.user_Id where post_Id='$postid' order by datetime");
              $num = mysqli_num_rows($sql);
              if($num>0){
              while($row=mysqli_fetch_assoc($sql)){
                    echo "<span>Comment by: </span> ".$row['fname']." ".$row['lname']."<br>";
                     echo '<span class="pull-right">'.date('l d M Y', strtotime($row['datetime'])).'</span>';
                     echo "<p class='well'>".$row['comment']."</p>";
                     $comment_id = $row['comment_id'];
              
                    echo '<div id="reply_loader'.$comment_id.'">';
              
                     
                     $sql2 = mysqli_query($con,"SELECT * from tblreply as c join tbluser as u on c.user_Id=u.user_Id where post_Id='$postid' and comment_id = '$comment_id' order by datetime");
                     $num2 = mysqli_num_rows($sql2);
                        if($num2>0){
                            while($row2=mysqli_fetch_assoc($sql2)){ 
                                echo "<span style='margin-left: 35px;'>Reply by: </span> ".$row2['fname']." ".$row2['lname']."<br>";
                                echo '<span class="pull-right" style="margin-left: 35px;">'.date('l d M Y', strtotime($row2['datetime'])).'</span>';
                                echo "<p class='well' style='margin-left: 35px;'>".$row2['reply']."</p>";
                            }
                          }
                    echo '</div>';
                    
                    $sql3 = mysqli_query($con,"SELECT * from tblrating where comment_id = '$comment_id' and rating_type = 1 and voided = 0  ");
                    $likes = mysqli_num_rows($sql3);
                    
                    $sql4 = mysqli_query($con,"SELECT * from tblrating where comment_id = '$comment_id' and rating_type = 2 and voided = 0  ");
                    $dislikes = mysqli_num_rows($sql4);
                    
                    $sql5 = mysqli_query($con,"SELECT * from tblrating where comment_id = '$comment_id' and rating_type = 1 and user_id = '$userid' and voided = 0  ");
                    $yourlikes = mysqli_num_rows($sql5);
                    
                    $sql6 = mysqli_query($con,"SELECT * from tblrating where comment_id = '$comment_id' and rating_type = 2 and user_id = '$userid' and voided = 0  ");
                    $yourdislikes = mysqli_num_rows($sql6);
                    
                    
                    echo '<div id="rating_loader'.$comment_id.'"><span style="margin-left: 35px;" class="reply_link_'.$comment_id.'" >';
                    if($yourlikes==0){
                            echo '<a href="#" id="like_'.$comment_id.'" ><i class="far fa-thumbs-up"></i>like('.$likes.')</a>';
                        }else{
                            echo 'like('.$likes.')';
                        }
                    echo     '&nbsp;&nbsp;&nbsp;';
                    if($yourdislikes==0){
                            echo '<a href="#" id="dislike_'.$comment_id.'" ><i class="far fa-thumbs-down"></i>dislike('.$dislikes.')</a>';
                        }else{
                            echo 'dislike('.$dislikes.')';
                        }
                    echo '&nbsp;&nbsp;&nbsp;<a href="#" id="reply_'.$comment_id.'">reply</a></span></div>'; 
                    echo '<div id="reply_form_'.$comment_id.'">'; 
                    echo '<form method="POST" action="#" id="replyform'.$comment_id.'" style="margin-left: 35px;">';
                    echo   '<textarea type="text" name="reply'.$comment_id.'" placeholder="Enter reply to comment" class="form-control" id="reply'.$comment_id.'"></textarea><br>';
                    echo '<input type="hidden" name="postid" id="postid'.$comment_id.'" value="'.$_GET['post_id'].'">';
                    echo '<input type="hidden" name="commentid" id="commentid'.$comment_id.'" value="'.$comment_id.'">';
                    echo '<input type="hidden" name="userid" id="userid'.$comment_id.'" value="'.$_SESSION['user_Id'].'">';
                    echo '<input type="submit" id="reply_submit'.$comment_id.'" class="btn btn-success pull-right" value="Reply">';
                    echo '<br>';
                    echo '</form>';
                    echo '</div>';
                    
                    //jqeury to hide reply input box when diplaying posts
                    echo '<script>';
                    echo '$(document).ready(function($){';
                    echo        '$("#reply_form_'.$comment_id.'").hide();';
                    echo                    '$("#reply_'.$comment_id.'").click(function(){
                                             $("reply'.$comment_id.'").focus();    
                                                $("#reply_form_'.$comment_id.'").show();
                                                    return false;
                                             }       
                                );';
                    
                    echo        '$("#reply_submit'.$comment_id.'").click(function(e){
                                    var reply'.$comment_id.' = $("textarea#reply'.$comment_id.'").val();
                                    
                                    if( reply'.$comment_id.' == null || reply'.$comment_id.' == ""){
                                       alert("Please Enter a Reply Before Clicking the Reply Button");
                                       
                                    }else{
                                        $.post("../functions/addreply.php", $("#replyform'.$comment_id.'").serialize(), function(data) {
                                            $("textarea#reply'.$comment_id.'").val("");
                                            $("#reply_form_'.$comment_id.'").hide();    
                                            $("#reply_loader'.$comment_id.'").load("_reply.php?id='.$comment_id.'&post='.$postid.'");
                                         });
                                    }
                                      e.preventDefault();
                                }
                            );';
                    echo '$("#like_'.$comment_id.'").click(function(a){
                                $.post( "_rating.php", { postid: "'.$postid.'", commentid: "'.$comment_id.'", userid: "'.$userid.'", rating_type: "1" } ).done(function(data) {
                                                location.reload();
                                                
                                    });

                                }
                                
                                
                            );';
                    echo '$("#dislike_'.$comment_id.'").click(function(a){
                                $.post( "_rating.php", { postid: "'.$postid.'", commentid: "'.$comment_id.'", userid: "'.$userid.'", rating_type: "2" } ).done(function(data) {
                                                location.reload();
                                                
                                    });

                                }
                                
                                
                            );';
                    echo '});';
                    echo '</script>';    
                    //
              }

            }

              ?>
            </div>
              </div>
          </div>
          <hr>
            <div class="col-sm-5 col-md-5 sidebar">
          <h3>Comment</h3>
          <form method="POST" action="../functions/addcomment.php">
              <textarea type="text" name="comment" class="form-control" id="commenttxt"></textarea><br>
            <input type="hidden" name="postid" id="postid" value="<?php echo $_GET['post_id']; ?>">
            <input type="hidden" name="userid" id="userid" value="<?php echo $_SESSION['user_Id']; ?>">
            <input type="submit" id="comment" class="btn btn-success pull-right" value="Comment">
          </form>
        </div>
    </div>

		<div class="my-quest" id="quest">
            <div> 
                <form method="POST" action="question-function.php">
                        
                         <span>Category</span>
                        <select name="category" class="form-control">
                            <option></option>
                             <option value="Football">Football</option>
                            <option value="Basketball">Basketball</option>
                            <option value="Volleyball">Volleyball</option>
                            <option value="Netball">Netball</option>
                        </select>
                        <span>Topic Title</span>
                        <input type="text" class="form-control" name="title"required>
                        <span>Content</span>
                        <textarea name="content"class="form-control">

                        </textarea>
                       <br>
                        <input type="submit" class="btn btn-success pull-right" value="Post">
                   </form><br>
                <hr>
                  <a href="" class="pull-right">Close</a>
              </div>
        </div>
        <hr>
    <div class="footer" >
		<nav align="center">
			<ul class="nav navbar-nav">
				<li><a href="">About</a></li>
				<li><a href="">Developers</a></li>
				<li><a href="">Terms and Conditions</a></li>
			</ul>
		</nav>
	</div>
</body>
<script>

$("#save").click(function(){
var postid = $("#postid").val();
var userid = $("#userid").val();
var comment = $("#commenttxt").val();
var datastring = 'postid=' + postid + '&userid=' + userid + '&comment=' + comment;
if(!comment){
  alert("Please enter some text comment");
}
else{
  $.ajax({
    type:"POST",
    url: "../functions/addcomment.php",
    data: datastring,
    cache: false,
    success: function(result){
      document.getElementById("commenttxt").value=' ';
      $("#comments").append(result);
    }
  });
}
return false;
})

</script>
</html>