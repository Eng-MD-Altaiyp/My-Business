<?php 

  //MySQL database Connection
  include 'conn.php';

  //Received JSON into $json variable
  $json = file_get_contents('php://input');
  
  //Decoding the received JSON and store into $obj variable.
  $obj = json_decode($json,true);
  $new_request;
  if(isset($obj["work_id"]) && isset($obj["request"])){
    
    $id = mysqli_real_escape_string($connect,$obj['work_id']);
    $request = mysqli_real_escape_string($connect,$obj['request']);
    
    //Declare array variable

    $result=[];

$search1="SELECT * FROM businees_work WHERE work_id='{$id}' ";
$res=$connect->query($search1);
$sqlq1=mysqli_query($connect,$search1);
if($sqlq1)
{
	if($res->num_rows>0){
      
		while($w=mysqli_fetch_assoc($sqlq1))
		{
      $new_request=$w['request']+$request;
		if($w['price']<$new_request)
    {
      $result['loginStatus']=1;      
    }
    else{
      $Update="UPDATE businees_work SET request='{$new_request}' WHERE work_id='{$id}' ";
    $Command = mysqli_query($connect,$Update);
    
if($Command)
{
    $result['loginStatus']=true;      
}
else
{
    $result['loginStatus']=false;      
}
    }

		}
	  }
	  else
	  {
      $result['loginStatus']=false;      
	  }

    //Select Query
    

    // Converting the array into JSON format.
    $json_data=json_encode($result);
      
    // Echo the $json.
    echo $json_data;
  }
}
?>