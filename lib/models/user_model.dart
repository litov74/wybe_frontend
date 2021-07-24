class User{
  final int id;
  final String name;
  final String phone;
  final String status;
  final int friends;
  final int isRemember; //BOOl type is unsupported in SQLite, using int...

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.status,
    required this.friends,
    required this.isRemember,
  });
}

// TAKEN FROM SQLite SAMPLES, NO NEED TO BE USED

//class Dog {
//  final int id;
//  final String name;
//  final int age;
//
//  Dog({
//    required this.id,
//    required this.name,
//    required this.age,
//  });
//}


