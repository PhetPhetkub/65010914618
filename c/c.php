<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>เพชรรัตน์ นิยมไทย (เพ้ด)</title>
</head>

<body>

	<h1>สมัครสมาชิกสัตว์วิเศษ</h1>
    <form method="post" action="">
     ชื่อ-สกุล<input type="text" name="Name" required autofocusS> <br>
     เพศ<input type="radio" name="gender" value="ชาย">ชาย
     	<input type="radio" name="gender" value="หญิง" checked>หญิง <br>
      ที่อยู่ <br>
    <textarea name="address" cols="29" rows="4"></textarea><br>
    เบอร์โทรศัพท์ <input type="text" name="phone"required> <br>
    ระดับการศึกษา 
    <select name="edu">
		<option value="ต่ำกว่าปริญญาตร">ต่ำกว่าปริญญาตรี</option>
		<option value="ปริญญาตร">ปริญญาตรี</option>
		<option value="ปริญญาโท">ปริญญาโท</option>
		<option value="ปริญญาเอก">ปริญญาเอก</option>
		</select> <br>
	สัตว์วิเศษที่ชื่นชอบ  
    <input type="checkbox" name="a[]" value="ยูนิคอร์น"checked>ยูนิคอร์น
	<input type="checkbox" name="a[]" value="มายลิตเติ้ลโพนี่">มายลิตเติ้ลโพนี่
	<input type="checkbox" name="a[]" value="ดอร์บบี้">ดอร์บบี้
	<input type="checkbox" name="a[]" value="มังกร"> มังกร <br>
	username<input type="text" name="Uname" required> <br>
    password <input type="password" name="pwd" size="20" maxlength="10">
    
    
     <button type="submit" name="Submit">สมัครสมาชิก </button>
     <button type="reset">ยกเลิก </button>
     <button type="button" onClick="window.print();">พิมพ์ </button> 
   </form>
  <hr>
    
<?php
if(isset($_POST['Submit'])){
	echo "ชื่อ-สกุล: ".$_POST['Name']."<br>";
	echo "เพศ: ".$_POST['gender']."<br>";
	echo "ที่อยู่: ".$_POST['address']."<br>";
	echo "เบอร์โทรศัพท์: ".$_POST['phone']."<br>";
	echo "ระดับการศึกษา: ".$_POST['edu']."<br>";
	echo "สายพันธุ์สัตว์วิเศษที่ชื่นชอบ: ";
	if(isset($_POST['a'])){
	foreach($_POST['a']as $Hamster){
		echo "<li>" .htmlspecialchars($Hamster)."</li>";
	}
}
	echo "Username: ".$_POST['Uname']."<br>";
	echo "Password: ".$_POST['pwd']."<br>";
}
?> 
</body>
</html>