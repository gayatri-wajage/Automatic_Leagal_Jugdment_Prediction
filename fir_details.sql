-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2023 at 02:42 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fir_details`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `advocate`
--

CREATE TABLE `advocate` (
  `id` int(11) NOT NULL,
  `full_name` varchar(300) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `address` varchar(3000) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `valid_id` varchar(255) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `action` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `advocate`
--

INSERT INTO `advocate` (`id`, `full_name`, `gender`, `address`, `mobile`, `valid_id`, `email`, `password`, `action`) VALUES
(1, 'Ritesh R Rathod', 'Male', 'Akurdi Pune', '9800988909', 'ADCG12345T', 'rrr@gmail.com', '112233', '1'),
(2, 'Jhon', 'Male', 'Pune', '9876543211', 'AOPR265543U', 'jhon@gmail.com', '123456', '0'),
(3, 'Ramesh', 'Male', 'Pune', '9898948498', 'AKLU67543T', 'ramesh@gmail.com', '123456', '0');

-- --------------------------------------------------------

--
-- Table structure for table `complaints_details`
--

CREATE TABLE `complaints_details` (
  `id` int(11) NOT NULL,
  `complaint_by` varchar(30) DEFAULT NULL,
  `head_off_id` varchar(30) DEFAULT NULL,
  `name_complainant` varchar(30) DEFAULT NULL,
  `name_accused` varchar(300) DEFAULT NULL,
  `rel_accused` varchar(30) DEFAULT NULL,
  `purpose` varchar(1000) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `reg_date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `complaint_type` varchar(30) DEFAULT 'Waiting',
  `assign_to` varchar(30) DEFAULT 'Waiting',
  `status` varchar(30) DEFAULT 'Waiting',
  `assign_date_time` varchar(30) DEFAULT NULL,
  `final_status` varchar(30) NOT NULL DEFAULT 'Waiting',
  `result_side` varchar(30) NOT NULL DEFAULT 'Accused',
  `BlockData` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints_details`
--

INSERT INTO `complaints_details` (`id`, `complaint_by`, `head_off_id`, `name_complainant`, `name_accused`, `rel_accused`, `purpose`, `category`, `reg_date_time`, `complaint_type`, `assign_to`, `status`, `assign_date_time`, `final_status`, `result_side`, `BlockData`) VALUES
(1, 'rakesh@gmail.com', '1', 'Rakesh Rajput', 'Rts', 'friend', 'Robery Robery near my Home', 'Robbery', '2023-02-22 00:00:00', 'Robery', 'ram@gmail.com', 'Assign', '2023-02-24T19:40:07.532', 'Resolve', 'Accused', NULL),
(2, 'rakesh@gmail.com', '2', 'Pune Robery', 'ABC1', 'R1', 'Robery nearnear my Home Robery at Office', 'Robbery', '2023-02-24 00:00:00', 'Waiting', 'Waiting', 'Waiting', NULL, 'Waiting', 'Accused', NULL),
(3, 'rakesh@gmail.com', '1', 'Pune Robery_1', 'ABC2', 'R2', 'Murder Rape near in bank', 'Murder', '2023-02-24 00:00:00', 'MeneyRobery', 'rani@gmail.com', 'Assign', '2023-02-24T23:22:51.139', 'In-Progress', 'Accused', NULL),
(4, 'rakesh@gmail.com', '1', 'Pune Robery_2', 'Name2', 'R2', 'half murder near bus stand', 'Half Murder', '2023-02-10 00:00:00', 'Robery2', 'rani@gmail.com', 'Assign', '2023-02-24T23:15:54.557', 'In-Progress', 'Accused', NULL),
(5, 'rakesh@gmail.com', '1', 'Pune Robery_3', 'Name3', 'R3', 'murder', 'Murder', '2023-02-01 00:00:00', 'Murder', 'ram@gmail.com', 'Assign', '2023-04-05T09:39:28.862', 'In-Progress', 'Accused', NULL),
(6, 'rakesh@gmail.com', '1', 'Pune Robery_4', 'Name4', 'R5', 'Robery5', 'Robbery', '2023-02-24 00:00:00', 'Robery', 'ram@gmail.com', 'Assign', '2023-04-05T09:39:20.312', 'In-Progress', 'Accused', NULL),
(7, 'rakesh@gmail.com', '1', 'Pune Robery_5', 'Name5', 'R5', 'Robery5', 'Robbery', '2023-02-24 00:00:00', 'Murder', 'ram@gmail.com', 'Assign', '2023-02-24T23:34:06.044', 'In-Progress', 'Accused', NULL),
(8, 'rutuja@gmail.com', '4', 'Darshan', 'Ritesh', 'friend', 'Robery', 'Robbery', '2023-02-25 00:00:00', 'Robery', 'pooja@gmail.com', 'Assign', '2023-02-25T12:47:30.733', 'In-Progress', 'Accused', NULL),
(9, 'rakesh@gmail.com', '1', 'Ram', 'Rahul Gandhi', 'Relative', 'wrong Comment on Respected Person ', 'Ragging', '2023-04-05 00:00:00', 'Comment Issue in State Level', 'ram@gmail.com', 'Assign', '2023-04-05T09:39:09.886', 'Resolve', 'Accused', NULL),
(10, 'rakesh@gmail.com', '1', 'Ram', 'Sanjay Raut', 'Relative', 'blaim to respected Person mr Narendra Modi', 'Ragging', '2023-04-05 00:00:00', 'Nationsl Issue', 'ram@gmail.com', 'Assign', '2023-04-05T09:38:17.764', 'Resolve', 'User', NULL),
(11, 'rakesh@gmail.com', '1', 'Ram', 'Sharad Pawar', 'Relative', 'wrong statement against respected person shre Chatrapati Udaynraje Bhosale', 'Ragging', '2023-04-05 00:00:00', 'Comment Issue in State Level', 'ram@gmail.com', 'Assign', '2023-04-05T09:38:34.115', 'Resolve', 'Accused', NULL),
(12, 'rakesh@gmail.com', '1', 'Ram', 'Udhav Thakare', 'Friend', 'about Devendra Gangadharrao Fadnavis its now Deputy CM of Maharashtra and Thakare give wrong statement about DCM of MaharashtrA', 'Ragging', '2023-04-05 00:00:00', 'Comment Issue in State Level', 'ram@gmail.com', 'Assign', '2023-04-05T09:38:09.026', 'Resolve', 'User', NULL),
(13, 'rakesh@gmail.com', '1', 'Sachin Tendulkar', 'Shahid afradi', 'Friend', 'give wrong statement about india cricket team', 'Ragging', '2023-04-05 00:00:00', 'Nationsl Issue', 'ram@gmail.com', 'Assign', '2023-04-05T09:37:46.793', 'Resolve', 'User', NULL),
(14, 'rakesh@gmail.com', '1', 'Rathod', 'Kasab', 'No Relation', 'Firing in open space and death near about 100 people', 'Ragging', '2023-04-05 00:00:00', 'Attackers Terrerist', 'ram@gmail.com', 'Assign', '2023-04-05T09:37:24.997', 'Resolve', 'Accused', NULL),
(15, 'rakesh@gmail.com', '1', 'Raju', 'Khan Javedh', 'no relation', 'Robery in Bank ', 'Robbery', '2023-04-05 00:00:00', 'Robery', 'ram@gmail.com', 'Assign', '2023-04-05T09:36:49.244', 'Resolve', 'Accused', NULL),
(16, 'rakesh@gmail.com', '1', 'Rajesh Chopade', 'Sameer Khan ', 'no relation', 'Robery in ATM near Railway Station', 'Robbery', '2023-04-05 00:00:00', 'Robery', 'ram@gmail.com', 'Assign', '2023-04-05T09:36:40.244', 'Resolve', 'Accused', NULL),
(17, 'rakesh@gmail.com', '1', 'Rakesh Rao', 'Juned Shaikh', 'no relation', 'murder in pune railway station and open place firing 10 people death', 'Murder', '2023-04-05 00:00:00', 'Murder', 'ram@gmail.com', 'Assign', '2023-04-05T09:36:30.772', 'Resolve', 'User', NULL),
(18, 'rakesh@gmail.com', '1', 'Shiv', 'Khan', 'Rape', 'distroy temple in maharashtra state', 'Ragging', '2023-04-05 00:00:00', 'Harm Goverment Property', 'ram@gmail.com', 'Assign', '2023-04-05T09:36:19.590', 'Resolve', 'User', NULL),
(19, 'rakesh@gmail.com', '1', 'RAM', 'Sajid Khan', 'No Relation', 'try to distroy indian god temple and give wrong statement about god', 'Ragging', '2023-04-05 00:00:00', 'Harm Goverment Property', 'ram@gmail.com', 'Assign', '2023-04-05T09:36:09.796', 'Resolve', 'User', NULL),
(22, 'rutuja@gmail.com', '2', 'Robery', 'Name5', 'No', 'Robery Chanin Snaching at market', 'Robbery', '2023-05-02 19:05:54', 'Waiting', 'Waiting', 'Waiting', NULL, 'Waiting', 'Accused', '2788b1e6c7bb14481a109fdbe8d85ed15fbed58614d74021d8cac5178cc276d3'),
(23, 'rutuja@gmail.com', '3', 'Half Murder', 'Usuf', 'No', 'Half murder inside Maghanlal Shop', 'Half Murder', '2023-05-02 19:17:54', 'Waiting', 'Waiting', 'Waiting', NULL, 'Waiting', 'Accused', 'ed3764d223b1069a8ee659cd4263fc1fdf658fa46340e1020bb4f4a463362fdc'),
(24, 'rutuja@gmail.com', '3', 'Half Murder', 'Usuf Khan', 'No', 'Half murder inside Maghanlal Shop', 'Half Murder', '2023-05-02 19:21:28', 'Waiting', 'Waiting', 'Waiting', NULL, 'Waiting', 'Accused', 'c13af3b31aa6f085b6bd129d065cc2b151298d2501cf827cfa56da9a82f2a966'),
(25, 'rutuja@gmail.com', '3', 'Karan', 'Raj', 'No', 'Robbery in MG Road', 'Robbery', '2023-05-15 19:46:06', 'Waiting', 'Waiting', 'Waiting', NULL, 'Waiting', 'Accused', '2337ae05e30e5ffb5f9cff6d72d5fa9042ca014ebd61cca6609f5af0398bb3e0'),
(26, 'rutuja@gmail.com', '3', 'Ragging with Leady', 'Ram', 'No', 'See ragging with leady', 'Ragging', '2023-05-15 22:40:58', 'Waiting', 'Waiting', 'Waiting', NULL, 'Waiting', 'Accused', '7dc222ba1909df2db88858bd71f260dbc723fef15aa744d6d16be378e317bb0f'),
(28, 'rutuja@gmail.com', '3', 'Chain Snaching', 'Shyam', 'No', 'Chain Snaching in front of me', 'Robbery', '2023-05-15 22:46:35', 'Waiting', 'Waiting', 'Waiting', NULL, 'Waiting', 'Accused', 'c17081a0decd39a1da528e4e1d2919093d7045cab850fb8c85c5c4a5d12f45de');

-- --------------------------------------------------------

--
-- Table structure for table `complaints_types`
--

CREATE TABLE `complaints_types` (
  `id` int(11) NOT NULL,
  `complaint_type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaints_types`
--

INSERT INTO `complaints_types` (`id`, `complaint_type`) VALUES
(1, 'Robbery'),
(2, 'Haff Murder');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_status`
--

CREATE TABLE `complaint_status` (
  `id` int(11) NOT NULL,
  `file_name` varchar(30) NOT NULL DEFAULT 'None',
  `progress` varchar(1000) DEFAULT NULL,
  `update_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `cmplnt_id` varchar(30) DEFAULT NULL,
  `poice_id` varchar(30) DEFAULT NULL,
  `user_id` varchar(30) DEFAULT NULL,
  `status` varchar(30) NOT NULL DEFAULT 'Not_Resolved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `complaint_status`
--

INSERT INTO `complaint_status` (`id`, `file_name`, `progress`, `update_datetime`, `cmplnt_id`, `poice_id`, `user_id`, `status`) VALUES
(1, 'samplePDF.pdf', 'bbbbbbbbbbb', '2023-02-24 20:34:08', '1', '1', '', 'In-Process'),
(2, 'samplePDF.pdf', 'ABCDE', '2023-02-24 22:33:29', '1', '1', '', 'In-Process'),
(3, 'samplePDF.pdf', 'aaa', '2023-02-24 22:42:25', '1', '1', 'rakesh@gmail.com', 'In-Process'),
(4, 'None', 'sss', '2023-02-24 22:44:16', '1', '1', 'rakesh@gmail.com', 'In-Process'),
(5, 'None', 'Complaint Closed', '2023-02-24 22:47:01', '1', '1', 'rakesh@gmail.com', 'Closed'),
(6, 'None', 'Resolve this case', '2023-02-24 22:54:48', '1', '1', 'rakesh@gmail.com', 'Resolve'),
(7, 'None', 'Solve this case', '2023-02-24 22:55:48', '1', '1', 'rakesh@gmail.com', 'Resolve'),
(8, 'None', 'again Open', '2023-02-24 23:28:02', '1', '1', 'rakesh@gmail.com', 'In-Process'),
(9, 'None', 'again Open', '2023-02-24 23:28:40', '1', '1', 'rakesh@gmail.com', 'In-Process'),
(10, 'None', 're-opn', '2023-02-24 23:29:04', '1', '1', 'rakesh@gmail.com', 'In-Process'),
(11, 'None', 'r-opn', '2023-02-24 23:29:52', '1', '1', 'rakesh@gmail.com', 'In-Process'),
(12, 'None', 'aa', '2023-02-24 23:33:16', '1', '1', 'rakesh@gmail.com', 'In-Progress'),
(13, 'None', 'bb', '2023-02-24 23:33:26', '1', '1', 'rakesh@gmail.com', 'Resolve'),
(14, 'None', 'arrest ritest and enquiry in process', '2023-02-25 12:51:58', '8', '4', 'rutuja@gmail.com', 'In-Progress'),
(15, 'None', 'in process', '2023-02-25 12:52:31', '8', '4', 'rutuja@gmail.com', 'In-Progress'),
(16, 'None', 'Done', '2023-03-04 17:29:42', '1', 'Judge', 'rakesh@gmail.com', 'Resolve'),
(17, 'None', 'check nearest Camera', '2023-04-05 09:40:19', '19', '1', 'rakesh@gmail.com', 'In-Progress'),
(18, 'None', 'draw the attacker sketch by designer and try to match with sajid khan', '2023-04-05 09:41:09', '19', '1', 'rakesh@gmail.com', 'In-Progress'),
(19, 'None', 'its matching with sajid khan brother', '2023-04-05 09:41:23', '19', '1', 'rakesh@gmail.com', 'In-Progress'),
(20, 'None', 'get all information of sajid khan brother name as mohmmad khan ', '2023-04-05 09:41:46', '19', '1', 'rakesh@gmail.com', 'In-Progress'),
(21, 'None', 'send notification to all police station to find out m khan', '2023-04-05 09:42:20', '19', '1', 'rakesh@gmail.com', 'In-Progress'),
(22, 'None', 'M Khan found in Raj Hotel in Mumbai ', '2023-04-05 09:43:25', '19', '1', 'rakesh@gmail.com', 'In-Progress'),
(23, 'None', 'Check Videos and Identify Accused in Videos record', '2023-04-12 22:38:04', '18', '1', 'rakesh@gmail.com', 'In-Progress'),
(24, 'None', 'checking railway station records and identify Criminal is Juned Shaikh\r\nrecord available in Attachments', '2023-04-12 22:39:09', '17', '1', 'rakesh@gmail.com', 'In-Progress'),
(25, 'None', 'Analysis is in Progress not done', '2023-04-12 22:39:43', '14', '1', 'rakesh@gmail.com', 'In-Progress'),
(26, 'None', 'wrong information provided by Rathod', '2023-04-12 22:39:58', '14', '1', 'rakesh@gmail.com', 'In-Progress'),
(27, 'None', 'Check Voice and Its Matches with Shahid Afradi', '2023-04-12 22:40:35', '13', '1', 'rakesh@gmail.com', 'In-Progress'),
(28, 'None', 'Check all Call Records and identify Voice based on AI and Accused Identify its Udhav Thakare', '2023-04-12 22:41:20', '12', '1', 'rakesh@gmail.com', 'In-Progress'),
(29, 'None', 'wrong information provide by Ram sharad pawar ji respect our Chatrapati ', '2023-04-12 22:42:05', '11', '1', 'rakesh@gmail.com', 'In-Progress'),
(30, 'None', 'corrcect information provided by ram', '2023-04-12 22:47:40', '10', '1', 'rakesh@gmail.com', 'In-Progress'),
(31, 'None', 'correct info we check video and statement recording and rahul is agree for this statements', '2023-04-12 22:48:27', '9', '1', 'rakesh@gmail.com', 'In-Progress'),
(32, 'None', 'investigation done', '2023-04-12 22:48:45', '9', '1', 'rakesh@gmail.com', 'In-Progress'),
(33, 'None', '5 year Jail and 10000 ruppes fine', '2023-04-12 22:59:20', '19', '1', 'rakesh@gmail.com', 'Resolve'),
(34, 'None', '3 year jail and 5000 rupees fine', '2023-04-12 23:00:55', '18', 'Judge', 'rakesh@gmail.com', 'Resolve'),
(35, 'None', 'Death penalty ', '2023-04-12 23:04:32', '17', 'Judge', 'rakesh@gmail.com', 'Resolve'),
(36, 'None', 'wrong information', '2023-04-12 23:05:09', '14', 'Judge', 'rakesh@gmail.com', 'In-Progress'),
(37, 'None', '1L Fines and no entry in india', '2023-04-12 23:05:46', '13', 'Judge', 'rakesh@gmail.com', 'In-Progress'),
(38, 'None', 'not applicable for future CM and fine 20L', '2023-04-12 23:06:33', '12', 'Judge', 'rakesh@gmail.com', 'Resolve'),
(39, 'None', 'wrong infor ram fine 12000 rupees', '2023-04-12 23:08:14', '11', 'Judge', 'rakesh@gmail.com', 'In-Progress'),
(40, 'None', '2000 fine and not taken media meeting in morning if take meeting need curent cm permission required', '2023-04-12 23:09:57', '10', 'Judge', 'rakesh@gmail.com', 'Resolve'),
(41, 'None', '3000 fine Rahul Gandhi', '2023-04-12 23:14:52', '9', 'Judge', 'rakesh@gmail.com', 'Resolve');

-- --------------------------------------------------------

--
-- Table structure for table `headoffice`
--

CREATE TABLE `headoffice` (
  `id` int(11) NOT NULL,
  `office_name` varchar(100) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `officer_name` varchar(100) DEFAULT NULL,
  `officer_mobile` varchar(30) DEFAULT NULL,
  `office_area` varchar(30) DEFAULT NULL,
  `office_address` varchar(1000) DEFAULT NULL,
  `c_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `headoffice`
--

INSERT INTO `headoffice` (`id`, `office_name`, `email`, `password`, `officer_name`, `officer_mobile`, `office_area`, `office_address`, `c_date`) VALUES
(1, 'Akurdi Police Station', 'akurdi@gmail.com', '123123', 'Ritesh Surange', '9800980098', 'Akurdi', 'Front of Akurdi Railwat Station Akurdi 411044', '2023-02-22 19:50:49'),
(2, 'Pune Police Station', 'pune@gmail.com', '112233', 'Pune Officer', '9879879877', 'Pune', 'Pune Police Station', '2023-02-22 23:09:22'),
(3, 'Lonavala Police Station', 'lonavala@gmail.com', '123123', 'lonavala Officer', '9879879878', 'Lonavala', 'Lonavala Police Station', '2023-02-22 23:09:54'),
(4, 'Shivaji Nagar Police Station', 's@gmail.com', '112234', 'Shrusti Patil', '9879877897', 'ShivajiNagar', 'near Bus Stops SN', '2023-02-25 12:41:51');

-- --------------------------------------------------------

--
-- Table structure for table `judge`
--

CREATE TABLE `judge` (
  `id` int(11) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `judge`
--

INSERT INTO `judge` (`id`, `email`, `password`) VALUES
(1, 'judge@gmail.com', '123123');

-- --------------------------------------------------------

--
-- Table structure for table `police`
--

CREATE TABLE `police` (
  `id` int(11) NOT NULL,
  `head_office_id` varchar(30) DEFAULT NULL,
  `police_name` varchar(100) DEFAULT NULL,
  `police_mobile` varchar(30) DEFAULT NULL,
  `police_gender` varchar(30) DEFAULT NULL,
  `valid_id` varchar(255) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `c_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `police`
--

INSERT INTO `police` (`id`, `head_office_id`, `police_name`, `police_mobile`, `police_gender`, `valid_id`, `email`, `password`, `c_date`) VALUES
(1, '1', 'Ram Jadhav', '8900890089', 'Male', NULL, 'ram@gmail.com', '123123', '2023-02-22 20:13:27'),
(2, '1', 'Raj', '9879879877', 'Male', NULL, 'raj@gmail.com', '112233', '2023-02-24 23:13:40'),
(3, '1', 'Rani', '9879879878', 'Female', NULL, 'rani@gmail.com', '123123', '2023-02-24 23:13:56'),
(4, '4', 'pooja kadam', '9452611234', 'Female', NULL, 'pooja@gmail.com', '123456', '2023-02-25 12:46:48'),
(5, '2', 'Ramu Kumar', '8696898989', 'Male', 'AKLU67543U', 'ramu@gmail.com', '12345678', '2023-05-15 23:15:43');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `full_name`, `gender`, `address`, `mobile`, `email`, `password`) VALUES
(1, 'RAkesh Rajput', 'Male', 'Akurdi', '8900890089', 'rakesh@gmail.com', '112234'),
(2, 'Rutuja', 'Female', 'Akurdi Railway Station Near Akurdi', '9800980098', 'rutuja@gmail.com', '112233');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `advocate`
--
ALTER TABLE `advocate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints_details`
--
ALTER TABLE `complaints_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints_types`
--
ALTER TABLE `complaints_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaint_status`
--
ALTER TABLE `complaint_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `headoffice`
--
ALTER TABLE `headoffice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `judge`
--
ALTER TABLE `judge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `police`
--
ALTER TABLE `police`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `advocate`
--
ALTER TABLE `advocate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `complaints_details`
--
ALTER TABLE `complaints_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `complaints_types`
--
ALTER TABLE `complaints_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `complaint_status`
--
ALTER TABLE `complaint_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `headoffice`
--
ALTER TABLE `headoffice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `judge`
--
ALTER TABLE `judge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `police`
--
ALTER TABLE `police`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
