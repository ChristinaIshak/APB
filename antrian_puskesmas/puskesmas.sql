-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2022 at 01:54 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `puskesmas`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_antrian`
--

CREATE TABLE `daftar_antrian` (
  `id_tiket` int(11) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `no_hp` int(13) NOT NULL,
  `keluhan` varchar(300) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daftar_antrian`
--

INSERT INTO `daftar_antrian` (`id_tiket`, `nama_pasien`, `no_hp`, `keluhan`, `status`) VALUES
(1, 'ali', 812345678, 'sakit perut', 'Ngantri');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_berobat`
--

CREATE TABLE `jadwal_berobat` (
  `id_jadwal` int(11) NOT NULL,
  `jam` time NOT NULL,
  `hari` varchar(10) NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `poli` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_berobat`
--

INSERT INTO `jadwal_berobat` (`id_jadwal`, `jam`, `hari`, `nama_dokter`, `poli`) VALUES
(1, '08:00:00', 'Senin', 'Zalidin', 'Gigi');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`) VALUES
(4, 'ali', '1234', 'ali@gmail.com'),
(6, 'abi', '12345', 'abi@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_antrian`
--
ALTER TABLE `daftar_antrian`
  ADD PRIMARY KEY (`id_tiket`);

--
-- Indexes for table `jadwal_berobat`
--
ALTER TABLE `jadwal_berobat`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_antrian`
--
ALTER TABLE `daftar_antrian`
  MODIFY `id_tiket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jadwal_berobat`
--
ALTER TABLE `jadwal_berobat`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;