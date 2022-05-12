<?php
include '../../template/dbConnect.php';

$sql = "SELECT * FROM Product_Ctg WHERE id_ctg=".$_GET['ctg'];
if ($result = mysqli_query($con, $sql))
{
    // Create a results array and a temporary one
	// to hold the data
	$resultArray = $result->fetch_object();
	echo json_encode($resultArray);
}

include '../../template/closeDbConnect.php';