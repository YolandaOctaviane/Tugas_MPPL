/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.20-MariaDB : Database - multi_login
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`multi_login` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `multi_login`;

/*Table structure for table `laporan` */

DROP TABLE IF EXISTS `laporan`;

CREATE TABLE `laporan` (
  `id_laporan` varchar(11) NOT NULL,
  `id_bahan_baku` varchar(11) DEFAULT NULL,
  `id_pembelian` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_laporan`),
  KEY `id_bahan_baku` (`id_bahan_baku`),
  KEY `id_pembelian` (`id_pembelian`),
  CONSTRAINT `laporan_ibfk_1` FOREIGN KEY (`id_bahan_baku`) REFERENCES `stok` (`id_bahan_baku`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `laporan_ibfk_2` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `laporan` */

insert  into `laporan`(`id_laporan`,`id_bahan_baku`,`id_pembelian`) values 
('0001','bb01','0002'),
('0002','bb02','0001');

/*Table structure for table `pegawai` */

DROP TABLE IF EXISTS `pegawai`;

CREATE TABLE `pegawai` (
  `nip` varchar(11) NOT NULL,
  `nama_lengkap` varchar(25) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') DEFAULT NULL,
  `no_telepon` int(15) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `jabatan` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `pegawai` */

insert  into `pegawai`(`nip`,`nama_lengkap`,`alamat`,`jenis_kelamin`,`no_telepon`,`password`,`jabatan`) values 
('10119171','yolanda octaviane','GBI','P',2147483647,'1234','pemilik'),
('10119186','rika ','DU','P',2147483647,'1234','pegawai');

/*Table structure for table `pembelian` */

DROP TABLE IF EXISTS `pembelian`;

CREATE TABLE `pembelian` (
  `id_pembelian` varchar(11) NOT NULL,
  `id_bahan_baku` varchar(25) DEFAULT NULL,
  `nip` varchar(11) DEFAULT NULL,
  `harga` int(6) DEFAULT NULL,
  `jumlah_pembelian` varchar(5) DEFAULT NULL,
  `total` int(6) DEFAULT NULL,
  `tempat_pembelian` varchar(20) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`id_pembelian`),
  KEY `id_bahan_baku` (`id_bahan_baku`),
  KEY `nip` (`nip`),
  CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_bahan_baku`) REFERENCES `stok` (`id_bahan_baku`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `pegawai` (`nip`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `pembelian` */

insert  into `pembelian`(`id_pembelian`,`id_bahan_baku`,`nip`,`harga`,`jumlah_pembelian`,`total`,`tempat_pembelian`,`tanggal`) values 
('0001','bb02','10119171',30000,'4',120000,'Fromus','2021-07-14'),
('0002','bb01','10119186',10000,'7',70000,'borma','2021-07-12');

/*Table structure for table `stok` */

DROP TABLE IF EXISTS `stok`;

CREATE TABLE `stok` (
  `id_bahan_baku` varchar(11) NOT NULL,
  `nama_bahan_baku` varchar(25) DEFAULT NULL,
  `jumlah_stok` int(5) DEFAULT NULL,
  PRIMARY KEY (`id_bahan_baku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `stok` */

insert  into `stok`(`id_bahan_baku`,`nama_bahan_baku`,`jumlah_stok`) values 
('bb01','fresh milk',7),
('bb02','beans mekarwangi',2),
('bb03','beans houseblend',3),
('bb04','sprite',3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
