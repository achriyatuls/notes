<?php
	$db = mysqli_connect('localhost','root','','udacoding');
	if (!$db) {
		echo "Database connection faild";
	}

	$username = $_POST['username'];
	$password = $_POST['password'];

	$sql = "SELECT username FROM users WHERE username = '".$username."'";

	$result = mysqli_query($db,$sql);
	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo json_encode("Error");
	}else{
		$insert = "INSERT INTO users(username,password)VALUES('".$username."','".$password."')";
		$query = mysqli_query($db,$insert);
		if ($query) {
			echo json_encode("Success");
		}
	}

?>