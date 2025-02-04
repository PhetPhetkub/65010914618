<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>สมัครสมาชิกชมรมสัตว์วิเศษ เพชรรัตน์ นิยมไทย (เพ้ด)</title>
</head>

<body>
<h1>สมัครสมาชิกชมรมสัตว์วิเศษ เพชรรัตน์ นิยมไทย (เพ้ด)</h1>
<form method="post" action="">
        ชื่อ-นามสกุล <input type="text" name="a" required>
        <br>
        เพศ
    <input type="radio"name="title" value="ชาย">ชาย
    <input type="radio"name="title" value="หญิง">หญิง
    <input type="radio"name="title" value="อื่นๆ" checked>อื่นๆ <br>
	<br>
    ที่อยู่ <br>
    <textarea name="address" cols="28" rows="5"></textarea>
    <br><br>
    
    เบอร์โทรศัพท์ <input type="text" name="number" ><br>   
    อาชีพ
        <select name="province">
        	<option value="นักเรียน">นักเรียน</option>
            <option value="นักศึกษา">นักศึกษา</option>
            <option value="ค้าขาย">ค้าขาย</option>
            <option value="แม่มด">แม่มด</option>
            <option value="ผู้วิเศษ">ผู้วิเศษ</option>
            <option value="อื่นๆ">อื่นๆ</option>
        </select> <br>
        หมวดหมู่สัตว์วิเศษที่ชื่นชอบ 
        <input type="checkbox" name="b[]" value="สัตว์ปีก">สัตว์ปีก 
		<input type="checkbox" name="b[]" value="สัตว์เลื้อยคลาน">สัตว์เลื้อยคลาน 
		<input type="checkbox" name="b[]" value="สัตว์บก">สัตว์บก 
		<input type="checkbox" name="b[]" value="สัตว์น้ำ">สัตว์น้ำ 
		<input type="checkbox" name="b[]" value="สัตว์สะเทือนน้ำสะเทือนบก">สัตว์สะเทือนน้ำสะเทือนบก </br> 
        username <input type="text" name="Uname" required><br>
        password <input type="password" name="pass"> <br>
        
        <button type="submit"name="Submit" >สมัครสมาชิก</button>
        <button type="reset">ยกเลิก</button>
        <button type="button" onClick="window.print();">พิมพ์</button>
     </form>
     <hr>
<?php
if(isset($_POST['Submit'])){
	echo "ชื่อ-นามสกุล:".$_POST['a']."<br>";
	echo "เพศ:".$_POST['title']."<br>";
	echo "ที่อยู่:".$_POST['address']."<br>";
	echo "เบอร์โทรศัพท์:".$_POST['number']."<br>";
	echo "อาชีพ:".$_POST['province']."<br>";
	echo "หมวดหมู่สัตว์วิเศษที่ชื่นชอบ: ";
	if(isset($_POST['b'])){
	foreach($_POST['b'] as $animal){
			echo "<li>" . htmlspecialchars($animal) . "</li>";
		}
	}
		echo "username".$_POST['Uname']."<br>";
		echo "password".$_POST['pass']."<br>";
		}
	?>
	
</body>
</html>