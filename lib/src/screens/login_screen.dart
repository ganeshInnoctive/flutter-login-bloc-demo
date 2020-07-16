import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(50.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          labelField(),
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget labelField() {
    return Text(
      'Login',
      style: TextStyle(
        fontSize: 25.0,
        color: Colors.blue,
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email Id',
            hintText: 'abc@example.com',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'abcd',
              errorText: snapshot.error,
            ),
            onChanged: bloc.changePassword,
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Submit'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? bloc.submitData : null,
        );
      },
    );
  }
}
