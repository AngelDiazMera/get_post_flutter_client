import 'package:flutter/material.dart';
import 'package:get_post_client/widgets/custom_text_form_field.dart';

// The page itself
class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: _HomePageBody(),
      ),
    );
  }
}

// The body of the page
class _HomePageBody extends StatefulWidget {
  @override
  __HomePageBodyState createState() => __HomePageBodyState();
}

class __HomePageBodyState extends State<_HomePageBody> {
  String _ip = ""; // ip from TextFormField
  String _res = "Respuesta de la petición"; // response from provider
  String _buttonSelected = "GET";
  String _reqBody = "";

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
}
