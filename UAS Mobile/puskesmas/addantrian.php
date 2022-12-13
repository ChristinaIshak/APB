<?php
	include 'conn.php';
	$nama_pasien = $_REQUEST['nama_pasien'];
	$no_hp = $_REQUEST['no_hp'];
	$keluhan = $_REQUEST['keluhan'];
	$status = $_REQUEST['status'];
	// sql to delete a record
	$sql = "INSERT INTO daftar_antrian (nama_pasien,no_hp,keluhan,status) VALUES ("."'".$nama_pasien."',"."'".$no_hp."',"."'".$keluhan."',"."'".$status."')";
	$result = mysqli_query($connect, $sql); 
	echo json_encode($result);
?>