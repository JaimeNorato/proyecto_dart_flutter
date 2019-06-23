import 'package:http/http.dart'show Client;
import 'package:proycto_dart_flutter/src/models/photos.dart';

class API{
  static const bassUrl='https://jsonplaceholder.typicode.com/photos';
  final Client _client=Client();

  Future<List<Photos>> getPhotos() async{
    List<Photos> photosList;

    final response=await _client.get(bassUrl);
    photosList= photosFromJson(response.body);

    return photosList;
  }
}