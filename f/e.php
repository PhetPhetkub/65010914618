<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>เพชรรัตน์ นิยมไทย (เพ้ด)</title>
</head>

<body>
<h1>เพชรรัตน์ นิยมไทย (เพ้ด)</h1>
<form method="post" action="">
ราคาสินค้า <input type="number" name="a" min="0" autofocus required>
<input type="Submit" name="Submit" value="OK">
</form>
<hr>

<?php 
if(isset($_POST['Submit'])){
 $price = $_POST ['a'];
if ($price >= 5000) { 
 $discount = $price*0.15; 
 } else if ($price >=2000) { 
 $discount = $price*0.10 ; 
 } else if ($price >=1000) { 
 $discount = $price*0.05;
 } else {
$discount = 0;
}
 
 $total=$price-$discount;
 
 echo "ราคาสินค้ารวม = ".number_format($price,0)." บาท <br>" ;
 echo "ส่วนลดที่ได้รับ = ".number_format($discount,2)."บาท <br>" ;
 echo "จำนวนเงินที่จ่ายจริง = ".number_format($total,2)."บาท" ;

}
?> 


</body>
</html>