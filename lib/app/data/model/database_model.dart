class DatabaseModel{
  String collection;
  String? doc;
  Map<String,dynamic>? data;
  bool isUpdate;
  DatabaseModel({required this.collection,this.data,this.doc,this.isUpdate=false});
}