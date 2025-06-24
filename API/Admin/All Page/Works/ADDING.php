<?php

include '../conn.php';

if(isset($_POST['ADD']))
{
    $name=$_POST['Name'];
    $number=$_POST['Number'];
    $rdate=$_POST['rDate'];
    $ddate=$_POST['dDate'];
    $price=(int)$_POST['price'];
    $note=$_POST['note'];
    $Customer=$_POST['Customer'];
    $Type=$_POST['Type'];
    $request=(int)$_POST['request'];



    $sql="SELECT * FROM businees_work WHERE work_name='{$name}'
    and price='{$price}' and number=$number
     and type='{$Type}'";
    $res=$con->query($sql);
    
    if($res->num_rows>0){
      $row=$res->fetch_assoc();

      errors();
                                         //$result['loginStatus']='Exisiting';      
    }else{
      








      $search1="SELECT * FROM customers WHERE name='{$Customer}' ";
      $res=$con->query($search1);
      $sqlq1=mysqli_query($con,$search1);
      if($sqlq1)
      {
        if($res->num_rows>0){
            
          while($w=mysqli_fetch_assoc($sqlq1))
          {
          










      //$Price_Work+=1000;
      $insert="INSERT INTO businees_work SET 
      work_name='{$name}',
      price='{$price}',
      ddate='{$ddate}',
      rdate='{$rdate}',
      type='{$Type}',
      note='{$note}',
      customers_id='$w[customer_id]',
      request=$request,
      number=$number
      ";
        $Sql=mysqli_query($con,$insert);
        if($Sql||$Sql1)
        { 
            good();
          //$result['loginStatus']=true;     
        }
       else
       {
        errors();
         // $result['loginStatus']=false;
       }      
      }
    }
}
      }
    
}




?>




<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <title>Add New Book</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <style>
    .alert-clickable {
      cursor: pointer;
    }
  </style>
</head>
<body>
    <div class="container my-5">
    <header class="d-flex justify-content-between my-4">
            <h1>Add New Work</h1>
            <div>
            <a href="../HOME.php" class="btn btn-primary">Back</a>
            </div>
        </header>
        <?php
        function errors()
        {
            ?>
             <div class="alert alert-warning alert-dismissible fade show alert-clickable">
      <button type="button" class="close">&times;</button>
      <strong>تحذير!</strong> هذه رسالة تحذيرية.
    </div>
            <?php
        }
         function good()
        {
            ?>
             <div class="alert alert-warning alert-dismissible fade show alert-clickable">
      <button type="button" class="close">&times;</button>
      <strong>تحذير!</strong> هذه رسالة تحذيرية.
    </div>
            <?php
        }
        ?>

        <form action="#" method="POST">

        <div class="form-elemnt my-4">
                <select name="Customer" id="" class="form-control" required>
                    <option value="">Select Customer :</option>
                    
                    <?php


$search1="SELECT * FROM customers";
$res=$con->query($search1);
$sqlq1=mysqli_query($con,$search1);
if($sqlq1)
{
	if($res->num_rows>0){
      
		while($w=mysqli_fetch_assoc($sqlq1))
		{
		?>
        <option value="<?php echo $w['name'];?>"><?php echo $w['name'];?></option>
        <?php
		}
	  }
	  else
	  {
		?>
                            <option value="">NULL</option>

        <?php
	  }

}   


?>
                </select>
            </div>

            <div class="form-elemnt my-4">
                <input type="text" class="form-control" name="Name" placeholder="Work Name :" required>
            </div>
            <div class="form-elemnt my-4">
                <input type="number" class="form-control" name="Number" placeholder="The Number Of Beneficiaries :" required>
            </div>
            <div class="form-elemnt my-4">
                <select name="Type" id="" class="form-control" required>
                    <option value="">Select Book Type:</option>
                    <option value="Adventure">Adventure</option>
                    <option value="Crime">Crime</option>
                    <option value="Fantasy">Fantasy</option>
                    <option value="Horror">Horror</option>
                    <option value="Horror">Horror</option>
                </select>
            </div>
            <div class="form-elemnt my-4">
                <input type="date" class="form-control" name="rDate" placeholder="Received Date :" required>
            </div>

            <div class="form-elemnt my-4">
                <input type="date" class="form-control" name="dDate" placeholder="Delivary Date :" required>
            </div>

            
            <div class="form-elemnt my-4">
                <input type="text" class="form-control" name="price" placeholder="The Agreed Amount :" required>
            </div> 
            <div class="form-elemnt my-4">
                <input type="text" class="form-control" name="request" placeholder="The Request :" required>
            </div>
        
            <div class="form-element my-4">
                <textarea name="note" id="" class="form-control" placeholder="Book Description:" required></textarea>
            </div>
            <div class="form-element my-4">
                <input type="submit" name="ADD" value="Add Work" class="btn btn-primary">
            </div>
        </form>
        
        <div class="alert alert-danger mt-4" id="errorMessage" style="display: none;">
            Please fill in all fields.
        </div>
        
    </div>
    
    <script>
        document.querySelector('form').addEventListener('submit', function(event) {
            const inputs = document.querySelectorAll('input, select, textarea');
            let isValid = true;
            
            inputs.forEach(function(input) {
                if (input.required && !input.value.trim()) {
                    isValid = false;
                    input.classList.add('is-invalid');
                }
                else {
                    input.classList.remove('is-invalid');
                }
            });
            
            if (!isValid) {
                event.preventDefault();
                document.getElementById('errorMessage').style.display = 'block';
            }
        });
    </script>
    
</body>
</html>
