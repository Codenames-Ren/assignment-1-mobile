# Tugas Individu
Nama : Bayu Sukma <br>
NIM  : 1124160034

# Document Analysis

## 1. Propblem Statement
Membuat simulasi sistem pembayaran E-Wallet.

Sistem ini memiliki ketentuan bahwa saldo tidak boleh minus, adanya limit transaksi perhari sebesar <br>Rp. 2.000.000 dan jika salah pin sebanyak 3x maka akun akan diblokir.

## 2. Actor
Aktor yang menggunakan sistem ini adalah <strong> Nasabah (pemilik akun E-Wallet) </strong>

## 3. Input & Output
Input : 
* Nominal transaksi (total) : yakni jumlah uang yang akan digunakan
* Pin pengguna : kode pin yang digunakan sebagai verifikasi dalam sistem E-Wallet

Output :
* Status transaksi akan ditampilkan terlepas sukses atau gagal
* Informasi akun seperti sisa saldo, limit harian, percobaan pin jika seandainya saat transaksi sempat salah input.

## 4. Functional Requirements
Fungsi utama dalam sistem ini :
* Dapat melakukan transaksi
* Saldo bernilai positif (tidak minus)
* Memiliki limit harian
* memiliki batas input pin sebanyak 3x
* Mengecek pin demi keamanan transaksi
* Menampilkan hasil transaksi terlepas hasilnya transaksi sukses ataupun gagal

## 5. Business Rule

| Kode  | Business Rule                                                                  |
|-------|--------------------------------------------------------------------------------|
| RB-01 | Saldo tidak boleh minus                                                        |
| RB-02 | Transaki perhari dibatasi limit harian sebesar Rp. 2.000.000 (dua juta)        |
| RB-03 | Salah pin sebanyak 3x, maka akun E-Wallet akan di blokir                       |

## 6. 