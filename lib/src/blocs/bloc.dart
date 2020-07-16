import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);

  submitData() {
    final email = _emailController.value;
    final password = _passwordController.value;

    print('Email : $email and Password : $password');
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
