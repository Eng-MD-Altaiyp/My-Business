<?php
 
 $ID=$_GET['id'];

//MySQL database Connection

include 'conn.php';

$price=0;
$request=0;
$Residual=0;
$result=[];

$SELECT=$connect->query("SELECT DISTINCT businees_work.*,customers.name FROM businees_work,customers WHERE  customers.customer_id=businees_work.customers_id and customers.customer_id='{$ID}'");

if($SELECT)
{
	while(
		$row=mysqli_fetch_assoc($SELECT)
	)
	{

		$price+=$row['price'];
		$request+=$row['request'];
		
	}
	$Residual=$price-$request;

    $Update="UPDATE total_request SET to_request='{$request}' , to_total='{$price}' ,residual='{$Residual}' WHERE id=1 ";
    $Command = mysqli_query($connect,$Update);
    
if($Command)
{

	$SELECT=$connect->query("SELECT * FROM total_request ");

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
	}
else
{
	echo "noooooooooooo";
}
	
	
}



?>
