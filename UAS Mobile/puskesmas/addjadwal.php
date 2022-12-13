<?php
	include 'conn.php';
	$hari = $_REQUEST['hari'];
	$nama_dokter = $_REQUEST['nama_dokter'];
	$poli = $_REQUEST['poli'];
	$jam = $_REQUEST['jam'];
	// sql to delete a record
	$sql = "INSERT INTO jadwal_berobat (hari,nama_dokter,poli,jam) VALUES ("."'".$hari."',"."'".$nama_dokter."',"."'".$poli."',"."'".$jam."')";
	$result = mysqli_query($connect, $sql); 
	echo json_encode($result);
?>