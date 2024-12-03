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
-- Struktur dari tabel `tb_member`
--

CREATE TABLE `tb_member` (
  `id_nim` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_mahasiswa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Rombel` text CHARACTER SET dec8 COLLATE dec8_swedish_ci NOT NULL,
  `Tanggal_Lahir` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_member`
--

INSERT INTO `tb_member` (`id_nim`, `nama_mahasiswa`, `Rombel`, `Tanggal_Lahir`) VALUES
('23090620034', 'Muhammad Yusuf Farhani', 'V1', '2005-04-07 00:00:00'),
('23090620012', 'Soni Hartadi', 'V1', '2005-11-01 00:00:00'),
('23090620034', 'Muhammad Yusuf Farhani', 'V1', '2005-04-07 00:00:00'),
('23090620012', 'Soni Hartadi', 'V1', '2005-11-01 00:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
