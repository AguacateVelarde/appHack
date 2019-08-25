import 'dart:_http';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:kompass/src/services.dart/token.dart';

class PerfilService{
  String token;
   var client = new http.Client();
  String _url =  '68.183.52.222';
  TokenService tokenService = TokenService();

  Future perfil() async {
    final url = Uri.http( _url, '/api/v1/login'); 
    token =  await tokenService.getToken();
    final data = await client.post(url, headers: {HttpHeaders.authorizationHeader: "Basic $token"});
    return data.body;

  }
}