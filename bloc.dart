import 'dart:async';

import 'package:login_screen/src/validate.dart';

class Bloc extends Validator {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  dynamic Function(String) get changeEmail => _emailController.sink.add;
  dynamic Function(String) get changePassword => _passwordController.sink.add;
}

final block = Bloc();
