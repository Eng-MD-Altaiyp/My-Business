<?php
 

//MySQL database Connection

include 'conn.php';


$result=[];



$search1="SELECT customer_id,name FROM customers";
$res=$connect->query($search1);
$sqlq1=mysqli_query($connect,$search1);
if($sqlq1)
{
	if($res->num_rows>0){
      
		while($w=mysqli_fetch_assoc($sqlq1))
		{
		$result[]=$w;
		}
	  }
	  else
	  {
		$result=null;
	  }

}   

echo json_encode($result);


?>
