<?php
	include 'conn.php';
	$id_tiket = $_REQUEST['id_tiket'];
	// sql to delete a record
	$sql = "DELETE FROM daftar_antrian WHERE id_tiket='".$id_tiket."'";
	$result = mysqli_query($connect, $sql); 
	echo json_encode($result);
?>