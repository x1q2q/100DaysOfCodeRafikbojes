/* created in 02/06/2020 */
void main(){
  /* Dart Loops*/
  // For Loop
  for (int i=1; i<=10; i++){
    if(i%2==0) print(i); // print utk bilangan genap
  }
  // While Loop
  bool isBolaJatuh = true;
  int a =5;
  while(isBolaJatuh){
    if(a==1) isBolaJatuh=false;
    print("Bola jatuh ke-$a");
    a--;
  }
  // Do While Loop
  int b = 1;
  do{
    print('Ini putaran ke-$b');
    b++;
  }while(b<4);

  // Break & Continue Statement
  int d=0;
  while(true){ 
    // berhenti stlh ketemu angka ganjil yg lebih dari 5 
    if(d%2==1 && d>5){
      print("ini dia angkanya $d");
      break;
    }
    d++;
  }
  
  for(int x=0;x<10;x++){ 
    // print angka 0-9, kecuali 5
    if(x==5) continue;
    print(x);
  }
  // break using labels
  outerLoopSaya: for(int g=1;g<=2;g++){
    for(int h=1;h<=2;h++){
      print("$g $h");
      if(g==2&&h==2) break outerLoopSaya; // [..] 2 2
    }
  }

  /* Function Expressions */
  // void function
  void luasSegitiga(int alas, int tinggi){
    int hasil = alas * tinggi;
    print('Luas segitiga dari $alas & $tinggi adl ${hasil/2}');
  }
  luasSegitiga(10, 2);

  // non void (dg return type; int)
  int luasPersegi(int s){
    return s*s;
  }
  print("Luas persegi adl ${luasPersegi(5)}");

  // Short hand syntax
  // Fat arrow
  void arahJalan(String arah) => print('Kamu berjalan ke-$arah');
  arahJalan('kiri');

  int klSegiPanjang(int p, int l) => 2*(p+l);
  print(klSegiPanjang(10, 2));

  /* Parameters in Function */
  // Optional Positional Parameters [,]
  void cetakKota(String kota1, [String kota2]){
    print('cetak kota ke1=> $kota1');
    print('cetak kota ke2=> $kota2');
  }
  cetakKota('Purbalingga'); // dapat mengisi 1kali saja

  // Optional Named Parameters
  int cekVolume(int p, {int l, int t}){
    return p * l * t;
  }
  var hasil = cekVolume(2,t:3,l:1);
  print(hasil);
  
  // Optional Default Parameters
  int cekVolume2(int p, int l, {int t =5}){
    return p*l*t;
  }
  print(cekVolume2(5, 2)); // 5*7*5 = 50
  print(cekVolume2(2, 4,t:6)); // 2*4*6 = 48 (dg override) 
}
// rafikbojes, 10:05 PM - 02/06/2020
