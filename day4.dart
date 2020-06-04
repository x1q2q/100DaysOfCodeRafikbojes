/* created in 04/06/2020 */
void main(){
  /* Getter & Setter */
  // Default
  var tumbuhan = Tumbuhan();
  tumbuhan.jenis = 'merambat'; // setter, to set value 
  print(tumbuhan.jenis); // getter, to get value

  // Custom
  tumbuhan.cektinggi =12;
  print(tumbuhan.cektinggi);

  /* Inheritance */
  var cat = Kucing();
  cat.bulu = 'halus';
  cat.warna='coklat';
  cat.ngeong();
  cat.berjalan();

  var asu = Anjing();
  asu.umur = 5;
  asu.warna='black';
  asu.berjalan();
  asu.gonggong();
} 
class Tumbuhan{
  String jenis; // Instance variable dg default getter,setter
  int tinggi;
  void set cektinggi(int t){
    tinggi = t*2; // Instance variable dg custom setter
  }
  int get cektinggi{
    return tinggi; // Instance variable dg custom getter
  }
  // Private Instance variable
  int _berat;
  void set cekberat(int b) => _berat = b~/2;
  int get cekberat => _berat;
}

class Hewan{ // parent class
  String warna;
  
  void berjalan(){
    print("Sekarang tengah berjalan...");
  }
}
class Kucing extends Hewan{ // sub/child class
  String bulu;
  void ngeong(){
    print("meong-meong-meong..");
  }
}
class Anjing extends Hewan{ // sub/child class
  int umur;
  void gonggong(){
    print("Guk-guk-guk..");
  }
}
// rafikbojes, 11:38 PM, 04/06/2020