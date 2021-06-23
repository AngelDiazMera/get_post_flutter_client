import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<String> getDatos(String ip) async{//Tarea asíncrona
  try{
    //Espera la respuesta, es por ello que usamos await
    String url = "http://${ip}/servidor_flutter/getParametros.php?pedir";
    var respuesta = await http.get(Uri.parse(url));
    //Al final, después de obtenerla, solo vamos a imprimirla
    print(respuesta.body);
    return respuesta.body;
    } catch (error) {
    print(error);
    return null;
  }
}
}