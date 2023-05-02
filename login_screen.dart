import 'dart:js';

import 'package:flutter/material.dart';

import 'bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25.0),
      child: Column(children: [
        emailField(),
        passwordField(),
        const SizedBox(
          height: 30,
        ),
        submitButton(),
      ]),
    );
  }

  Widget emailField() {
    return StreamBuilder( stream : block.email, builder: (context, snapshot) {
      return TextField(
        onChanged: (value) {
          block.changeEmail(value);
        },
        decoration: InputDecoration(
          labelText: 'Email Address',
          hintText: 'you@gmail.com',
          errorText: snapshot.error as String,
        ),
      );
    });
  }

  Widget passwordField() {
    return StreamBuilder(stream : block.password, builder: (context, snap) {
       return TextField(
        onChanged: block.changePassword,
      obscureText: true,
      decoration: InputDecoration(
        errorText: snap.error as String,
        labelText: 'Password',
        hintText: 'Must be more than 4 letters',
      ),
    );
    });
   
  }

  Widget submitButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.blue,
      child: const Text('Submit'),
    );
  }
}
