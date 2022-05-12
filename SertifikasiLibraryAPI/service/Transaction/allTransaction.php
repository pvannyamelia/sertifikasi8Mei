<?php
include '../../template/dbConnect.php';

$sql = "SELECT p.product_name, t.id_transaction, t.id_product, t.borrow_date, t.deadline, t.return_date FROM `Product` as p, `Transaction` as t WHERE t.id_product = p.id_product";

if ($result = mysqli_query($con, $sql))
{
	// Create a results array and a temporary one
	// to hold the data
	$resultArray = array();
	$tempArray = array();
 
	// Loop through each row in the result set
	while($row = $result->fetch_object())
	{
		// Add each row into our results array
		$tempArray = $row;
	    array_push($resultArray, $tempArray);
	}
 
	// Finally, encode the array to JSON and output the results
	echo json_encode($resultArray);
}

include '../../template/closeDbConnect.php';