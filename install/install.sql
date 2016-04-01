CREATE TABLE IF NOT EXISTS PREFIX_pembayaran_bank (
id_pembayaran_bank int(11) NOT NULL AUTO_INCREMENT,
nama_bank varchar(20) NOT NULL,
nama_owner varchar(20) NOT NULL,
no_rekening varchar(20) NOT NULL,
PRIMARY KEY (id_pembayaran_bank)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 