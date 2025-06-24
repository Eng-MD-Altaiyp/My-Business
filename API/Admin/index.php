<?php


$unameer=$passworder=$conn="";
$welcome="Welcome 👋";
if(isset($_POST['submit']))
{
    $uname=$_POST['username'];
    $password=$_POST['password'];



    if(
     empty($uname) || 
       empty($password)
       )
    {
        if(empty($uname))
        {$unameer="* User Name is Required"; 
            $welcome="To Focus 🥲";
        }
        if(empty($password))
        {$passworder="* Password  is Required";
            $welcome="To Focus 🥲";
        }
    }
    else{
        $check=0;
         if($uname && !preg_match("/^[a-zA-Z]/",$uname))
         {
            $check++;
            $unameerer="* Make sure not to enter numbers";
         }
         if($check==0)
         {
            // Navigetor for Home 
            include 'All Page\conn.php';
            if($con){
                $search="SELECT uname,password FROM admin WHERE uname='{$uname}' and password='{$password}'";
                $res=$con->query($search);
                
                if($res->num_rows>0){
                 session_start();
                 $_SESSION['username']=$uname;
                 $_SESSION['password']=$password;
                   echo header("location: All Page/HOME.php");
                }
                else
                {
                   $welcome="Error 😓";
                }
            }else{
                $conn="Connection Failed";
            }
           
        }

    }

}

//$Gender=$_POST['gen'];

?>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="X-UA-Compatible" content="ie=edge" />
		<link rel="stylesheet" href="login/css/style.css" />
		<title>Welcome</title>
        <style>
            
.error{
    position: absolute;
    bottom: 8px;
    left: 18px;
    font-size: 11px;
    font-family: Avenir;
    width: 200px;
    color: #af1616;
}
        </style>
    
		<div class="background">
            <div class="con">
            <?php echo $conn; ?>
            </div>
            <div class="form-card">
                <div class="form-title">
                <?php echo $welcome; ?>
                </div>

                <div class="form-subtitle">
                    Select your username and password to get started
                </div>

                    <form action="#" method="POST">
                        <div class="auth">
                        <div class="auth-label">Username</div>
                        <input type="text" class="auth-input" name="username" />
                        <div class="error"><?php echo $unameer; ?></div>

                    </div>
                    <div class="auth">
                        <div class="auth-label">Password</div>
                        <input type="password" class="auth-input" name="password" />
                        <div class="error"><?php echo $passworder; ?></div>

                    </div>
                    <input type="submit" value="Log In" name="submit" class="auth-button">
                    </form>
            </div>
		</div>
	</body>
</html>