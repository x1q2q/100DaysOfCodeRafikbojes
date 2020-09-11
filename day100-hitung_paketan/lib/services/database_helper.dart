// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import '../models/input_paketan.dart';
// import '../models/input_kategori.dart';

// class DatabaseHelper {
//   DatabaseHelper._();

//   static const databaseName = 'hitung_paketan.db';
//   static final DatabaseHelper instance = DatabaseHelper._();
//   static Database _database;

//   Future<Database> get database async {
//     if (_database == null) {
//       return await initializeDatabase();
//     }
//     return _database;
//   }

//   initializeDatabase() async {
//     return await openDatabase(join(await getDatabasesPath(), databaseName),
//         version: 1, onCreate: (Database db, int version) async {
//       await db.execute('''
//           CREATE TABLE kategori(
//           id INTEGER PRIMARY KEY,
//           id_kat TEXT,
//           kategori TEXT
//           )
//         ''');
//       await db.execute('''
//         CREATE TABLE hitung(
//           id INTEGER PRIMARY KEY,
//           id_kat TEXT,
//           id_hitung TEXT,
//           id_pktn TEXT,
//           nama_pktn TEXT,
//           stok_awal TEXT,
//           stok_tambah TEXT,
//           stok_akhir TEXT,
//           tgl TEXT
//           )
//         ''');
//     });
//   }

//   Future<bool> getHitung(String tgl) async {
//     final db = await database;
//     var mapList = await db.query('hitung', where: 'tgl="$tgl"');
//     return mapList.length > 0 ? true : false;
//   }

//   Future<List<InputKategori>> getDataTemp(String tgl) async {
//     final db = await database;

//     List _cekData(id, data) {
//       List newDt = List();
//       data.forEach((el) {
//         if (el['id_kat'] == id) {
//           newDt.add(el);
//         }
//       });
//       return newDt;
//     }

//     try {
//       var jsonRes = List();
//       Map<String, dynamic> dt = {'id_kat': List(), 'kategori': List()};

//       List<Map> query = await db.rawQuery(
//           ''' SELECT * FROM hitung as h JOIN kategori as k ON h.id_kat=k.id_kat WHERE h.tgl='$tgl' ''');
//       query.forEach((el) {
//         if (!dt['id_kat'].contains(el['id_kat'])) {
//           dt['id_kat'].add(el['id_kat']);
//           dt['kategori'].add(el['kategori']);
//         }
//       });
//       for (int i = 0; i < dt['id_kat'].length; i++) {
//         Map<String, dynamic> newDt = {
//           'id_kat': dt['id_kat'][i],
//           'kategori': dt['kategori'][i],
//           'paketan': _cekData(dt['id_kat'][i], query)
//         };
//         jsonRes.add(newDt);
//       }
//       return jsonRes
//           .map<InputKategori>((json) => InputKategori.toMap(json))
//           .toList();
//     } catch (e) {
//       print(e);
//       throw Exception('Error: $e');
//     }
//   }

//   Future<bool> notInTable(String table, String whereDt) async {
//     final db = await database;
//     var mapList = await db.query(table, where: whereDt);
//     return mapList.length > 0 ? false : true;
//   }

//   insertPktn(InputPaketan dt) async {
//     final db = await database;
//     var res = await db.insert(
//         'hitung',
//         {
//           'id_kat': dt.idKat,
//           'id_hitung': dt.idHitung,
//           'id_pktn': dt.idPktn,
//           'nama_pktn': dt.namaPaketan,
//           'stok_awal': dt.stokAwal,
//           'stok_tambah': dt.stokTambah,
//           'stok_akhir': dt.stokAkhir,
//           'tgl': dt.tgl
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace);
//     print('insert data paketan ' + dt.namaPaketan);
//     return res;
//   }

//   insertKat(InputKategori dt) async {
//     final db = await database;
//     var res = await db.update(
//         'kategori', {'id_kat': dt.idKat, 'kategori': dt.kategori},
//         conflictAlgorithm: ConflictAlgorithm.replace);
//     print('insert data kategori ' + dt.kategori);
//     return res;
//   }

//   updatePktn(InputPaketan dt) async {
//     final db = await database;

//     var res = await db.update(
//         'hitung',
//         {
//           'id_kat': dt.idKat,
//           'id_hitung': dt.idHitung,
//           'id_pktn': dt.idPktn,
//           'nama_pktn': dt.namaPaketan,
//           'stok_awal': dt.stokAwal,
//           'stok_tambah': dt.stokTambah,
//           'stok_akhir': dt.stokAkhir,
//           'tgl': dt.tgl
//         },
//         where: 'id_hitung=?',
//         whereArgs: [dt.idHitung],
//         conflictAlgorithm: ConflictAlgorithm.replace);
//     print('updated data paketan ' + dt.namaPaketan);
//     return res;
//   }

//   updateKat(InputKategori dt) async {
//     final db = await database;

//     var res = await db.update(
//         'kategori', {'id_kat': dt.idKat, 'kategori': dt.kategori},
//         where: 'id_kat=?',
//         whereArgs: [dt.idKat],
//         conflictAlgorithm: ConflictAlgorithm.replace);
//     print('updated data kategori ' + dt.kategori);
//     return res;
//   }

//   deletePktn(String tgl) async {
//     var db = await database;
//     var res = await db.delete('hitung', where: 'tgl=?', whereArgs: [tgl]);
//     print('delete data paketan ' + tgl);
//     return res;
//   }
// }

// // #GET DATA SUMMARY PIE-CHART KATEGORI-UNTUNG/ tgl
// // select k.kategori, sum(kt.untung) from kategori as k join paketan as p on k.id_kat=p.id_kat
// // join keuntungan as kt on p.id_pktn=kt.id_pktn where kt.tgl='2020-09-07' group by k.kategori;

// // #GET DATA SUMMARY PIE-CHART KATEGORI-STOK_TERJUAL/ tgl
// // select k.kategori, sum(kt.terjual) from kategori as k join paketan as p on k.id_kat=p.id_kat
// // join keuntungan as kt on p.id_pktn=kt.id_pktn where kt.tgl='2020-09-07' group by k.kategori;

// // #GET DATA SUMMARY PIE-CHART KATEGORI-ITEM_PAKETAN/ all
// //  select k.kategori, count(p.id_pktn) as item from kategori as k join
// //  paketan as p on k.id_kat=p.id_kat group by k.kategori;

// // #GET DATA SUMMARY PIE-CHART KATEGORI-LABA/ all
// //  select count(*) from paketan group by laba order by laba asc;
