import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PeticionesUsuarios {
  // static final PeticionesUsuarios _peticionesUsuarios =
  //     PeticionesUsuarios._internal();

  // factory PeticionesUsuarios() {
  //   return _peticionesUsuarios;
  // }

  // PeticionesUsuarios._internal();

  Future<dynamic> autenticarUsuario(String usuario, String contrasenha) async {
    var uri = Uri.parse(
        "https://apimovil.onrender.com/api/usuarioSesion/userOne/$usuario/$contrasenha");
    final response = await http.get(
      uri,
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }
}
