<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>อุปกรณ์เสริมความงามพร้อมเสริฟ</title>
</head>

<body>
<h1>อุปกรณ์เสริมความงามพร้อมเสริฟ</h1>

<?php
include_once("connectdb.php"); //เชื่อมต่อฐานข้อมูล

$sql = "SELECT * FROM `products` ORDER BY `products`.`p_id` ASC";
$rs = mysqli_query($conn,$sql);

while ($data = mysqli_fetch_array($rs)){
	$img = $data['p_id'].".".$data['p_ext'];
	echo "<img src = 'images/{$img}'width='250'> <br>";
	echo $data['p_id']."<br>";
	echo $data['p_name']."<br>";
	echo $data['p_detail']."<br>";
	echo $data['p_price']."บาท<hr>";
}

mysqli_close($conn);
?>

</body>
</html>