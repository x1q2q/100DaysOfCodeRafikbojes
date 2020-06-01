/* created in 01/06/2020 */
void main(){
  /* Tipe Data dan Variabel */ 
  // Number: int
  int nilai1 = 12; // 12
  var nilai3 = 13; // 13
  int hexVal = 0xAFEDBE; // 11529662

  double nilai2 = 12.5; // 12.5
  var nilai4 = 14.5; // 14.5
  double exponents = 1.52e6; // 1520000.0

  String hewan = "kucing"; // kucing
  var bunga = "anggrek"; // anggrek
  
  bool isKucingHewan = true; // true
  var isAnggrekHewan = false; // false

  /* String & String Interpolation */
  // Macam penulisan String
  String st1 = 'Satu petik';
  String st2 = "Dua petik";
  String st3 = 'jum\'at barokah';
  String st4 = "jum'at barokah";
  String st5 = 'Contoh jika menuliskan teks yang. '+
                'teramat panjang, maka perlu dipisah';

  // String interpolation
  String mhs = "Bojes";

  print("Nama mahasiswa adl $mhs");
  print("Karakter yg ada pada string mhs adl "+
        mhs.length.toString());
  print("Karakter yg ada pada string mhs adl ${mhs.length}");

  int x=10;
  int y=20;
  print("Penjumlahan x($x)+y($y) adl ${x+y}");

  /*  Final & Constant */
  //  FINAL
  final siswa = "Adit"; 
  // siswa = "Lukman"; //maka akan error
  final String desa = "pengadegan";

  // CONST
  const PI = 3.14;
  const double volBola = 100.9;
  // class {
    // bisa dg: final warna = 'hijau';
    // bisa dg: static const PI= 3.14;
  // }

  /* Conditional Statement & Expression */
  // If and Else satu kondisi
  var totBelanja = 30000;
  if (totBelanja > 25000){
    print("Selamat anda mendapatkan diskon!");
  }else{
    print("Maaf, anda belum mendapat diskon..");
  }

  // If Else If pernyataan berjenjang (>1 kondisi)
  var nilai = -1;
  if(nilai>=90 && nilai < 100){
    print('Nilai A+'); // jika nilai 90-99
  }else if(nilai>=80 && nilai < 90){
    print("Nilai A"); // jika nilai 80-89
  }else if(nilai>=70 && nilai < 80){
    print("Nilai B");// jika nilai 70-79
  }else if(nilai >=60 && nilai < 70){
    print("Nilai C"); // jika nilai 60-69
  }else if(nilai >=40 && nilai <60){
    print("Nilai D"); // jika nilai 40-59
  }else if(nilai >= 0 && nilai <40){ 
    print("Nilai E!"); // jika nilai 0-39
  }else{
    print("Nilai Invalid");
  }
  // Conditional Expressions 
  // (Ternary)
   int nilaiA = 2;
   int nilaiB = 1;
   print(nilaiA>nilaiB ? "a > b ":"a < b");

  // untuk check null var
  String huruf;
  String cetakHuruf = huruf??"A"; 
  // jika var huruf null maka akan cetak A (utk menghindari null var)
  print(cetakHuruf);

  /* Switch Case */
  // pernyataan Kondisi Switch-Case
  String jurusan = 'pendidikan TIK';
  switch(jurusan){
    case 'informatika':
      print("Jurusan bagus!");
      break;
    case 'manajemen':
      print("jurusan lumayan bagus!");
      break;
    case 'sastra':
      print("jurusan yang agak bagus!");
      break;
    case 'pendidikan TIK':
      print("jurusan yang amat bagus!");
      break;
    default:
      print("Jurusan apa itu ya?");
  }
}
// rafikbojes, 10:20 PM - 01/06/2020