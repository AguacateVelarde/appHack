import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginSevice{
  String _url = '68.183.52.222';
  var client = new http.Client();
  Map<String, String> headers = {
  'Content-type' : 'application/json', 
  'Accept': 'application/json',
};

  Future login( String user, String password ) async {
    final url = Uri.http( _url, '/api/v1/login');
    var body = json.encode({
      'user' : user,
      'password' : password,
    });
    final res = await client.post(  url, body : body, headers: headers);
    final decodeData = await json.decode( res.body );
    return decodeData;

  }
}