import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kalpas_internship/screens/sign_in.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = '';
  String password = '';
  String confPass = '';

  Future<void> signUpOperation() async {
    var url =
        Uri.parse('https://www.postman.com/collections/299632c9a18ed457ba78');

    var response = await http.post(url, headers: {
      'email': 'test@test.com',
      'password': 'qwer1234',
      'passwordConf': 'qwer1234'
    });

    //var response2  = await http.post(Uri.parse('${json.decode(response.body)['item'][0]['request'])}'));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/blur.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(45.0),
                  child: Text(
                    'Welcome!!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.55,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: Scrollbar(
                    isAlwaysShown: true,
                    showTrackOnHover: true,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 5.0),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (inputEmail) {
                                  email = inputEmail;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.brown[900], width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal: 20,
                                  ),
                                  fillColor: Colors.brown[200],
                                  filled: true,
                                  hintText: 'Email:',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 5.0),
                              child: TextField(
                                onChanged: (inputPassword) {
                                  password = inputPassword;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.brown[900], width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal: 20,
                                  ),
                                  fillColor: Colors.brown[200],
                                  filled: true,
                                  hintText: 'Password:',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 5.0),
                              child: TextField(
                                onChanged: (inputConfirmPassword) {
                                  confPass = inputConfirmPassword;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.brown[900], width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 15.0,
                                    horizontal: 20,
                                  ),
                                  fillColor: Colors.brown[200],
                                  filled: true,
                                  hintText: 'Re-enter Password',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (password != confPass) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Error occurred'),
                                          content: Text(
                                              'The passwords don\'t match!!'),
                                          actions: [
                                            RaisedButton(
                                              child: Text('OK'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                } else if (password == '' ||
                                    confPass == '' ||
                                    email == '') {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Error occurred'),
                                          content: Text('Fields are empty!!'),
                                          actions: [
                                            RaisedButton(
                                              child: Text('OK'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                } else {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return SignIn();
                                  }));
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue[400],
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 40,
                                  ),
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 70,
                                  height: 2,
                                  color: Colors.black26,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Or Sign Up With',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 70,
                                  height: 2,
                                  color: Colors.black26,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/google1.png'),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Image(
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/facebook.png'),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Have an account?'),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignIn();
                                    }));
                                  },
                                  child: Text(
                                    ' Sign in',
                                    style: TextStyle(
                                      color: Colors.orange[700],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
