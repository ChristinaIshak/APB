<?php
	include 'conn.php';

	$queryResult = $connect->query("SELECT min(id_tiket) FROM daftar_antrian WHERE status ='ngantri'");
	$result = array();
	while($fetchData = $queryResult->fetch_assoc()){
		$result[] = $fetchData;
	}
	echo json_encode($result);
?>