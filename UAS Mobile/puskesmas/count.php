<?php
	include 'conn.php';

		$queryResult = $connect->query("SELECT COUNT(*) AS tb_hitung FROM daftar_antrian WHERE status ='ngantri' ");
		$result = array();
		while($fetchData = $queryResult->fetch_assoc()){
			$result[] = $fetchData;
		}
		
		echo json_encode($result);
?>
