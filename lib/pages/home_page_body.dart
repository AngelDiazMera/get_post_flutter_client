import 'package:flutter/material.dart';
import 'package:get_post_client/providers/providers.dart';

import 'package:get_post_client/widgets/custom_text_form_field.dart';

// The body of the page
class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  String _ip = "192.168.0.103"; // ip from TextFormField
  String _res = "Respuesta de la petición"; // response from provider
  String _buttonSelected = "GET";
  String _reqBody = "";
  // Input controllers
  TextEditingController _bodyTxt = TextEditingController(text: '');
  TextEditingController _ipTxt = TextEditingController(text: '192.168.0.103');

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
          onPressed: _pedirDatos,
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
      enabled: false,
      controller: _ipTxt,
      icon: Icons.vpn_key_rounded,
      keyboardType: TextInputType.number,
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
      controller: _bodyTxt,
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
          _reqBody = '';
          _bodyTxt.text = '';
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

  void _pedirDatos() async {
    setState(() {
      _res = 'Cargando...';
    });
    if (_buttonSelected == 'POST') {
      String response = await ApiProvider.post(_ip, _reqBody);
      setState(() {
        _res = response;
      });
    }
  }
}
