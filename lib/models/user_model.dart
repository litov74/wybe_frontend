import 'dart:ffi';

class userModelItem{
  final int id;
  final String name;
  final String phone;
  final String status;
  final String isLoggedIn;
  final String friends;
  final int isRemember; //BOOl type is unsupported in SQLite, using int...
  final String profilePicRoute;
  final bool isOnline;
  final String email;
  final int rating;
  final int gender;
  final String city;
  final String location;

  userModelItem({
    required this.id,
    required this.name,
    required this.phone,
    required this.status,
    required this.isLoggedIn,
    required this.friends,
    required this.isRemember,
    required this.profilePicRoute,
    required this.isOnline,
    required this.email,
    required this.rating,
    required this.city,
    required this.gender,
    required this.location
  });

  factory userModelItem.fromJson(Map<dynamic,dynamic> parsedJson){
    return userModelItem(
        id: parsedJson['id'],
        name: parsedJson['name'],
        phone: parsedJson['phone'],
        status: parsedJson['status'],
        isLoggedIn: parsedJson['isLoggedIn'],
        friends: parsedJson['friends'],
        isRemember: parsedJson['isRemember'],
        profilePicRoute: parsedJson['profilePicRoute'],
        isOnline: parsedJson['isOnline'],
        email: parsedJson['email'],
        rating: parsedJson['rating'],
        city: parsedJson['city'],
        gender: parsedJson['gender'],
        location: parsedJson['location']
    );
  }

}

class UserList{

  List<userModelItem> userList;

  UserList({required this.userList});

  factory UserList.fromJSON(Map<dynamic, dynamic> json){
    return UserList(
      userList: parseusers(json)
    );
  }

  static List<userModelItem> parseusers(userJSON){
    var uList = parseusers("browseUsers") as List;
    List<userModelItem> userList = uList.map((data) => userModelItem.fromJson(data)).toList();
    return userList;
  }

}

