import 'package:flutter/material.dart';
import 'package:kalpas_internship/screens/news_screen.dart';
import 'package:kalpas_internship/screens/sign_up.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String email = '';
  String password = '';
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 5.0),
                              child: TextField(
                                onChanged: (inputEmail) {
                                  email = inputEmail;
                                },
                                keyboardType: TextInputType.emailAddress,
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
                                  horizontal: 30.0, vertical: 10.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Colors.blue[700],
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (password == '' || email == '') {
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
                                    return NewsScreen();
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
                                    'Sign In',
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
                                  'Or Sign In With',
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
                                Text('Don\'t have an account?'),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignUp();
                                    }));
                                  },
                                  child: Text(
                                    ' Sign up',
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
