/* created in 06/06/2020 */
void main(){
  // Method Overriding
  var asu = Asu();
  asu.makan();
  print(asu.warna); // ireng

  // Inheritance dengan default constructor
  var kucing = Kucing("tajam","ngeong");
  print("");
  var kucing2 = Kucing("sayup","meow");
  print("");
  // Inheritance dengan named constructor
  var kucing3 = Kucing.nmConstructorKu("mblereng","mbraung");
  print("");

  // abstract class
  // var btk = Bentuk(); error krn abstract class
  var segiPnjg = SegiPanjang();
  segiPnjg.gambar();
  var lingk = Lingkaran();
  lingk.gambar();

  // interface
  var pc = Komputer();
  pc.keyDown();
  pc.keyUp();

  // Static var & methods
  var circ = Circle();
  // circ.pi; (tidak bisa sebab var static)
  print(Circle.pi);
  // circ.kalkulasi(); (tidak bisa sebab method static)
  Circle.kalkulasi();
  Circle().normalFungsi();
}


// method overriding
class Kewan{
  String warna = 'kuning';
  void makan(){
    print("kewan sedang makan..");
  }
}
class Asu extends Kewan{
  String bulu;
  String warna = 'ireng';
  void makan(){
    super.makan(); // kewan sedang makan
    print("Asu sedang makan..");
  }
  void gonggong(){
    print("Guk-guk-guk..");
  }
}
// inheritance with constructor
class Hewan{
  String suara;
  Hewan(String suara){
    this.suara = suara;
    print("Suara hewan constructor ini ${this.suara}");
  }
  Hewan.nmConstructorKu(String suara){
    this.suara= suara;
    print("suara hewan named constructor ini ${this.suara}");
  }

}
class Kucing extends Hewan{
  String tipeMata;
  Kucing(String tipeMata, String suara):super(suara) {
    this.tipeMata=tipeMata;
    print("Kucing constr ini bertipe mata: ${this.tipeMata}");
  }
  Kucing.nmConstructorKu(String tipeMata, String suara):super.nmConstructorKu(suara){
    this.tipeMata = tipeMata;
    print("Kucing nm constr ini bertipe mata: ${this.tipeMata}");
  }
}
// abstract class
abstract class Bentuk{
  int x; int y;
   
  void gambar(); // abstract methods
}

class SegiPanjang extends Bentuk{
  void gambar(){ // perlu override di sub-class
    print('menggambar segi panjang..');
  }
}

class Lingkaran extends Bentuk{
  void gambar(){
    print('menggambar lingkaran..');
  }
}
// interface
class Keyboard{
  void keyUp(){
    print("___Key Up from keyboard..");
  }
  void keyDown(){
    print("___Key Down from keyboard..");
  }
}
// yg bertindak sebagai interface
class Komputer implements Keyboard{
  void keyUp(){
    print("___Key up in komputer..");
  }
  void keyDown(){
    print("___Key Down in komputer..");
  }
}
// Static Method & Variable
class Circle{
  static double pi = 3.14;
  static int maxRad = 5;

  String color;

  static void kalkulasi(){
    print("Angka telah dikalkulasi..");
    // this.normalFungsi(); pada static method jg tidak bisa mgnk normal func
    // this.color; juga sama pada variable
  }

  void normalFungsi(){
    print("ini normal fungsi");
    Circle.kalkulasi();
    this.color = 'hijau';
    print(Circle.pi);
    print(this.color);
  }
}
// rafikbojes, 11:35 AM, 06/06/2020 (terlamabat 1 hari)