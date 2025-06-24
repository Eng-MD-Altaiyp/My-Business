<?php 

  //MySQL database Connection

  include 'conn.php';

  
  //Received JSON into $json variable
  $json = file_get_contents('php://input');
  
  //Decoding the received JSON and store into $obj variable.
  $obj = json_decode($json,true);


  if(
  isset($obj["name"]) &&
  isset($obj["work_name"]) &&
  isset($obj["price"]) &&
  isset($obj["date"]) &&
  isset($obj["type"])
   ){

    $Customer= mysqli_real_escape_string($connect,$obj['name']);
    $Work_Name = mysqli_real_escape_string($connect,$obj['work_name']);
    $Price_Work = mysqli_real_escape_string($connect,$obj['price']);
    $date = mysqli_real_escape_string($connect,$obj['date']);
    $Type = mysqli_real_escape_string($connect,$obj['type']);
    
    //Declare array variable
    $result=[];
    $result1=[];

    $sql="SELECT * FROM businees_work WHERE work_name='{$Work_Name}'
    and price='{$Price_Work}' and rdate=$date
     and type='{$Type}'";
    $res=$connect->query($sql);
    
    if($res->num_rows>0){
      $row=$res->fetch_assoc();
      $result['loginStatus']='Exisiting';      
      $result["userInfo"]=$row;
    }else{
      








      $search1="SELECT * FROM customers WHERE name='{$Customer}' ";
      $res=$connect->query($search1);
      $sqlq1=mysqli_query($connect,$search1);
      if($sqlq1)
      {
        if($res->num_rows>0){
            
          while($w=mysqli_fetch_assoc($sqlq1))
          {
          










      //$Price_Work+=1000;
      $insert="INSERT INTO businees_work SET 
      work_name='{$Work_Name}',
      price='{$Price_Work}',
      rdate='{$date}',
      ddate='{$date}',
      type='{$Type}',
      customers_id='$w[customer_id]',
      request=0
      ";
        $Sql=mysqli_query($connect,$insert);
        if($Sql||$Sql1)
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
} 
    
    // Converting the array into JSON format.
    $json_data=json_encode($result);
      
    // Echo the $json.
    echo $json_data;
  }
?>