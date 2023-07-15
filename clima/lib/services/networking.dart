import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHealper{

   final String url;

  NetworkingHealper({required this.url});

  Future getdata() async {
    try{
      http.Response responce = await http.get(Uri.parse(url
      ));
      if(responce.statusCode==200){
        String data = responce.body;
        return jsonDecode(data);
      }else{
        print(responce.statusCode);
      }
    }catch(e) {
      print("e");
      print(e);
    }
  }
}