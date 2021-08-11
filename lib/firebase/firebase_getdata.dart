import 'package:firebase_database/firebase_database.dart';
import 'package:wybe/models/user_model.dart';

class GetData{
  List<userModelItem> listItems = [];

  Future<List<userModelItem>> firebaseCalls (DatabaseReference databaseReference) async{
    UserList userList;
    DataSnapshot dataSnapshot = await databaseReference.once();
    Map<dynamic,dynamic> jsonResponse=dataSnapshot.value[0]['content'];
    userList = new UserList.fromJSON(jsonResponse);
    listItems.addAll(userList.userList);

    return listItems;

  }


}