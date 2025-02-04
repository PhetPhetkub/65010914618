<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>เพชรรัตน์ นิยมไทย (เพ้ด)</title>
</head>

<body>
<h1>เพชรรัตน์ นิยมไทย (เพ้ด)</h1>

<form method="post" action="">
		ตัวเลข <input type="number" name="a" min = "0" max = "100" required autofocus> <br>
        ชื่อ-นามสกุล <input type="text" name="b" required>
        <br>
        จังหวัด
        <select name="province">
        	<option value="ขอนแก่น">ขอนแก่น</option>
            <option value="มหาสารคาม">มหาสารคาม</option>
            <option value="ร้อยเอ็ด">ร้อยเอ็ด</option>
            <option value="อุดรธานี">อุดรธานี</option>
        </section>
        วันเดือนปีเกิด
        <input type="date" name="birthday">
        <br><br>
        <button type="submit"name="Submit" >OK</button>
    </form>
    <hr>
       
    <?php
	echo @$_POST['a']."<br>";
	echo @$_POST['b']."<br>";
	echo @$_POST['birthday']."<br>";
	?>
       
</body>
</html>