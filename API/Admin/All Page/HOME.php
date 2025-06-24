<?php
session_start();

$CheckAdmin=false;
include 'conn.php';
$password=$_SESSION['password'];
$uname=$_SESSION['username'];

$searchadmin="SELECT uname,password FROM admin WHERE uname='{$uname}' and password='{$password}' AND id=1";
                $res=$con->query($searchadmin);
                
                if($res->num_rows>0){
					$CheckAdmin=true;
				}
				else
				{
					$CheckAdmin=false;
				}


 function countassprice()
{
	include 'conn.php';
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
	include 'conn.php';
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





function counttesprice()
{
	include 'conn.php';
	$connect1=0;
$search="SELECT *FROM businees_work WHERE type='test'";
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
function counttes()
{
	include 'conn.php';
	$connect=0;
$search="SELECT *FROM businees_work WHERE type='test'";
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


function countproprice()
{
	include 'conn.php';
	$connect1=0;
$search="SELECT *FROM businees_work WHERE type='project'";
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
function countpro()
{
	include 'conn.php';
	$connect=0;
$search="SELECT *FROM businees_work WHERE type='project'";
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

function countexaprice()
{
	include 'conn.php';
	$connect1=0;
$search="SELECT *FROM businees_work WHERE type='exam'";
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
function countexa()
{
	include 'conn.php';
	$connect=0;
$search="SELECT *FROM businees_work WHERE type='exam'";
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



function countquiprice()
{
	include 'conn.php';
	$connect1=0;
$search="SELECT *FROM businees_work WHERE type='quiz'";
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
function countqui()
{
	include 'conn.php';
	$connect=0;
$search="SELECT *FROM businees_work WHERE type='quiz'";
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
	<link rel="stylesheet" href="assets/css/style.css">

	<title>MY BUSINESS</title>
	<style>
		#content main .head-title .btn-download {
	height: 50px;
	background-image: url("assets/images/app-bar-background-top.png");
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
			background-image: url("assets/images/app-bar-background-top.png");
			border-radius: 15px;
		}
		.logo1{
			padding: 10px 10px 10px 23px;
			margin: 5px ;
			height: 50px;
			width: 200px;
			background-image: url("assets/images/app-bar-background-top.png");
			border-radius: 15px;
		}
		.logo2{
			padding:  3px  10px 10px;
			margin: 5px ;
			height: 50px;
			width: 100px;
			background-image: url("assets/images/app-bar-background-top.png");
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
	background-image: url("assets/images/app-bar-background-top.png");
	padding: 0 16px;
	border-radius: 15px;
	display: flex;
	justify-content: center;
	align-items: center;
	grid-gap: 10px;
	font-weight: 300;
}
 /* تصميم الرسالة المنبثقة */
 .popup-message {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 9999;
        }

		.popup-content {
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2), 0 8px 16px rgba(0, 0, 0, 0.1);
    padding: 20px;
    opacity: 0;
    transform: translateY(0px);
    animation: popup-fade 0.5s forwards, popup-slide 1s forwards;
    width: 30%; /* تعديل العرض حسب الرغبة */
    }


        @keyframes popup-fade {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        @keyframes popup-slide {
            from {
                transform: translateY(-300px);
            }
            to {
                transform: translateY(0);
            }
        }

        @keyframes fade-out {
            from {
                opacity: 1;
            }
            to {
                opacity: 0;
                transform: translateY(300px);
            }
        }

        

        /* تصميم عناصر الرسالة */
        .popup-content img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
            animation: scale-up 0.5s ease-in-out;
        }

        .popup-content h2 {
            font-size: 24px;
            margin-bottom: 10px;
            color: #1e90ff;
            animation: slide-in 0.5s ease-in-out;
        }

        .popup-content p {
            font-size: 16px;
            margin-bottom: 20px;
            color: #555555;
            animation: slide-in 0.5s ease-in-out;
        }

        .popup-content button {
            background-color: #1e90ff;
            border: none;
            color: #ffffff;
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        .popup-content button:hover {
            background-color: #1373b5;
        }

        @keyframes slide-in {
            from {
                transform: translateY(-20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        @keyframes scale-up {
            from {
                transform: scale(0);
            }
            to {
                transform: scale(1);
            }
        }

        /* تصميم حركة الرسالة عند الإغلاق */
        .popup-close {
            position: absolute;
            top: -20px;
            right: -20px;
            width: 40px;
            height: 40px;
            background-color: #ffffff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            animation: close-rotate 0.5s;
        }

        @keyframes close-rotate {
            0% {
                transform: rotate(0deg);
            }
            100% {
                transform: rotate(360deg);
            }
        }
	</style>
</head>
<body>
<div id="popup" class="popup-message">
        <div class="popup-content">
            <span class="popup-close" onclick="hidePopup()">&#10005;</span>
            <img src="assets\images\me.jpg" alt="صورة">
            <h2>me</h2>
            <p>Hello ENG~Moahmmed</p>
            <button onclick="hidePopup()">Close</button>
        </div>
    </div>

    <script>

        //window.addEventListener('load', function() {showPopup();});

        function showPopup() {
            var popup = document.getElementById("popup");
            popup.style.display = "flex";
            var popupContent = popup.querySelector(".popup-content");
            popupContent.style.animation = "popup-fade 0.5s forwards, popup-slide 1s forwards";
        }

        function hidePopup() {
            var popup = document.getElementById("popup");
            var popupContent = popup.querySelector(".popup-content");
            popupContent.style.animation = "fade-out 0.5s forwards";
            setTimeout(function() {
                popup.style.display = "none";
                popupContent.style.animation = "";
            }, 500);
        }
		
    </script>
	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand">
			<i class='logo2'>
				<img src="assets/images/app_logo.png" width="45" height="45" alt="">
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
			<?php
if($CheckAdmin==true)
{
	?>
	<li>
		<div class="customer">

				<a href="Admin_Customer/Admin Customers.php">
					<i class='bx' >
						<img src="assets/icons/user.svg" width="20" height="20" alt="" >
					</i>
					<span class="text">Customer</span>
				</a>
				</div>
			</li>
	<?php
}

?>
			<li>
				<a href="#">
					<i class='bx bxs-cog' ></i>
					<span class="text">Settings</span>
				</a>
			</li>
			<li>
				<a href="logout.php" class="logout">
					<i class='bx' >
						<img src="assets/icons/logout.svg" width="20" height="20" alt="">
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
				<img src="assets/images/me.jpg">
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
				<a href="Works/ADDING.php">
				<button class="btn-download">
					<i class='bx bxs-cloud-download' ></i>
					<span class="text">Download PDF</span>
				</button>
				</a>
			</div>

			<ul class="box-info">
				<a href="Works/WORKS.php?work=test">
				<li>
					<i class='bx' >
						<div class="quiz">
								<img src="assets/icons/document-text.svg"  height="50" width="50" alt="">
					</div></i>
					<span class="text">
						<h3>

						<?php
						counttes();
				?>
					</h3>
					<h3 style="color: #ffc400;">
					<?php

					counttesprice();

				?>
					</h3>
						<p>TESTS</p>
					</span>
				</li>
				</a>
				<a href="Works/WORKS.php?work=exam">
				<li>
					<i class='bx' >
						<div class="quiz">
								<img src="assets/icons/document-text.svg"  height="50" width="50" alt="">
					</div></i>
					<span class="text">
						<h3>

						<?php
						countexa();
				?>
					</h3>
					<h3 style="color: #ffc400;">
					<?php

					countexaprice();

				?>
					</h3>
						<p>EXAMS</p>
					</span>
				</li>
				</a>
				<a href="Works/WORKS.php?work=project">
				<li>
					<i class='bx' >
						<div class="quiz">
								<img src="assets/icons/browser.svg"  height="50" width="50" alt="">
					</div></i>
					<span class="text">
						<h3>

						<?php
						countpro();
				?>
					</h3>
					<h3 style="color: #ffc400;">
					<?php

					countproprice();

				?>
					</h3>
						<p>PROJECTS</p>
					</span>
				</li>
				</a>
				<a href="Works/WORKS.php?work=quiz">
				<li>
					<i class='bx' >
						<div class="quiz">
								<img src="assets/icons/document-text.svg"  height="50" width="50" alt="">
					</div></i>
					<span class="text">
						<h3>

						<?php
						countqui();
				?>
					</h3>
					<h3 style="color: #ffc400;">
					<?php

					countquiprice();

				?>
					</h3>
						<p>QUIZS</p>
					</span>
				</li>
				</a>
				<a href="Works/WORKS.php?work=assginmets">
				<li>
					<i class='bx' >
						<div class="quiz">
								<img src="assets/icons/document-text.svg"  height="50" width="50" alt="">
					</div></i>
					<span class="text">H
					<h3>

						<?php
						countass();
				?>
					</h3>
					<h3 style="color: #ffc400;">
					<?php

					countassprice();

				?>
					</h3>
						<p>ASSGINMENTS</p>
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
								<th>User</th>
								<th>Date Order</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							
							<?php


$search="SELECT *FROM customers";
$sqlq=mysqli_query($con,$search);
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

    <p><?php echo $i["name"]?></p>
       </td>
      <td><?php  echo $i["phone"]?></td>
       <td><span class="status completed"><a href="#">Completed</a></span></td>
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
$sqlq=mysqli_query($con,$search);
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
				<button onclick="showPopup()" class="btn-download">
					<i class='bx bxs-cloud-download' ></i>
					<span class="text">Download PDF</span>
				</button>
			</div>
			<div class="table-data" >
				<div class="order">
					<div class="head">
						<h3>Recent Orders</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
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
									<img src="assets/images/me.jpg">
									<p>John Doe</p>
								</td>
								<td>01-10-2021</td>
								<td><span class="status completed">Completed</span></td>
							</tr>
							<tr>
								<td>
									<img src="assets/images/me.jpg">
									<p>John Doe</p>
								</td>
								<td>01-10-2021</td>
								<td><span class="status pending">Pending</span></td>
							</tr>
							<tr>
								<td>
									<img src="assets/images/me.jpg">
									<p>John Doe</p>
								</td>
								<td>01-10-2021</td>
								<td><span class="status process">Process</span></td>
							</tr>
							<tr>
								<td>
									<img src="assets/images/me.jpg">
									<p>John Doe</p>
								</td>
								<td>01-10-2021</td>
								<td><span class="status pending">Pending</span></td>
							</tr>
							<tr>
								<td>
									<img src="assets/images/me.jpg">
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
	

	<script src="assets/js/script.js"></script>
</body>
</html>


<?php 
}else{
     header("Location: ../index.php");
     exit();
}
 ?>