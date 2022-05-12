<?php
include '../../template/dbConnect.php';

if(empty(trim($_POST['id_ctg'])) || empty(trim($_POST['product_name']))){
    $response = array( "status" => "400", "message" => "Category and Product Name must be filled.");
} else {
    $sql = "INSERT INTO Product (id_ctg, product_name) VALUES (".$_POST['id_ctg'].", '".$_POST['product_name']."')";
    if ($result = mysqli_query($con, $sql))
    {
        if($con->affected_rows == 1) {
            $response = array( "status" => "200", "message" => "Product added!", "product_id" => mysqli_insert_id($con));
        } else {
            $response = array( "status" => "400", "message" => "Failed to add product, try again.", "product_id" => "");
        }
    }
}

echo json_encode($response);
include '../../template/closeDbConnect.php';