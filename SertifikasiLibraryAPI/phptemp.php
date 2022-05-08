<?php
include '../../template/dbConnect.php';

$sql = "";
if ($result = mysqli_query($con, $sql))
{
    
    echo json_encode($response);
}

include '../../template/closeDbConnect.php';