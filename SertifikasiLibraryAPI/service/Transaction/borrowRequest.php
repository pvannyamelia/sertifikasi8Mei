<?php
include '../../template/dbConnect.php';

$sql = "SELECT available FROM Product WHERE id_product=".$_POST['id_product'];
if ($result = mysqli_query($con, $sql))
{
    if ($result->fetch_assoc()['available'] == 0) {
        $response = array( "status" => "400", "message" => "Product unavailable.");
    } else {
        // update product table
        $sql = "UPDATE Product SET available=0 WHERE id_product=".$_POST['id_product'];
        mysqli_query($con, $sql);

        $today = date('d-m-Y');
        $nextWeek = date("d-m-Y", strtotime("+1 week"));
        $sql = "INSERT INTO `Transaction` (id_product, borrow_date, deadline) VALUE (".$_POST['id_product'].", '".$today."', '".$nextWeek."')";
        mysqli_query($con, $sql);
        
        if($con->affected_rows == 1) {
            $response = array( "status" => "200", "message" => "Borrow request succeed!");
        } else {
            $response = array( "status" => "400", "message" => "Failed to create borrow request, try again.");
        }
    }
    echo json_encode($response);
}

include '../../template/closeDbConnect.php';