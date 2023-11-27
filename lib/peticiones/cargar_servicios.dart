import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class PeticionesServicios {
  Future<bool> setServicios(contenido) async {
    var uri = Uri.parse("https://apimovil.onrender.com/api/servicios");
    final response = await http.post(uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(contenido));

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<dynamic> getServicios() async {
    var uri = Uri.parse("https://apimovil.onrender.com/api/servicios");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }

  Future<dynamic> updateServicios(String id, dynamic datos) async {
    var uri = Uri.parse("https://apimovil.onrender.com/api/servicios/$id");
    final response = await http.put(uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(datos));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  Future<dynamic> deleteServicio(String id) async {
    var uri = Uri.parse("https://apimovil.onrender.com/api/servicios/$id");
    final response = await http.delete(uri);

    if (response.statusCode == 200) {
      return {"men": "el servicio con el id $id fue eliminado"};
    }
  }
}
