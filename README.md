# Tugas Individu - Studi Kasus : E-Wallet
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

## 6. Decomposition
    payment
        ├── lowBalance         → memastikan saldo tidak minus                             (RB-01)
        ├── limit              → menolak transaksi jika melebihi limit harian             (RB-02)
        ├── wrongPin           → cek kesalahan pin pakai boolean dengan maksimal 3x salah (RB-03)
        ├── blocked            → blokir akun ketika salah input pin 3x                    (RB-03)
        └── tampilkan hasil transaksi

## 7. Pattern Recognition
Dalam sistem e-wallet ini kemungkinan ada beberapa pola: 
* <strong>Pengecekan kondisi</strong> : artinya setiap kali transaksi dilakukan sistem akan mengecek saldo nasabah cukup atau tidak, batas limit harian, dan pin yang dipakai benar atau salah.
* <strong>Counter kesalahan</strong> : Sistem akan selalu mengecek batas kesalahan pin yang diinput apakah sudah mencapai batas 3x atau belum.
* <strong>Nominal yang berkurang</strong> : Setiap transaksi berhasil, sistem akan selalu mengurangi saldo nasabah dan juga limit hariannya.

## 8. Abstraction
    payment
        ├── pin
        ├── balance
        └── limit

Dalam sistem pembayaran pada umumnya, ada 3 hal yang biasanya pasti ada. yaitu :
* Pin sebagai media pengaman saat transaksi
* Saldo
* Limit saldo, bisa berupa harian maupun bulanan. Tapi di sistem ini di set limit harian.

3 aspek ini pasti akan selalu ada di setiap sistem pembayaran.

## 9. Flowchart
          [Start]
             |
             ▼
    [Input Nominal & Pin]
             |
             ▼       
        [Pin Valid?]─────────────────────────────────────────────────────► [Tampilkan Pesan : Pin Salah]
        Ya   |        Tidak                                                                 |
             |                                                                              ▼      Tidak
             |                                                                        [Salah 3x?]───────► [Tampilkan Pesan : Pin Salah]
             |                                                                          Ya  |                               |
             |                                                                              ▼                               |
             ▼                                                                       [Akun Diblokir]                        |
    [Batas Limit Harian?]─────► [Tampilkan Pesan : Limit Terpenuhi]                         |                               |
             |            Ya                                                                ▼                               |
       Tidak |                                                                          [Selesai] ◄─────────────────────────┘
             ▼
      [Saldo Cukup?]─────► [Tampilkan Pesan : Saldo Tidak Cukup]
             |      Tidak
          Ya |
             ▼
        [Potong Saldo dan 
    Turunkan Sisa Limit Harian]
             |
             |
             ▼
      [Tampilkan Pesan :
     Transaksi Berhasil]
             |
             |
             ▼
         [Selesai]

Untuk menggambarkan bagaimana sistem ini bekerja, dapat dilihat pada diagram alur (flowchart) ini.

## 10. Pseudocode
    PROCEDURE payment(total, inputPin)
        IF blocked THEN
            DISPLAY "Akun Diblokir"
            RETURN "Transaksi Dibatalkan."
        END IF

        IF inputPin != validPin THEN
            wrongPin = wrongPin + 1
            DISPLAY "Pin Salah!"
            IF wrongPin >= 3 THEN
                blocked = TRUE
                DISPLAY = "Akun Anda Diblokir!"
            END IF
            RETURN "Transaksi Dibatalkan."
        END IF

        wrongPin = 0

        IF total > limit THEN
            DISPLAY "Melebihi Batas Transaksi Harian"
            RETURN "Transaksi Dibatalkan."
        END IF

        IF total > saldo THEN
            DISPLAY "Saldo Tidak Mencukupi!"
            RETURN "Transaksi Dibatalkan."
        END IF

        balance = balance - total
        limit = limit - total

        DISPLAY "Transaksi Berhasil!"
        RETURN "Sukses"
    END PROCEDURE