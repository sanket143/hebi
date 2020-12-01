import 'package:path_provider/path_provider.dart';

import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Hebi {
  static const String dbPath = "hebi.db";

  static Future<Database> getDatabase() async {
    final directory = await getApplicationDocumentsDirectory();

    DatabaseFactory dbFactory = databaseFactoryIo;

    // We use the database factory to open the database
    Database db = await dbFactory.openDatabase(join(directory.path, dbPath));
    
    return db;
  }
}