<?php
include '../../template/dbConnect.php';

$sql = "SELECT password, is_admin FROM Customer WHERE username='".$_POST['username']."'";

if ($result = mysqli_query($con, $sql))
{
    $resultArr = $result->fetch_assoc();
    if($resultArr != null) {
        if(sha1($_POST['password'])==$resultArr['password']) {
            $response = array( "status" => "200", "message" => "Password match!", "is_admin" => $resultArr['is_admin']);
        } else {
            $response = array("status" => "400", "message" => "Username & password doesn't match.", "is_admin" => $resultArr['is_admin']);
        }
    } else {
        $response = array("status" => "400", "message" => "User not found.", "is_admin" => "0");
    }
    
    echo json_encode($response);
}

include '../../template/closeDbConnect.php';