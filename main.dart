int validPin = 945313;
double balance = 1000000;
double limit = 2000000;
int wrongPin = 0;
bool blocked = false;

// proses perhitungan bisnis ada di function ini semua
void payment(double total, int inputPin) {
  /*cek status akun dipaling awal buat mastiin
   kalo akun yang ke blokir gak bisa transaksi
  */
  if (blocked) {
    print("Akun anda di blokir! transaksi dibatalkan.");
    return;
  }

  bool checkPin = inputPin == validPin;

  // cek pin pake switch case
  switch (checkPin) {
    case true:
      wrongPin = 0;
    case false:
      wrongPin = wrongPin + 1;
      print("Pin Salah! ($wrongPin/3)");

      if (wrongPin >= 3) {
        blocked = true;
        print("Akun Anda Di Blokir! Transaksi Dibatalkan.");
      }
      return;
  }

  //cek limit hariannya udah lewat apa belum
  if (total > limit) {
    print("Melebihi Batas Harian! Transaksi Dibatalkan.");
    return;
  }

  //cek saldo buat transaksinya cukup apa nggak
  if (total > balance) {
    print("Saldo Tidak Mencukupi! Transaksi Dibatalkan.");
    return;
  }

  /* setiap transaksi berhasil saldo bakal langsung dikurang
     begitupun dengan limit harian bakal langsung dikurangi juga
  */
  balance = balance - total;
  limit = limit - total;

  // Karena ini function gak balikin value ke main, jadi hasil di cetak langsung disini
  print("SUKSES! Transaksi Berhail!");
  print("Saldo : Rp.$balance");
  print("Limit Harian : Rp.$limit");
}

void main() {
  //transaksi normal (sukses)
  payment(500000, 945313);

  //salah pin 1x
  payment(2000000, 111111);

  // limit harian
  payment(2500000, 945313);

  //Saldo gak cukup
  payment(1500000, 945313);

  //salah pin 3x (blokir akun)
  payment(100000, 123123);
  payment(100000, 123123);
  payment(100000, 123123);

  //Test transaksi abis kena blokir
  payment(10000, 945313);
}
