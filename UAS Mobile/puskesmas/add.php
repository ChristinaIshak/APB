<?php
	include 'conn.php';
	$username = $_REQUEST['username'];
	$password = $_REQUEST['password'];
	$email = $_REQUEST['email'];
	// sql to delete a record
	$sql = "INSERT INTO user (username,password,email) VALUES ("."'".$username."',"."'".$password."',"."'".$email."')";
	$result = mysqli_query($connect, $sql); 
	echo json_encode($result);
?>