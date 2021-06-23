import 'package:http/http.dart' as http;

Future<String> getDatos() async{//Tarea asíncrona
  try{
    //Espera la respuesta, es por ello que usamos await
    String url = "http://http://192.168.31.160:8080/servicioMovil/conParametros.php?pedir";
    var respuesta = await http.get(Uri.parse(url));
    //Al final, después de obtenerla, solo vamos a imprimirla
    print(respuesta.body);
    } catch (error) {
    print(error);
  }
}
