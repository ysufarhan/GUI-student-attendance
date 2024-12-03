-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 03 Des 2024 pada 11.15
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_presensi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `mata_kuliah` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hari` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `waktu_mulai` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `waktu_selesai` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_jadwal`
--

INSERT INTO `tb_jadwal` (`mata_kuliah`, `hari`, `waktu_mulai`, `waktu_selesai`) VALUES
('Elektronika Daya', 'Monday', '08:00:00', '10:00:00'),
('Instrumentasi', 'Monday', '14:00:00', '15:00:00'),
('Sistem Kendali', 'Tuesday', '10:30:00', '12:00:00'),
('P.Sistem Kendali', 'Tuesday', '13:00:00', '16:00:00'),
('K3LH', 'Thursday', '07:30:00', '09:20:00'),
('B.Inggris Komunikasi', 'Thursday', '09:20:00', '11:00:00'),
('P.Pemrograman Komputer', 'Friday', '07:30:00', '11:00:00'),
('P.Mikroprosessor', 'Friday', '13:00:00', '16:00:00'),
('P.Elektronika Daya', 'Wednesday', '07:30', '11:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
