import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  User? user;
  bool isAdmin;
  String? address;
  UserModel( {this.user,this.address,this.isAdmin=false
  });
  UserModel userUpdate({User? user})=>UserModel(user: user,address: address,isAdmin: isAdmin);
  UserModel userInfo(Map<String,dynamic> data){
   return UserModel(address: data['address'],
   isAdmin: data['isAdmin']??false,
   user: user);
  }

  
}