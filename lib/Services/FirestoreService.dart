
import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService{
  static final FirestoreService _firestoreService =
      FirestoreService._internal();

   Firestore _db = Firestore.instance;

   FirestoreService._internal();

   factory FirestoreService(){
     return _firestoreService;
   }




}