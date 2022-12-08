<?php
	include 'conn.php';
	$nama_pasien = $_REQUEST['nama_pasien'];
	$no_hp = $_REQUEST['no_hp'];
	$keluhan = $_REQUEST['keluhan'];
	// sql to delete a record
	$sql = "INSERT INTO daftar_antrian (nama_pasien,no_hp,keluhan) VALUES ("."'".$nama_pasien."',"."'".$no_hp."',"."'".$keluhan."')";
	$result = mysqli_query($connect, $sql); 
	echo json_encode($result);
?>