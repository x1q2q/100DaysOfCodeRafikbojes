/* created in 08/06/2020 */
void main(){
  /* Arrays or List */
  // fixed-length list
  List<int> numList = List(5); // limit 5
  numList[0] = 73;
  numList[1] = 53;
  numList[2] = 93;
  numList[3] = 12;
  numList[4] = 42;
  for(int i=0; i<numList.length; i++){
    print(numList[i]); // 73,53 ...    
  } // cara1
  print("\n");
  for(int el in numList){
    print(el); // 73,53 ...   
  } // cara2
  print("\n");
  numList.forEach((elem) => print(elem));
  // cara3
  // 73,53 ...   
  

  // growable list
  // cara 1
  List<int> hargaBuku = [55000,65000];
  hargaBuku.add(78000);
  hargaBuku.add(35000);

  // cara 2
  List<String> hewanList = List();
  // penambahan element.
  hewanList.add('kucing');
  hewanList.add('wedus');
  hewanList.add('asu');
  hewanList.add('semut');
  hewanList.add('kuda');
  // update element
  hewanList[2] = 'anjing';
  // hapus element
  hewanList.remove('wedus'); // hapus dg value
  print(hewanList);
  // hapus dg kondisi
  hewanList.removeWhere((el) => el == 'kucing'); 
  print(hewanList);
  hewanList.removeAt(1); // hapus dg no.index
  print(hewanList);
   hewanList.clear();  // hapus semua elem
  print(hewanList);

  /* Set and HashSet */
  // cara 1 dg list
  Set<String> kota = Set.from(['banjar','pbg','pwt']);
  kota.add('solo');
  kota.add('cilacap');

  // cara 2 dg constructor
  Set<bool> cekDiskonToko = Set();
  Set<int> diskonHarga = Set();
  diskonHarga.add(80);
  diskonHarga.add(40);
  // diskonHarga.add(80); duplikat val. (ignored)

  kota.forEach((el)=> print(el));
  print(diskonHarga); // {80,40}
  for (int el in diskonHarga){
    print(el);
  }
  if(diskonHarga.contains(80)) print('ada diskon 80%');
  if(cekDiskonToko.isEmpty) print('kosong diskonan');  

  /* Map and HashMap */
  // cara 1 dg penamaan (literal)
  Map<String, String> nmTokoBukuKota ={
    'Klaten':'jendelaBook',
    'Jogja':'berdikariBook',
    'pbg':'jesBook'
  };
  // cara 2 dg  constructor
  Map<String, int> hargaBuah = Map();
  hargaBuah["anggur"] = 25000;
  hargaBuah["apel"]   = 12000;
  hargaBuah["nanas"]  = 10000;
  
  print(hargaBuah); // {anggur: 25000, .. }
  for(String key in hargaBuah.keys){
    print(key); //output all nama buah
  }
  print('\n');
  hargaBuah.forEach((key, val)=>print('harga $key => $val'));

  if(hargaBuah.containsKey("apel")) print('ya ada apel');
  hargaBuah.update("nanas", (val) => 15000);
  for(int hsl in hargaBuah.values){
    print(hsl); // harga buah yg telah diupdate
  }
  
  /* Callable Class */
  var org = Manusia();
  var pesan = org(12,"bojes");
  print(pesan); // namanya bojes dengan umur 12
}
class Manusia{
  String call(int umur, String nm){
    return 'namanya $nm dengan umur $umur';
  }
}
//rafikbojes, : , 07:12 AM  08/06/2020