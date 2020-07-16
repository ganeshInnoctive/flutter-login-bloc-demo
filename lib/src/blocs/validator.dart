import 'dart:async';

class Validator {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else if (email.isEmpty) {
      sink.addError('Email is mandatory');
    } else {
      sink.addError('Email is invalid');
    }
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 3) {
      sink.add(password);
    } else if (password.isEmpty) {
      sink.addError('Password is mandatory');
    } else {
      sink.addError('Password is invalid');
    }
  });
}
