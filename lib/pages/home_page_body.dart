import 'package:flutter/material.dart';
import 'package:get_post_client/providers/providers.dart';
import 'package:get_post_client/widgets/custom_text_form_field.dart';

// The body of the page
class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  String _res = "Respuesta de la petición"; // response from provider
  String _buttonSelected = "GET";
  String _reqBody = "";
  String _ip = "192.168.31.160:8080";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _drawIPField(),
        SizedBox(height: 15),
        _drawRadioButtons(),
        SizedBox(height: 25),
        Text(
          'Cuerpo',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        _drawBodyField(),
        SizedBox(height: 15),
        ElevatedButton(
          onPressed: _getDatos,
          child: Text('Enviar'),
        ),
        SizedBox(height: 15),
        Text(
          'Respuesta',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        SizedBox(height: 15),
        _drawContainerResponse(),
      ],
    );
  }

  // TextFormField IP
  Widget _drawIPField() {
    return CustomTextFormField(
      onChanged: (String val) {
        setState(() {
          _ip = val;
        });
      },
      icon: Icons.vpn_key_rounded,
      keyboardType: TextInputType.url,
      enabled: false,
      label: 'Dirección IP',
    );
  }

  // TextFormField IP
  Widget _drawBodyField() {
    return CustomTextFormField(
      onChanged: (String val) {
        setState(() {
          _reqBody = val;
        });
      },
      icon: Icons.email,
      enabled: _buttonSelected == 'POST',
      keyboardType: TextInputType.text,
      label: 'Mensaje de la petición',
    );
  }

  // Radio buttons for the request
  Widget _drawRadioButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _drawCustomRadioButton('GET'),
        _drawCustomRadioButton('POST'),
      ],
    );
  }

  // Elevated button as radio
  Widget _drawCustomRadioButton(String label) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _buttonSelected = label;
        });
      },
      child: Text(label),
      style: ElevatedButton.styleFrom(
        primary: _buttonSelected == label ? Colors.blueGrey : Colors.grey,
      ),
    );
  }

  // Response from API
  Widget _drawContainerResponse() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(240, 240, 240, 1),
      ),
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(15),
        child: Text(
          _res,
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
    );
  }
  void _getDatos() async {
    setState(() {
      _res = 'Cargando...';
    });
    if (_buttonSelected == 'GET') {
      String response = await ApiProvider.getDatos(_ip);
      setState(() {
        _res = response;
      });
    }
  }
}
