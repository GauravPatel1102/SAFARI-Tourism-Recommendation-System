-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2024 at 09:39 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `log_package_changes` (`new_package_id` INT, `action_type` VARCHAR(50))   BEGIN
    INSERT INTO package_audit_log1 (package_id, action)
    VALUES (new_package_id, action_type);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages1`
--

CREATE TABLE `contact_messages1` (
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages1`
--

INSERT INTO `contact_messages1` (`name`, `email`, `subject`, `message`) VALUES
('GG1', 'arthurpatelkb5@gmail.com', 'technical issue', 'Good one');

-- --------------------------------------------------------

--
-- Table structure for table `packages1`
--

CREATE TABLE `packages1` (
  `package_id` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `budget` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `preference` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `best time` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `features` text DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages1`
--

INSERT INTO `packages1` (`package_id`, `location`, `budget`, `price`, `preference`, `description`, `best time`, `type`, `features`, `duration`, `image_url`) VALUES
(0, 'Digha Beach', '5000-10000', 8000.00, 'Beach', 'A seaside resort town in the state of West Bengal, India, known for its beautiful beaches and scenic views.', 'September to March', 'Family package', 'Relax on the sandy beaches and enjoy water sports activities.', '4 days 3 nights', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/07/00/60/71/digha-beach.jpg?w=1200&h=1200&s=1'),
(1, 'Lakshadweep', '0-5000', 4500.00, 'Beach', 'A group of 36 islands in the Arabian Sea off the southwestern coast of India', 'October to May', 'Family package', 'Enjoy the cool breezes in night', '3 days 3 nights', 'https://media.cntraveler.com/photos/5845955fe677ad7e572f89de/master/pass/lakshadweep-islands-GettyImages-675619991.jpg'),
(2, 'Jim Corbett National Park', '0-5000', 4500.00, 'Jungle', 'Jim Corbett National Park is a famous wildlife sanctuary in India, known for its diverse flora and fauna, including the Bengal tiger.', 'November to June', 'Family package', 'Experience thrilling jungle safaris and wildlife spotting adventures', '2 days 1 night', 'https://hikerwolf.com/wp-content/uploads/2020/03/CORBETT-NATIONAL-PARK.jpg'),
(3, 'Goa Beach', '0-5000', 4000.00, 'Beach', 'A coastal state in western India, renowned for its vibrant nightlife, sandy beaches, and colonial Portuguese architecture.', 'November to February', 'Family package', 'Explore the beach shacks, indulge in water sports, and visit historical landmarks.', '3 days 2 nights', 'https://cdn.wallpapersafari.com/90/40/YJ2tHy.jpg'),
(4, 'Khasi Hills', '0-5000', 4000.00, 'Jungle', 'Khasi Hills is a region in the Indian state of Meghalaya. It is known for its lush green forests and abundant wildlife.', 'September to May', 'Family package', 'Explore the dense forests and spot unique flora and fauna', '3 days 2 nights', 'https://t4.ftcdn.net/jpg/04/69/61/23/360_F_469612328_O7FyU10zES4IxoIa1x3rXm5h5dC51mTC.jpg'),
(5, 'Kedarnath Temple', '0-5000', 3000.00, 'Temple', 'A Hindu temple dedicated to Lord Shiva, located in the Garhwal Himalayas in the state of Uttarakhand, India. It is one of the Char Dham pilgrimage sites.', 'May to October', 'Pilgrimage package', 'Experience the spiritual ambiance, trekking in the Himalayas, and darshan of Kedarnath deity.', '2 days 1 night', 'https://wallpapers.com/images/hd/kedarnath-bright-entrance-4k-7rlkednd58qese5x.jpg'),
(6, 'Vaishno Devi Temple', '0-5000', 2500.00, 'Temple', 'A Hindu temple dedicated to the goddess Vaishno Devi, located in the Trikuta Mountains in the union territory of Jammu and Kashmir, India. It is one of the holiest Hindu temples.', 'Throughout the year', 'Pilgrimage package', 'Embark on a spiritual journey, trekking to the Vaishno Devi shrine, and seeking blessings.', '2 days 1 night', 'https://ctiaholidays.com/wp-content/uploads/7a84adcf7e8a58c7965596b6609b4e1c.jpg');

--
-- Triggers `packages1`
--
DELIMITER $$
CREATE TRIGGER `trg_delete_packages1` AFTER DELETE ON `packages1` FOR EACH ROW BEGIN
    INSERT INTO package_audit_log (package_id, action, timestamp)
    VALUES (OLD.package_id, 'DELETE', NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_insert_packages1` AFTER INSERT ON `packages1` FOR EACH ROW BEGIN
    INSERT INTO package_audit_log (package_id, action, timestamp)
    VALUES (NEW.package_id, 'INSERT', NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_update_packages1` AFTER UPDATE ON `packages1` FOR EACH ROW BEGIN
    INSERT INTO package_audit_log (package_id, action, timestamp)
    VALUES (NEW.package_id, 'UPDATE', NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `package_audit_log`
--

CREATE TABLE `package_audit_log` (
  `log_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_audit_log`
--

INSERT INTO `package_audit_log` (`log_id`, `package_id`, `action`, `timestamp`) VALUES
(1, 5, 'INSERT', '2024-03-22 20:37:52'),
(2, 6, 'INSERT', '2024-03-22 20:38:34');

-- --------------------------------------------------------

--
-- Table structure for table `travel1`
--

CREATE TABLE `travel1` (
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `travel1`
--

INSERT INTO `travel1` (`username`, `email`, `password`, `user_id`) VALUES
('avi', 'avi@gmail.com', '$2y$10$Kw2ucm2mTKyCI2PFh1pIW.bRiwKBDTOQC87hxmfcKukw3dhxHIQaO', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_details1`
--

CREATE TABLE `user_details1` (
  `age` int(255) NOT NULL,
  `phone_number` bigint(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `preference` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details1`
--

INSERT INTO `user_details1` (`age`, `phone_number`, `gender`, `preference`, `user_id`) VALUES
(23, 1234567891, 'male', 'Jungle', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `packages1`
--
ALTER TABLE `packages1`
  ADD PRIMARY KEY (`package_id`);

--
-- Indexes for table `package_audit_log`
--
ALTER TABLE `package_audit_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `travel1`
--
ALTER TABLE `travel1`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_details1`
--
ALTER TABLE `user_details1`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `package_audit_log`
--
ALTER TABLE `package_audit_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `travel1`
--
ALTER TABLE `travel1`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_details1`
--
ALTER TABLE `user_details1`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
