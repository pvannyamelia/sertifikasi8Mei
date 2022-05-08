<?php
include '../../template/dbConnect.php';

$sql = "DELETE FROM Product WHERE id_product=".$_GET['product'];
echo $sql;
if ($result = mysqli_query($con, $sql))
{
    if($con->affected_rows == 1) {
        $response = array( "status" => "200", "message" => "Product deleted!");
    } else {
        $response = array( "status" => "400", "message" => "Failed to delete product, try again.");
    }
    echo json_encode($response);
}

include '../../template/closeDbConnect.php';