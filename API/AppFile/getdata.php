<?php
 
$Type=$_GET['type'];


//MySQL database Connection

include 'conn.php';


$result=[];

$SELECT=$connect->query("SELECT DISTINCT businees_work.*,customers.name FROM businees_work,customers WHERE businees_work.type='{$Type}' AND customers.customer_id=businees_work.customers_id");

if($SELECT)
{
	while(
		$row=mysqli_fetch_assoc($SELECT)
	)
	{
		$result[]=$row;
	}
	echo json_encode($result);
}




?>
