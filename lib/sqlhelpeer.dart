
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProductManager {
  late Database _datebase;

  Future openDB() async {
    _datebase = await openDatabase(join(await getDatabasesPath(), "product.db"),
        version: 1, onCreate: (Database db, int version)
        async {
          await db.execute("CREATE TABLE product1(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,category TEXT,price TEXT,offerprice TEXT,status TEXT,url TEXT)");
        });
  }



  Future<int> insertProduct(Product2 product) async {
    await openDB();
    return await _datebase.insert('product1', product.toMap());

  }




  Future<List<Product2>> getProductList() async {
    await openDB();
    final List<Map<String, dynamic>> maps = await _datebase.query('product1');
    return List.generate(maps.length, (index) {
      return Product2(id: maps[index]['id'],
          name: maps[index]['name'],
          category: maps[index]['category'],
          price: maps[index]['price'],
          offerprice: maps[index]['offerprice'],
          status: maps[index]['status'],
          url : maps[index]['url']);
    });
  }


  // Future<int> updateStudent(Product2 product) async {
  //   await openDB();
  //   return await _datebase.update('product', product.toMap(), where: 'id=?', whereArgs: [product.id]);
  // }
  //
  Future<void> deleteStudent(int? id) async {
    await openDB();
    await _datebase.delete("product1", where: "id = ? ", whereArgs: [id]);
  }
}

class Product2 {
  late int ?id;
  late String name;
  late String category;
  late String price;
  late String offerprice;
  late String status;
  late String url;
  Product2( {this. id,required this.name, required this.category, required this.price, required this.offerprice, required this.status,
    required this.url});

  Map<String, dynamic> toMap() {
    return {'name': name, 'category': category,'price':price, 'offerprice':offerprice,'status':status,'url':url};
  }
}