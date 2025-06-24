<?php 

  //MySQL database Connection
  include 'conn.php';



  
  //Received JSON into $json variable
  $json = file_get_contents('php://input');
  
  //Decoding the received JSON and store into $obj variable.
  $obj = json_decode($json,true);
  
  if(isset($obj["uname"]) && isset($obj["password"])){
    
    $uname = mysqli_real_escape_string($connect,$obj['uname']);
    $password = mysqli_real_escape_string($connect,$obj['password']);
    
    //Declare array variable
    $result=[];
    
    //Select Query
    $sql="SELECT * FROM admin WHERE uname='{$uname}' and password='{$password}'";
    $res=$connect->query($sql);
    
    if($res->num_rows>0){
      
      $row=$res->fetch_assoc();
      
      $result['loginStatus']=true;      
      $result["userInfo"]=$row;
      
    }else{
      
      $result['loginStatus']=false;
    }
    
    // Converting the array into JSON format.
    $json_data=json_encode($result);
      
    // Echo the $json.
    echo $json_data;
  }
?>