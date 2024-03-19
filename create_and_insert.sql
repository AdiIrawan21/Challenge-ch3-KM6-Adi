-- Adi Irawan BEJS-1

-- Perintah DDL

-- Create DATABASE
CREATE DATABASE db_perbankan;

CREATE TABLE nasabah (
	id_nasabah BIGSERIAL PRIMARY KEY,
	alamat TEXT NOT NULL,
	no_telp VARCHAR(20)
);

ALTER TABLE nasabah ADD column nama VARCHAR(50);

CREATE TABLE akun (
	id_akun BIGSERIAL PRIMARY KEY,
	id_nasabah INT REFERENCES Nasabah(id_nasabah),
	jenis_akun VARCHAR(50) NOT NULL,
	saldo NUMERIC(10, 2) NOT NULL
);

CREATE TABLE transaksi (
	id_transaksi BIGSERIAL PRIMARY KEY,
	id_akun INT REFERENCES Akun(id_akun),
	tipe_transaksi VARCHAR(100) NOT NULL,
	jumlah NUMERIC(10, 2) NOT NULL,
	tanggal DATE NOT NULL
);


-- Perintah DML

-- Read data

SELECT * FROM nasabah;
SELECT * FROM akun;
SELECT * FROM transaksi;

-- Insert data nasabah
INSERT INTO nasabah (alamat, no_telp, nama) VALUES ('Tangerang', '087787309121', 'Adi Irawan');
INSERT INTO nasabah (alamat, no_telp, nama) VALUES ('Tangerang Selatan', '081212877413', 'Afif Luthfi');
INSERT INTO nasabah (alamat, no_telp, nama) VALUES ('Tangerang', '087787906543', 'Anggi Kurniawan');

-- Insert data akun
INSERT INTO akun (id_nasabah, jenis_akun, saldo) VALUES ('1', 'Debit', '1000000');
INSERT INTO akun (id_nasabah, jenis_akun, saldo) VALUES ('1', 'Kredit', '2000000');
INSERT INTO akun (id_nasabah, jenis_akun, saldo) VALUES ('2', 'Debit', '5000000');

-- Insert data transaksi
INSERT INTO transaksi (id_akun, tipe_transaksi, jumlah, tanggal) VALUES ('1', 'Setoran', '500000', '2024-03-17');
INSERT INTO transaksi (id_akun, tipe_transaksi, jumlah, tanggal) VALUES ('2', 'Tarik Tunai', '100000', '2024-03-17');
INSERT INTO transaksi (id_akun, tipe_transaksi, jumlah, tanggal) VALUES ('1', 'Tarik Tunai', '200000', '2024-03-17');

-- Update saldo akun dengan id = 1 menjadi 2.000.000
UPDATE akun SET saldo = 2000000 WHERE id_akun = 1;

-- Hapus salah satu data transaksi dengan id = 2
DELETE FROM transaksi WHERE id_transaksi = 2;
