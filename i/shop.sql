-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2025 at 05:57 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `p_id` int(7) NOT NULL,
  `p_name` varchar(200) NOT NULL,
  `p_detail` text NOT NULL,
  `p_price` float(9,2) NOT NULL,
  `p_ext` varchar(50) NOT NULL,
  `c_id` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`p_id`, `p_name`, `p_detail`, `p_price`, `p_ext`, `c_id`) VALUES
(1, 'judydoll Highlight & Contour', 'Highlight & Contour', 369.00, 'png', 1),
(2, 'SKIN1004 Madagascar Centella Probio-Cica Essense Toner', 'โทนเนอร์เอสเซ้นส์ที่อุดมไปด้วย Centella หมัก, กรดไฮยาลูโรนิค 5 ชนิด และ Ceramide NP ที่ช่วยปลอบประโลม ให้ความชุ่มชื้น และลดเลือนริ้วรอย', 669.00, 'png', 2),
(3, 'KA UV Shield Lip Care SPF 50+ PA++++', 'ลิปบาล์มผสมสารกันแดด ไม่มีสี ไม่มีกลิ่น ปกป้องริมฝีปากจากรังสี UV ', 99.00, 'png', 2),
(4, 'MEILINDA Mini Handy Brush (Set)', 'อุปกรณ์สำหรับแต่งหน้า', 289.00, 'png', 3),
(5, '4U2 COSMETICS basic brow powder', 'พาเลทคิ้วฝุ่น 3 เฉดสีในตลับเดียว Natural Tone ใช้ง่ายสี Soft ละมุน', 199.00, 'png', 1),
(6, '4U2 COSMETICS Super Slim Mascara', 'มาสคาร่าแท่งจิ๋ว งัดขนตาแจ๋ว สูตรดำสนิท! ยกขนตาสวยกริ๊บทุกมุม', 179.00, 'png', 1),
(7, 'CERA-VE Sa Smoothing Cleanser', 'ผลิตภัณฑ์ทำความสะอาดผิวหน้าและผิวกาย ขจัดสิ่งสกปรก และความมันส่วนเกินได้อย่างมีประสิทธิภาพ', 290.00, 'png', 2),
(8, 'PURICAS Intensive Dark Spot & Acne Scar gel', 'เจลลดรอยดำสิว ลดเลือนรอยดำ ป้องกันรอยสิวด้วย 2 พลัง RSA Technology และนวัตกรรมเฉพาะ ScarZiro', 165.00, 'png', 2),
(9, 'BOHKTOH Nude Lashes N01', 'ขนตาของคนที่รักการติดขนตาปลอมให้ติดได้ ทุกวัน ด้วยแกนขนตาแบบพิเศษสีนู๊ด (Nude)', 179.00, 'png', 3),
(10, '4U2 COSMETICS Mini Curl Up', 'ที่ดัดขนตารุ่นมินิ น้ำหนักเบา พกพาสะดวก ดัดขนตาได้ตั้งแต่โคนจรดปลาย ดัดง่าย ไม่หนีบหนังตา ช่วยให้ขนตางอนเด้ง ', 99.00, 'png', 3),
(11, 'NAREE Juicy Glam Tint', 'ลิปทินท์เนื้อบางเบาชุ่มชื้น มอบฟินิชริมฝีปากอวบอิ่มฉ่ำวาว เม็ดสีแน่นชัด สเตนติดแน่นทนนาน อุดมไปด้วยวิตามินอี เติมความชุ่มชื้น', 159.00, 'png', 1),
(12, 'Y.O.U Cloud Touch Dreamy-Fit Lasting Mesh Cushion', 'คุชชั่นสูตรควบคุมความมัน ให้การปกปิดตั้งแต่ระดับปานกลางถึงขั้นสุด ช่วยเบลอรูขุมขน ปกปิดริ้วรอย และจุดด่างดำ ให้ผิวหน้าเรียบเนียนดูสุขภาพดี', 369.00, 'png', 1),
(13, '', '', 0.00, '', 0),
(14, '', '', 0.00, '  ', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `p_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
