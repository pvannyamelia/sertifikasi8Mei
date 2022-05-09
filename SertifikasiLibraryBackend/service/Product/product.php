<?php
include '../../template/dbConnect.php';

$sql = "SELECT * FROM Product WHERE id_product=".$_GET['product'];
if ($result = mysqli_query($con, $sql))
{
    // Create a results array and a temporary one
	// to hold the data
	$resultArray = $result->fetch_object();
	echo json_encode($resultArray);
}

include '../../template/closeDbConnect.php';