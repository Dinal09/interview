-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 21 Jul 2021 pada 12.21
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `createUser` (IN `username` VARCHAR(100), IN `email` VARCHAR(100), IN `password` VARCHAR(100))  BEGIN
	INSERT INTO user (username, email, password) 		VALUES (username, email, password);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteUser` (IN `id` INT)  BEGIN
	DELETE FROM user WHERE id_user=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getAllUser` ()  BEGIN
	select * from user LIMIT 10;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getUserById` (IN `id` INT)  BEGIN
	SELECT * FROM user WHERE id_user=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateUser` (IN `id` INT, IN `username` VARCHAR(100), IN `email` VARCHAR(100), IN `password` VARCHAR(100))  BEGIN
	UPDATE user SET username=username, email=email, 	password=password WHERE id_user=id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_user`
--

CREATE TABLE `detail_user` (
  `id_detail_user` int(10) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `detail_user`
--

INSERT INTO `detail_user` (`id_detail_user`, `id_user`, `nama`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 0, '-', '-', NULL, NULL),
(7, 0, '-', '-', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_07_20_160014_create_user_table', 1),
(2, '2021_07_20_160309_create_detail_user_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `email`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'dinal@user.com', 'dinal', '123456', '2021-07-20 16:20:38', '2021-07-20 16:20:38'),
(3, 'user2@user.com', 'user2', '12345', NULL, NULL),
(4, 'user3@user.com', 'user3', '12345', NULL, NULL),
(6, 'user5@user.com', 'user5', '12345', NULL, NULL),
(7, 'user6@user.com', 'user6', '12345', NULL, NULL);

--
-- Trigger `user`
--
DELIMITER $$
CREATE TRIGGER `create_detail` AFTER INSERT ON `user` FOR EACH ROW BEGIN
	INSERT INTO detail_user SET id_user = NEW.id_user, alamat = '-', nama = '-';
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_user`
--
ALTER TABLE `detail_user`
  ADD PRIMARY KEY (`id_detail_user`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_user`
--
ALTER TABLE `detail_user`
  MODIFY `id_detail_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
