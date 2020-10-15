<?php 

	include 'database.php';

	$id = $_POST['id'];
	$judul = $_POST['judul'];
	$isi = $_POST['isi'];
	

	$link->query("UPDATE notes SET id = '".$id."',judul = '".$judul."',isi = '".$isi."' WHERE id = '".$id."'");


?>