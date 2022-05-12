<?php
include '../../template/dbConnect.php';

// update product table
$sql = "UPDATE Product SET available=1 WHERE id_product=".$_POST['id_product'];
mysqli_query($con, $sql);

$today = date('d-m-Y');
$sql = "UPDATE `Transaction` SET return_date='".$today."' WHERE id_transaction=".$_POST['id_transaction'];
mysqli_query($con, $sql);

if($con->affected_rows == 1) {
    $response = array( "status" => "200", "message" => "Product return succeed!");
} else {
    $response = array( "status" => "400", "message" => "Failed while running return request, try again.");
}
echo json_encode($response);

include '../../template/closeDbConnect.php';