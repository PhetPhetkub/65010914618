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
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop`;

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
(1, 'กรงดักหนูสปริง2ตัวโครงหนา กรงดักหนู กรงดักหนูแบบมีโครง กรงดักหนูสปริงคู่\r\n', 'ตาของกรงแข็งเเรงทนทานและใช้งานได้นาน มีฐานและที่เกี่ยวอาหารใช้สำหรับดักสัตว์เล็กๆ เช่นหนู\r\n', 145.00, '.webp', 3),
(2, 'กรงดักหนู(สีขาว) ทนทาน มาตราฐานโรงงาน กรงดักหนู\r\n\r\n', 'กรงดักหนู มาตราฐานโรงงาน ประสบการณ์กว่า 30 ปี เหล็กนำเข้า  สปริงหนา 2 ตัว  ทนทาน   แข็งแรง\r\n\r\n', 48.00, '.webp', 2),
(3, 'กล่องดักหนู อุปกรณ์ดักหนู ไม่ต้องใช้สารเคมีและไม่ต้องสัมผัส\r\n', 'เป็นระบบอัตโนมัติ ใช้งานง่าย •พียงใส่เหยื่อ (เนยถั่ว, ขนมปังฯลฯ) ลงในที่ถอดออกได้ช่องเปิดประตู\r\n', 159.00, '.webp', 2),
(4, 'กรงดักหนู จำลองรูหนู ให้หนูเหมือนกลับบ้านตัวเอง\r\n', 'ทนทาน ไม่สึกกร่อนและทนต่อการสึกหรอ การกัดของเมาส์ไม่เลว อายุการใช้งานยาวนานขึ้น สามารถใช้ได้ทั้งในร่มและกลางแจ้ง!\r\n', 184.00, '.webp', 2),
(5, 'ที่ดักหนู แบบสปริง อุปกรณ์ดักหนู เหยื่อดักหนู สารกำจัดหนู \r\n', 'ความไวสูงทําให้หนูไม่สามารถหลบหนีได้ ผลิตจากพลาสติกคุณภาพดี แข็งแรง ทนทาน ใช้งานซ้ำกันได้หลายครั้ง\r\n', 7.00, '.webp', 2),
(6, 'ไม่มีหนูตลอดไป เครื่องไล่หนู ที่ไล่หนูไฟฟ้า\r\n', 'ขับไล่ด้วยพลังคลื่นไฟฟ้า ระบบอัลตราโซนิก (Ultrasonic Wave) ซึ่งคลื่นมีผลต่อสัตว์ขนาดเล็ก โดยตรง โดยเฉพาะ พวกหนู \r\n', 56.00, '.webp', 2),
(7, 'กาวดักหนูแผ่นใหญ่ ที่ดักหนู ปลอดสารพิษและปลอดภัย กาวหนูมืออาชีพยี่ห้อเก่า 30 ปี กาวดักหนูถาด\r\n', 'กาวดักหนู แบบสำเร็จรูป เหนียวหนึบพิเศษ ติดทน ไม่ไหลเยิ้ม ปลอดสารพิษ ใช้งานง่าย เก็บได้นาน\r\n', 108.00, '.webp', 3),
(8, 'ที่ดักหนู กับดักหนู กับดักหนูบ้าน (สปริงดีด) 1 กล่อง 2 ชิ้น\r\n', 'วัสดุทำจากเหล็ก แข็งแรง ทนทาน เป็นกับดักที่เหมาะสมกับพื้นที่ที่ไม่สามารถใช้สารเคมี\r\n', 38.00, '.webp', 1),
(9, 'กับดักหนู กับตีหนู ขนาด 5 นิ้ว ได้ 10 อัน\r\n', 'กับดักหนู หนูนา หนูใหญ่ และสัตว์ที่ทีขนาดใกล้เคียง ทำจากเหล็กที่มีความแข็งแรง สปริงแข็ง เพิ่มพลังในการตี\r\n', 102.00, '.webp', 3),
(10, 'ฝาดักหนู ฝาถังดักหนู ถังดักหนู สําหรับหนูเจลลี่ ​ทนทาน กับดักหนู\r\n', 'ฝาดักหนูอัจฉริยะ ปลอดภัยไม่ต้องใช้กาวจับหนูอีกต่อไป ซึ่งช่วยแยกสารอันตรายออกจากกัน ปลอดภัยและถูกสุขลักษณะมากขึ้น\r\n', 58.00, '.webp', 1),
(11, 'แผ่นกาวดักหนู ยาว ขนาด 120CM กาว ดักหนูแผ่นใหญ่ ดักหนู\r\n', 'กาวดักหนูแผ่นใหญ่  ชนิดถาดสำเร็จรูปใช้สำหรับดักหนู ไม่มีพิษ ไม่มีกลิ่น ไม่แห้ง กาวเหนียวมาก เป็นชนิดถาดเหลี่ยมสำเร็จรูป\r\n', 24.00, '.webp', 2),
(12, 'กาวดักหนูพร้อมถาด K-RAT กับดักหนู ที่ดักหนูพร้อมถาด กาววิทยาศาสตร์\r\n', 'ใช้ดักหนู กาวอย่างเหนียว แถมถาดฟรี กาวสามารถใช้ได้นานจนกว่าจะหมดความเหนียว หรือต้องการเปลี่ยนใหม่\r\n', 20.00, '.webp', 2);

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
  MODIFY `p_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
