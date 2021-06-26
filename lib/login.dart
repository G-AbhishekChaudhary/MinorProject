import 'package:flutter/material.dart';
import 'package:task4/register.dart';
import 'home.dart';
import 'InputDeco_design.dart';
import 'sharedPref.dart';
import 'user.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String email;
  String password;
  bool _isObscure = false;
  User userLoad = User();
  SharedPref sharedPref = SharedPref();

  loadSharePrefs() async {
    try {
      User user = User.fromJson(await sharedPref.read("user"));
      setState(() {
        userLoad = user;
      });
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    child: Image.asset("images/login.png"),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: buildInputDecoration(Icons.email, "Email"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please Enter your Email';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please enter a valid Email';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 15, left: 10, right: 10),
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Password",
                        suffixIcon: Icon(
                            !_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.white),
                        prefixIcon: Icon(Icons.lock, color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.5),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please Enter your Password';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 600,
                    height: 50,
                    child: ElevatedButton(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white))),
                      ),
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          loadSharePrefs();
                          if ((userLoad.email ?? "") == email &&
                              (userLoad.password ?? "") == password) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: new Text("Login Successfully"),
                                duration: const Duration(milliseconds: 500)));
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Home();
                            }));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: new Text(
                                  "Invalid Email & Passoword Please Register"),
                              duration: const Duration(milliseconds: 50)));
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Register();
                          }));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
