<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>เพชรรัตน์ นิยมไทย (เพ้ด)</title>
</head>

<body>
<h1>เพชรรัตน์ นิยมไทย (เพ้ด)</h1>
<?php
	$name =  "เพชรรัตน์ นิยมไทย " ;
	$name .= "เพชร ช๊ะ";
	$age = 20 ;
	$price = 164.33 ;
	
	echo "ชื่อ-สกุล: ".$name."<br>";
	echo "อายุ: ".$age." ปี<br>";
	echo "ราคา: ".$price." บาท <hr>";
	
	echo gettype($price)."<br>";
	var_dump($name);
	?>
</body>
</html>