<?php
	include 'conn.php';
	$nama_pasien = $_REQUEST['nama_pasien'];
	// sql to delete a record
	$sql = "DELETE FROM daftar_antrian WHERE nama_pasien='".$nama_pasien."'";
	$result = mysqli_query($connect, $sql); 
	echo json_encode($result);
?>