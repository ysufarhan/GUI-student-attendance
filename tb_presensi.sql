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
-- Struktur dari tabel `tb_presensi`
--

CREATE TABLE `tb_presensi` (
  `id_user` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hari_kedatangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_kedatangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `waktu_kedatangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `image` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mata_kuliah` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_presensi`
--

INSERT INTO `tb_presensi` (`id_user`, `hari_kedatangan`, `tanggal_kedatangan`, `waktu_kedatangan`, `image`, `mata_kuliah`) VALUES
('23090620034', 'Wednesday', '2024-11-13', '19:21:50', 'file_20241113192150.png', ''),
('23090620012', 'Wednesday', '2024-11-13', '19:24:36', 'file_20241113192436.png', ''),
('23090620034', 'Wednesday', '2024-11-13', '19:30:24', 'file_20241113193024.png', ''),
('23090620034', 'Thursday', '2024-11-21', '10:43:00', 'file_20241121104300.png', ''),
('23090620034', 'Thursday', '2024-11-21', '10:43:08', 'file_20241121104308.png', ''),
('23090620034', 'Friday', '2024-11-22', '07:58:05', 'file_20241122075805.png', ''),
('23090620034', 'Friday', '2024-11-22', '08:45:33', 'file_20241122084533.png', ''),
('23090620034', 'Friday', '2024-11-22', '08:56:42', 'file_20241122085642.png', ''),
('23090620034', 'Friday', '2024-11-22', '09:07:15', 'file_20241122090715.png', ''),
('23090620034', 'Friday', '2024-11-22', '09:11:55', 'file_20241122091155.png', ''),
('23090620012', 'Friday', '2024-11-22', '09:16:40', 'file_20241122091640.png', ''),
('23090620034', 'Friday', '2024-11-22', '09:34:33', 'file_20241122093433.png', ''),
('23090620034', 'Friday', '2024-11-22', '09:36:39', 'file_20241122093639.png', ''),
('23090620012', 'Friday', '2024-11-22', '09:37:07', 'file_20241122093707.png', ''),
('23090620034', 'Sunday', '2024-11-24', '06:29:31', 'file_20241124062931.png', 'Praktik Sistem Kendali'),
('23090620034', 'Sunday', '2024-11-24', '06:32:39', 'file_20241124063239.png', 'P.Pemrograman Komputer'),
('23090620034', 'Sunday', '2024-11-24', '07:04:03', 'file_20241124070403.png', 'P.Sistem Kendali'),
('23090620034', 'Sunday', '2024-11-24', '07:06:25', 'file_20241124070625.png', 'P.Sistem Kendali'),
('23090620034', 'Sunday', '2024-11-24', '07:21:30', 'file_20241124072130.png', 'P.Sistem Kendali'),
('23090620034', 'Sunday', '2024-11-24', '08:08:09', 'file_20241124080809.png', 'Sistem Kendali'),
('23090620012', 'Sunday', '2024-11-24', '08:11:46', 'file_20241124081146.png', 'Instrumentasi'),
('23090620012', 'Sunday', '2024-11-24', '09:19:56', 'file_20241124091956.png', 'Elektronika Daya'),
('23090620034', 'Sunday', '2024-11-24', '10:22:39', 'file_20241124102239.png', 'P.Elektronika Daya'),
('23090620034', 'Sunday', '2024-11-24', '10:28:50', 'file_20241124102850.png', 'Elektronika Daya'),
('23090620034', 'Sunday', '2024-11-24', '10:29:02', 'file_20241124102902.png', 'P.Elektronika Daya'),
('23090620034', 'Sunday', '2024-11-24', '10:35:09', 'file_20241124103509.png', 'Elektronika Daya'),
('23090620034', 'Sunday', '2024-11-24', '11:52:17', 'file_20241124115217.png', 'Instrumentasi'),
('23090620034', 'Sunday', '2024-11-24', '17:37:40', 'file_20241124173740.png', 'P.Pemrograman Komputer'),
('23090620034', 'Sunday', '2024-11-24', '17:43:36', 'file_20241124174336.png', 'P.Pemrograman Komputer'),
('23090620034', 'Sunday', '2024-11-24', '18:27:25', 'file_20241124182725.png', 'P.Pemrograman Komputer'),
('23090620034', 'Sunday', '2024-11-24', '19:10:05', 'file_20241124191005.png', 'Elektronika Daya'),
('23090620012', 'Sunday', '2024-11-24', '19:38:24', 'file_20241124193824.png', 'Sistem Kendali'),
('23090620034', 'Sunday', '2024-11-24', '19:59:27', 'file_20241124195927.png', 'Elektronika Daya'),
('23090620034', 'Sunday', '2024-11-24', '19:59:49', 'file_20241124195949.png', 'Elektronika Daya'),
('23090620034', 'Monday', '2024-11-25', '08:06:54', 'file_20241125080654.png', 'Sistem Kendali'),
('23090620012', 'Monday', '2024-11-25', '08:08:16', 'file_20241125080816.png', 'Elektronika Daya'),
('23090620034', 'Monday', '2024-11-25', '08:10:12', 'file_20241125081012.png', 'Elektronika Daya'),
('23090620012', 'Monday', '2024-11-25', '08:35:23', 'file_20241125083523.png', 'Sistem Kendali'),
('23090620012', 'Monday', '2024-11-25', '08:50:14', 'file_20241125085014.png', 'Elektronika Daya'),
('23090620012', 'Monday', '2024-11-25', '09:01:58', 'file_20241125090158.png', 'Elektronika Daya'),
('23090620034', 'Monday', '2024-11-25', '13:39:13', 'file_20241125133913.png', 'Instrumentasi'),
('23090620012', 'Monday', '2024-11-25', '13:41:09', 'file_20241125134109.png', 'Elektronika Daya');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
