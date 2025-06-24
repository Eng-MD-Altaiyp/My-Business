<?php

session_start();

$works=$_GET['work'];
include '..\conn.php';

 function countprice()
{
	include '..\conn.php';
	$connect1=0;
$search="SELECT *FROM businees_work WHERE type='assginmets'";
$sqlq=mysqli_query($con,$search);
if($sqlq)
{
    while($i=mysqli_fetch_assoc($sqlq))
    {
		 
      $connect1+=$i["price"];  
	}
	echo "SU $connect1";
}       
} 
function countwork()
{
	include '..\conn.php';
	$connect=0;
$search="SELECT *FROM businees_work WHERE type='assginmets'";
$sqlq=mysqli_query($con,$search);
if($sqlq)
{
    while($i=mysqli_fetch_assoc($sqlq))
    {
		 
      $connect+=1;  
	}
	echo $connect;
} 
} 




if (isset($_SESSION['username']) && isset($_SESSION['password'])) {

?>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	<!-- My CSS -->
	<link rel="stylesheet" href="../assets/css/style.css">

	<title><?php echo strtoupper($works)."S";?></title>
	<style>
		#content main .head-title .btn-download {
	height: 50px;
	background-image: url("../assets/images/app-bar-background-top.png");
	padding: 0 16px;
	border-radius: 36px;
	display: flex;
	justify-content: center;
	align-items: center;
	grid-gap: 10px;
	font-weight: 500;
}
		.quiz{
			padding:  20px 20px 20px 20px;
			width: 80;
			height: 80;
			background-image: url("../assets/images/app-bar-background-top.png");
			border-radius: 15px;
		}
		.logo1{
			padding: 10px 10px 10px 23px;
			margin: 5px ;
			height: 50px;
			width: 200px;
			background-image: url("../assets/images/app-bar-background-top.png");
			border-radius: 15px;
		}
		.logo2{
			padding:  3px  10px 10px;
			margin: 5px ;
			height: 50px;
			width: 100px;
			background-image: url("../assets/images/app-bar-background-top.png");
			border-radius: 15px;
		}
		#myStore{
			margin: 90px 0px 0px 0px;
		}
        a{
	text-decoration: none;
	color: #ffffff;
         }
		 .price{
	color: #dfb015;
}
	</style>
</head>
<body>


	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand">
			<i class='logo2'>
				<img src="../assets/images/app_logo.png" width="45" height="45" alt="">
			</i>
			<span class="text">
				<div class="logo1">
				MY BUSINESS
		</div>
			</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="#home">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			<li>
				<a href="#myStore">
					<i class='bx bxs-shopping-bag-alt' ></i>
					<span class="text">My Store</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class='bx bxs-doughnut-chart' ></i>
					<span class="text">Analytics</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class='bx bxs-message-dots' ></i>
					<span class="text">Message</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class='bx bxs-group' ></i>
					<span class="text">Team</span>
				</a>
			</li>
		</ul>
		<ul class="side-menu">
			<li>
				<a href="#">
					<i class='bx bxs-cog' ></i>
					<span class="text">Settings</span>
				</a>
			</li>
			<li>
				<a href="../logout.php" class="logout">
					<i class='bx' >
						<img src="../assets/icons/logout.svg" width="20" height="20" alt="">
					</i>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- SIDEBAR -->



	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		<nav >
			<i class='bx bx-menu' ></i>
			<a href="#" class="nav-link">Categories</a>
			<form action="#">
				<div class="form-input">
					<input type="search" placeholder="Search...">
					<button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
				</div>
			</form>
			<input type="checkbox" id="switch-mode" hidden>
			<label for="switch-mode" class="switch-mode"></label>
			<a href="#" class="notification">
				<i class='bx bxs-bell' ></i>
				<span class="num">8</span>
			</a>
			<a href="#" class="profile">
				<img src="../assets/images/me.jpg">
			</a>
		</nav>
		<!-- NAVBAR -->

		<!-- MAIN -->
		<main>
			<div class="head-title" id="home">
				<div class="left">
					<h1>Dashboard</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Dashboard</a>
						</li>
						<li><i class='bx bx-chevron-right' ></i></li>
						<li>
							<a class="active" href="#">Home</a>
						</li>
					</ul>
				</div>
				<a href="#" class="btn-download">
					<i  ><img src="../assets/icons/add-circle.svg" alt=""></i>
					<span class="text">ADD WORKS</span>
				</a>
			</div>

			<ul class="box-info">
				<li>
					<i class='bx' >
						<div class="quiz">
								<img src="../assets/icons/document-text.svg"  height="50" width="50" alt="">
					</div></i>
					<span class="text">
						<h3>

						<?php
						countwork();
				?>
					</h3>
					<h3 style="color: #ffc400;">
					<?php

					countprice();

				?>
					</h3>
						<p>TESTS</p>
					</span>
				</li>

			</ul>

			<div class="table-data" id="">
				<div class="order">
					<div class="head">
						<h3>Recent Orders</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<table>
						<thead>
							<tr>
							<th>Number</th>
							<th>User</th>
								<th>Name Work</th>
								<th>Date Work</th>
								<th>Price</th>
								<th>Request</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							
							<?php

$connect=0;
$search="SELECT DISTINCT businees_work.*,customers.name FROM businees_work,customers WHERE businees_work.type='{$works}' AND customers.customer_id=businees_work.customers_id";
$sqlq=mysqli_query($con,$search);
if($sqlq)
{
    while($i=mysqli_fetch_assoc($sqlq))
    {
		$connect+=1;
       echo '<tr>';
       echo '<td>';
       ?>
       

    <p><?php echo $connect?></p>
       </td>
	   <td><?php  echo $i["name"]?></td>
	   <td><?php  echo $i["work_name"]?></td>
	   <td><?php  echo $i["date"]?></td>
	   <td><?php  echo $i["price"]?></td>
	   <td><?php  echo $i["request"]?></td>
<td><?php 
	  if($i['price']==$i['request'])
	  {
?>
<a href="#">
<img src="<?php 
       echo "../assets/icons/order-sent-successfully.svg";
        ?>"> 
</a>  
<?php
	  }
	  else
	  {

		?>
		<a href="#">
			<img src="<?php 
			   echo "../assets/icons/close-circle.svg";
				?>">
				 </a>  
		<?php
	  }

	  ?></td>	  
	      </tr>
			
		<?php
	}
}        
else

				?>
						</tbody>
					</table>
				</div>
				
			
			</div>
		</main>
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->
	

	<script src="../assets/js/script.js"></script>
</body>
</html>

<?php 
}else{
     header("Location: index.php");
     exit();
}
 ?>