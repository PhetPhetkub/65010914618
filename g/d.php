<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>เพชรรัตน์ นิยมไทย (เพ้ด)</title>
</head>

<body>
<h1>เลือกจำนวนคนที่ไม่อยากเป็นหมีเนย</h1>

<form method="post" action="">
	จำนวน <input type="number" name="a" required autofocus>
    <button type="Submit" name="Submit">OK</button>
   </form> <hr>
   
<?php
   if(isset($_POST['Submit'])) {
	   $c = $_POST['a'];
	   echo "แสดงจำนวน $c รูป<br><br>";
	   for($i=1; $i<=$c; $i++){
?>	
    <img src="3.jfif" width="250">
<?php
	 } // end for
} // end if
?>
</body>
</html>