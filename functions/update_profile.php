<?php
include "db.php";
if(isset($_POST['update_profile'])){
    $user_id = $_POST['user_Id'];
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];
    $gender = $_POST['gender'];
    $age = $_POST['age'];
    $location = $_POST['location'];
    $phone_number = $_POST['phone_number'];
    $update_profile = mysqli_query($con, "UPDATE tbluser SET fname = '$fname',
                        lname = '$lname', gender = '$gender', age = '$age',
                        location = '$location', phone_number = '$phone_number'
                        WHERE user_Id = '$user_id'");
    if($update_profile){
        header("Location: ../pages/profile.php?user_Id=$user_id");
        //echo 'Hello World';
    } else {
        echo mysqli_error($con);
    }
}
?>