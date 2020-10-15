<?php 

	include 'database.php';

	$id = $_POST['id'];
	$judul= $_POST['judul'];
	$isi = $_POST['isi'];
	

	$link->query("INSERT INTO notes(id,judul,isi)VALUES('".$id."','".$judul."','".$isi."')");













































	// include 'database.php';

	// $fistname = $_POST['fistname'];
	// $lastname = $_POST['lastname'];
	// $phone = $_POST['phone'];
	// $address = $_POST['address'];

	// $link->query("INSERT INTO person(fistname,lastname,phone,address)VALUES('".$fistname."','".$lastname."','".$phone."','".$address."')");

