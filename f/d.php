<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>>เพชรรัตน์ นิยมไทย (เพ้ด)</title>
</head>

<body>
<h1>เพชรรัตน์ นิยมไทย (เพ้ด)</h1>

<form method="post" action="">
คะแนน <input type="number" name="score" min="0" max="100" autofocus required>
<input type="Submit" name="Submit" value="OK">
</form>
<hr>
<?php 
if(isset($_POST['Submit'])){
	$score = $_POST['score'] ;
 if ($score >= 95) { 
 $grade = "A" ; 
 } else if ($score >= 85) { 
 $grade = "B" ; 
 } else if ($score >= 79) { 
 $grade = "C" ; 
 } else if ($score >= 65) { 
 $grade = "D" ; 
 } else { 
 $grade = "F" ; 
 }  
 echo "คะแนน $score ได้เกรด $grade" ; 
}
?> 
</body>
</html>