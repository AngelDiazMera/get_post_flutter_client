import 'package:flutter/material.dart';
import 'package:get_post_client/widgets/custom_text_form_field.dart';

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

class _HomePageBody extends StatefulWidget {
  @override
  __HomePageBodyState createState() => __HomePageBodyState();
}

class __HomePageBodyState extends State<_HomePageBody> {
  String _ip = "";
  String _res = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _drawIPField(),
        SizedBox(height: 15),
        _drawButtons(),
        SizedBox(height: 25),
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

  Widget _drawButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('GET'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('POST'),
        )
      ],
    );
  }

  Widget _drawContainerResponse() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(240, 240, 240, 1),
      ),
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(15),
        child: Text(_res),
      ),
    );
  }
}
