<?php
 
 $ID=$_GET['id'];

//MySQL database Connection

include 'conn.php';


$result=[];

$SELECT=$connect->query("SELECT DISTINCT businees_work.*,customers.name FROM businees_work,customers WHERE  customers.customer_id=businees_work.customers_id and customers.customer_id='{$ID}'");

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
