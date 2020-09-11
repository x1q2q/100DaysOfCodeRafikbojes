import 'package:dio/dio.dart';
import '../config/Fnc.dart';
import '../models/pktn_allpaketan.dart';
import '../models/pktn_dtlpaketan.dart';
import '../models/pktn_kategori.dart';
import 'dart:async';
import '../models/stats_paketan.dart';
import '../models/stats_allpenjualan.dart';
import '../models/input_kategori.dart';
import '../models/input_paketan.dart';

class HitungPaketan {
  Dio dio = Dio();
  Future<List<InputKategori>> getPaketanList(String params) async {
    try {
      Response resp = await dio.get(Fnc.urlAPI + 'paketanlist/' + params);
      return resp.data['data']
          .map<InputKategori>((json) => InputKategori.toMap(json))
          .toList();
    } catch (e) {
      throw Exception('error $e');
    }
  }

  Future<List<StatsAllpenjualan>> getAllPenjualan() async {
    try {
      Response resp = await dio.get(Fnc.urlAPI + 'penjualanlist/');
      return resp.data['data']
          .map<StatsAllpenjualan>((json) => StatsAllpenjualan.fromMap(json))
          .toList();
    } catch (e) {
      throw Exception('error $e');
    }
  }

  Future<List<StatsPaketan>> getPenjualanDetail(String params) async {
    try {
      Response resp = await dio.get(Fnc.urlAPI + 'penjualandetail/' + params);
      return resp.data['data']
          .map<StatsPaketan>((json) => StatsPaketan.fromMap(json))
          .toList();
    } catch (e) {
      throw Exception('error $e');
    }
  }

  Future<List<PktnKategori>> getKategori() async {
    try {
      Response resp = await dio.get(Fnc.urlAPI + 'getall/kategori/');
      return resp.data['data']
          .map<PktnKategori>((json) => PktnKategori.fromMap(json))
          .toList();
    } catch (e) {
      throw Exception('error $e');
    }
  }

  Future<List<PktnAllpaketan>> getPaketan(String type,
      [Map<String, dynamic> dt]) async {
    try {
      String urlGet = type == 'detail'
          ? Fnc.urlAPI + 'getall/paketan/' + dt['param'] + '/' + dt['where']
          : Fnc.urlAPI + 'getall/paketan/';
      Response resp = await dio.get(urlGet);
      return resp.data['data']
          .map<PktnAllpaketan>((json) => PktnAllpaketan.fromMap(json))
          .toList();
    } catch (e) {
      throw Exception('error $e');
    }
  }

  Future<PktnDtlpaketan> getPaketanDetail(String idPktn, String tgl) async {
    try {
      String urlGet = Fnc.urlAPI + 'paketandetail/' + idPktn + '/' + tgl;
      Response resp = await dio.get(urlGet);
      return PktnDtlpaketan.fromMap(resp.data['data']);
    } catch (e) {
      throw Exception('error $e');
    }
  }

  Future<bool> updateListPaketan(List<InputPaketan> dataEL, String tgl) async {
    bool res;
    await Future.wait(dataEL.map((el) async {
      try {
        Response resp = await dio.put(Fnc.urlAPI + 'paketanedit/' + el.idHitung,
            data: {
              'stok_tambah': el.stokTambah,
              'stok_akhir': el.stokAkhir,
              'tgl': tgl,
              'id_pktn': el.idPktn
            },
            options: Options(contentType: Headers.formUrlEncodedContentType));
        print('sukses' + resp.data.toString());
        res = true;
      } catch (e) {
        print(e.toString());
        res = false;
      }
    }));
    return res;
  }
}

// Future<String> updateListPaketan(Map<String, dynamic> data, String id) async {
//   try {
//     dio.options.headers['content-Type'] = 'application/json';
//     Response resp =
//         await dio.put(Fnc.urlAPI + 'paketanedit/' + id, data: jsonEncode(data));
//     // return InputPaketan.fromMap(resp.data['data']);
//     return resp.data.toString();
//   } catch (e) {
//     throw Exception('error ' + e.toString());
//   }
// final response = await http.put(
//   Fnc.urlAPI,
//   headers: <String, String>{"Content-Type": "application/json"},
//   body: jsonEncode(data),
// );
// if (response.statusCode == 200) {
// } else {
//   throw Exception('gagal update:' + response.body.toString());
// }
// }
