<?php
$host ="localhost";
$user = "root";
$pwd = "qq123456";
$db = "shop4618";

$conn = mysqli_connect($host, $user, $pwd ) or die ("เชื่อมต่อฐานข้อมูลไม่ได้จร้า");
mysqli_select_db($conn, $db) or die ("เลือกฐานข้อมูลไม่ได้");
mysqli_query($conn, "set names utf8");
?>