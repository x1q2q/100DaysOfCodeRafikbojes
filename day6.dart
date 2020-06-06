/* created in 06/06/2020 */
void main(){
  /* Lambda Expression */
  // cara 1
  Function perkalianXY = (int x, int y){
    var sum = x*y;
    print(sum);
  };

  var perkalianDua = (int num){
    return num*2;
  };
  // cara 2
  Function penjumlahanAB = (int a, int b) => print(a+b);
  var perkalianTiga = (int num) => num*3;
  
  // Memanggil lambda func
  perkalianXY(4,6);
  print(perkalianDua(4));

  penjumlahanAB(5,5);
  print(perkalianTiga(3));
  print("");

  /* Higher-Order Function */
  // 1.) pass function ke higher-order func
  Function tambahAngka = (a,b)=>print(a+b);
  satuFungsiLainnya("hallo",tambahAngka);
  // 2.) menerima func dari higher-order func
  var myFunc = tugasPerform();
  print(myFunc(2));   // tugasPerform() => perkalianEmpat(4), 2*4

  /* Closures */  
  // 1-fungsi yang mengakses parent scope, 
  // bahkan setelah scope tertutup
  String pesan = 'Selamat siang!';
  Function tampilPesan = (){
    pesan = "Selamat sore!";
    print(pesan);
  };
  tampilPesan();
  // 2-fungsi yang mengakses 
  
  Function bicara =(){
    String pesan2 = "hallo";
    Function ngomong =(){
      pesan2 = "haiii";
      print(pesan2);
    };
    return ngomong;
  };

  Function talk = bicara();
  talk(); // bicara() // ngomong()
}

// 1.) menerima fungsi sebagai parameter
void satuFungsiLainnya(String msg, Function myFunc){
  print(msg);
  myFunc(2,4); // sama seperti tambahAngka(2,4)
}

// 2.) mengembalikan function
Function tugasPerform(){
  Function perkalianEmpat = (int num) => num*4;
  return perkalianEmpat;
}
// rafikbojes, 9:38 PM, 06/06/2020