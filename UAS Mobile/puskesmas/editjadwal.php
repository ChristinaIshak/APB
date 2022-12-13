<?php
	include 'conn.php';
	$id_jadwal = $_REQUEST['id_jadwal'];
	$hari = $_REQUEST['hari'];
	$jam = $_REQUEST['jam'];
	$nama_dokter = $_REQUEST['nama_dokter'];
	$poli = $_REQUEST['poli'];
	// sql to delete a record
	$sql = "UPDATE jadwal_berobat set hari='".$hari."',"."jam='".$jam."',"."nama_dokter='".$nama_dokter."',"."poli='".$poli."'"."WHERE id_jadwal='".$id_jadwal."'";
	$result = mysqli_query($connect, $sql); 
	echo json_encode($result);
?>