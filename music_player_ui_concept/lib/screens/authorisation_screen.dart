import 'package:flutter/material.dart';

class Authorisation extends StatefulWidget {
  const Authorisation({Key? key}) : super(key: key);

  @override
  State<Authorisation> createState() => _AuthorisationState();
}

class _AuthorisationState extends State<Authorisation> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("MusicCo Authorisation"),
        ),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 28,
          ),
          TextFormField(
            controller: emailController,
          )
        ],
      ),
    );
  }
}
