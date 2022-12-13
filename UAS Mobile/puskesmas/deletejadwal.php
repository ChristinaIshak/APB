<?php
	include 'conn.php';
	$id_jadwal = $_REQUEST['id_jadwal'];
	// sql to delete a record
	$sql = "DELETE FROM jadwal_berobat WHERE id_jadwal='".$id_jadwal."'";
	$result = mysqli_query($connect, $sql); 
	echo json_encode($result);
?>