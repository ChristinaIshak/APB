<?php
	include 'conn.php';
	error_reporting(0);
		$username = $_POST["username"];
		$password = $_POST["password"];
		$result = mysqli_query($conn, "SELECT * FROM user WHERE username = '$username'");

		//cek username
		if( mysqli_num_rows($result) === 1 ) {
			//cek password
			$row = mysqli_fetch_assoc($result);
			if( password_verify($password, $row["password"]) ) {
				exit;
			}
		} 
		$error = true;
?>