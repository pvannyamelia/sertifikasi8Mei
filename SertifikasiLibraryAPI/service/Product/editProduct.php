<?php
include '../../template/dbConnect.php';

if(empty(trim($_POST['id_ctg'])) || empty(trim($_POST['product_name']))){
    $response = array( "status" => "400", "message" => "Category and Product Name must be filled.");
} else {
    $sql = "UPDATE Product SET id_ctg=".$_POST['id_ctg'].", product_name='".$_POST['product_name']."' WHERE id_product=".$_POST['id_product'];
    if ($result = mysqli_query($con, $sql))
    {
        if($con->affected_rows == 1) {
            $response = array( "status" => "200", "message" => "Product change saved!");
        } else {
            $response = array( "status" => "400", "message" => "Failed to update product, try again.");
        }
    }
}
echo json_encode($response);
include '../../template/closeDbConnect.php';