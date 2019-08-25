
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:kompass/src/services/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilService{
  String token;
   var client = new http.Client();
  String _url =  '68.183.52.222';
  TokenService tokenService = TokenService();

  Future resumen() async {
    final url = Uri.http( _url, '/api/v1/login'); 
    token =  await tokenService.getToken();
    final data = await client.post(url, headers: {HttpHeaders.authorizationHeader: "Basic $token"});
    return data.body;

  }

  Future<Map<String, dynamic>> gastos() async {
    final url = Uri.http( _url, '/api/v1/getGanancias');
    token =  await tokenService.getToken();
    final data = await client.get(url, headers: {HttpHeaders.authorizationHeader: "Basic $token"});
    return json.decode( data.body );
  }

    Future<Map<String, dynamic>> finanzas() async {
    final url = Uri.http( _url, '/api/v1/perfil');
    token =  await tokenService.getToken();
    final data = await client.get(url, headers: {HttpHeaders.authorizationHeader: "Basic $token"});
    return json.decode( data.body );
  }

  logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
   Navigator.of(context).pushNamedAndRemoveUntil('login', (Route<dynamic> route) => false);
  }
}