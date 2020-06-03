/* created in 03/06/2020 */
void main(){
  /* Exception Handling */
  //  try & catch
  print('CASE1');
  try{
    int res = 12~/0;
    print(res);
  }on IntegerDivisionByZeroException{
    print("tidak bisa membagi angka 0");
  }
  print(''); print('CASE2');
  try{
    int res = 12~/0;
    print(res);
  }catch(e){
    print("Error kode $e");
  }

  // Example
  print(''); print('CASE3');
  // cekAngk(-10); //error exception has occured
  try{
    cekAngk(-20);
  }catch(e){
    print(e.errorMessage());
  }

  /* Class Obj, Instance, & Reference */
  // var mhs = Mahasiswa();
  // mhs.nomorIM = 15;
  // mhs.namaMhs = 'Arafik';

  var mhs = Mahasiswa(15,'Arafik');
  print("${mhs.namaMhs} dengan ${mhs.nomorIM}");

  mhs.belajar();
  mhs.makan();
}

class Mahasiswa{
  int nomorIM; // Instance / field Variable
  String namaMhs; // as the same in the top

  Mahasiswa(int id, String nm){
    this.nomorIM = id;
    this.namaMhs = nm;
    /* atau sama dg di bawah (jika nm prop. sama)
    nomorIM = _nomorIM;
    namaMhs = _namaMhs;
     */
  }
  /* dan dapat diganti juga dengan
  // parameterized constructors 
    Mahasiswa(this.nomorIM,this.namaMhs); 
  */
  Mahasiswa.cusomtConstructor(){ // named constructor
    print('custom constructor');
  }
   Mahasiswa.anotherCusomtConstructor(this.nomorIM, this.namaMhs); // named constructor

  void belajar(){
    print("${this.namaMhs} sedang belajar");
  }
  void makan(){
    print("${this.namaMhs} sedang makan");
  }
}

class cekAngkaException implements Exception{
  String errorMessage(){
    return "tidak bisa menuliskan angka kurang dari 0";
  }  
}
void cekAngk(int angk){
  if(angk<0) throw new cekAngkaException();
}
// rafikbojes, 11:59 PM, 03/06/2020