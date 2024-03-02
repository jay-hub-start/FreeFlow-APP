import "dart:developer";

import "package:freeflow/dbHelper/constant.dart";
import "package:mongo_dart/mongo_dart.dart";

class MongoDatabase{
  static var db, userCollections;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollections = db.collection(USER_COLLECTION);

  }
}