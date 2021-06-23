import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<String> post(String ip, String body) async {
    try {
      String url = "http://${ip}/servidor_flutter/post.php?pedir";
      //Espera la respuesta, es por ello que usamos await
      var respuesta = await http.post(Uri.parse(url), body: {"pedir": body});
      //Al final, después de obtenerla, solo vamos a imprimirla
      print('RESPUESTA API: ${respuesta.body}');
      return respuesta.body;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // TODO: implementar static future get
}
