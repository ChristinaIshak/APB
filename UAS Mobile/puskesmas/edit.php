<?php
	include 'conn.php';
	$id_tiket = $_REQUEST['id_tiket'];
	$nama_pasien = $_REQUEST['nama_pasien'];
	$no_hp = $_REQUEST['no_hp'];
	$keluhan = $_REQUEST['keluhan'];
	$status = $_REQUEST['status'];
	// sql to delete a record
	$sql = "UPDATE daftar_antrian set nama_pasien='".$nama_pasien."',"."no_hp='".$no_hp."',"."keluhan='".$keluhan."',"."status='".$status."'"."WHERE id_tiket='".$id_tiket."'";
	$result = mysqli_query($connect, $sql); 
	echo json_encode($result);
?>