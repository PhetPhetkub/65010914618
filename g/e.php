<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>เพชรรัตน์ นิยมไทย (เพ้ด)</title>
</head>

<body>
<h1> สูตรคูณเพลินใจ สไตล์สาวแก่ for</h1>

<form method="post" action="">
	แม่สูตรคูณ <input type="number" min="2" max="1000" name="a" required autofocus>
    <button type="submit" name="Submit">OK</button>
  </form><hr>
  
  <?php 
  if (isset($_POST['Submit'])){
	  $m = $_POST['a'];
	  for($i=1; $i<12; $i++){
		  $x = $m * $i ;
?>
	<?=$m;?> x <?=$i;?> = <?=$i;?> <br>
   <?php
	  } // end for
  } // end if
  ?>
</body>
</html>