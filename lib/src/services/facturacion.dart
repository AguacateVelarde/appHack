
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kompass/src/services/token.dart';

class FacturacionService{
  String token;
   var client = new http.Client();
  String _url =  '68.183.52.222';
  TokenService tokenService = TokenService();


  Future<Map<String, dynamic>> proveedores() async {
    final url = Uri.http( _url, '/api/v1/numProve');
    token =  await tokenService.getToken();
    final data = await client.get(url, headers: {HttpHeaders.authorizationHeader: "Basic $token"});
    return json.decode( data.body );
  }

  Future<Map<String, dynamic>> ventaGasto() async {
    final url = Uri.http( _url, '/api/v1/perfil');
    token =  await tokenService.getToken();
    final data = await client.get(url, headers: {HttpHeaders.authorizationHeader: "Basic $token"});
    return json.decode( data.body );
  }
}