<?php
 
 $ID=1;

//MySQL database Connection

include 'conn.php';

$request=0;
$result=[];

$SELECT=$connect->query("SELECT DISTINCT businees_work.*,customers.name FROM businees_work,customers WHERE  customers.customer_id=businees_work.customers_id and customers.customer_id='{$ID}'");

if($SELECT)
{
	while(
		$row=mysqli_fetch_assoc($SELECT)
	)
	{
		$request+=$row['request'];
	}
    $result[]=$request;
	echo json_encode($result);
}



?>
