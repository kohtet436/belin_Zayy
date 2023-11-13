import 'package:belin_zayy/app/data/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
 final FirebaseAuth auth=FirebaseAuth.instance;
 final FirebaseServices firebaseServices=FirebaseServices();
Stream<User?> authStateChange()=>auth.authStateChanges(); 
Stream<User?> userStateChange()=>auth.userChanges();  

  
}