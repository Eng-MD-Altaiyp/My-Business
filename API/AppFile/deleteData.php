<?php

$id=$_POST['id'];
include 'conn.php';
$connect->query("DELETE FROM businees_work WHERE work_id='{$id}'");

?>