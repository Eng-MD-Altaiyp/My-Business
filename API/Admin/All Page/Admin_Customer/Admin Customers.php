<?php
session_start();

$connect=mysqli_connect("localhost","root","","business");




 function countassprice()
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
function countass()
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

	<title>MY BUSINESS</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
	<style>
        
#content main .table-data .order table tr td .status.delete {
	background:  var(--red);;
}
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
.customer
{
	background-image: url("../assets/images/app-bar-background-top.png");
	padding: 0 16px;
	border-radius: 15px;
	display: flex;
	justify-content: center;
	align-items: center;
	grid-gap: 10px;
	font-weight: 300;
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
				<a href="#" class="logout">
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
					<i class='bx bxs-cloud-download' ></i>
					<span class="text">Download PDF</span>
				</a>
			</div>

			<ul class="box-info">
            <a href="add_customer.php">
            <li>
					<i class='bx' >
						<div class="quiz">
								<img src="../assets/icons/add-circle.svg"  height="50" width="50" alt="">
					</div></i>
					<span class="text">
						<h3>ADD</h3>
					</span>
				</li>
            </a>
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
                                <th></th>
								<th>Customer</th>
								<th>Phone</th>
								<th></th>
                                <th></th>

							</tr>
						</thead>
						<tbody>
							
							<?php


$search="SELECT *FROM customers";
$sqlq=mysqli_query($connect,$search);
if($sqlq)
{
    while($i=mysqli_fetch_assoc($sqlq))
    {
		
       echo '<tr>';
       echo '<td>';
       ?>
       <img src="<?php 
       echo base64_decode($i['image']);
        ?>">
       </td>
       <td><p><?php echo $i["name"]?></p></td>
      <td><?php  echo $i["phone"]?></td>
      <td><span class="status update"><a href="#">Edit</a></span></td>
      <td><span class="status delete"><a href="#">Delete</a></span></td>
       </tr>
			
		<?php
	}
}        
else

				?>
						</tbody>
					</table>
				</div>
				<div class="todo">
					<div class="head">
						<h3>Todos</h3>
						<i class='bx bx-plus' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<ul class="todo-list">
						
						<?php

$search="SELECT *FROM businees_work";
$sqlq=mysqli_query($connect,$search);
if($sqlq)
{
    while($i=mysqli_fetch_assoc($sqlq))
    {
		?>
        <li class="completed">
        <p><?php echo $i['work_name'];?></p>
        <i class='bx bx-dots-vertical-rounded' ></i>
    </li>
    <?php
	}
}        
else

				?>
					</ul>
				</div>
			</div>

			<div class="head-title" id="myStore">
				<div class="left">
					<h1>My Store</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">mmmmmmmmmmmmmmmmmmmmmmm</a>
						</li>
					</ul>
				</div>
				<a href="#" class="btn-download">
					<i class='bx bxs-cloud-download' ></i>
					<span class="text">Download PDF</span>
				</a>
			</div>
			<div class="table-data" >
				<div class="order">
					<div class="head">
						<h3>Recent Orders</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
					<table>
						<thead>
							<tr>
								<th>User</th>
								<th>Date Order</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<img src="../assets/images/me.jpg">
									<p>John Doe</p>
								</td>
								<td>01-10-2021</td>
								<td><span class="status completed">Completed</span></td>
							</tr>
							<tr>
								<td>
									<img src="../assets/images/me.jpg">
									<p>John Doe</p>
								</td>
								<td>01-10-2021</td>
								<td><span class="status pending">Pending</span></td>
							</tr>
							<tr>
								<td>
									<img src="../assets/images/me.jpg">
									<p>John Doe</p>
								</td>
								<td>01-10-2021</td>
								<td><span class="status process">Process</span></td>
							</tr>
							<tr>
								<td>
									<img src="../assets/images/me.jpg">
									<p>John Doe</p>
								</td>
								<td>01-10-2021</td>
								<td><span class="status pending">Pending</span></td>
							</tr>
							<tr>
								<td>
									<img src="../assets/images/me.jpg">
									<p>John Doe</p>
								</td>
								<td>01-10-2021</td>
								<td><span class="status completed">Completed</span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="todo">
					<div class="head">
						<h3>Todos</h3>
						<i class='bx bx-plus' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<ul class="todo-list">
						<li class="completed">
							<p>Todo List</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
						<li class="completed">
							<p>Todo List</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
						<li class="not-completed">
							<p>Todo List</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
						<li class="completed">
							<p>Todo List</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
						<li class="not-completed">
							<p>Todo List</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
					</ul>
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
<!--
<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>Holy guacamole!</strong> You should check in on some of those fields below.
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
-->