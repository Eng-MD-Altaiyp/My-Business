<?php
 
$Type=$_GET['type'];


//MySQL database Connection

include 'conn.php';


$result=$connect->query("SELECT * FROM works WHERE type='{$Type}'  ");
$list=array();
if($result)
{
    while($row=mysqli_fetch_assoc($result))
    {
        $list[]=$row;
    }
    echo json_encode($list);
}

?>
