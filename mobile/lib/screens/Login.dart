import 'package:flutter/material.dart';
import 'package:foodie/screens/Signup.dart';
import 'package:foodie/utils/const.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email, password;
  late int phoneNo;

  bool _obscureTextPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 75,
        elevation: 0,
        title: Text(
          "LOGIN",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 25,
            color: solidWhite,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: backgroundColor,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: Center(
            child: formContent(),
          ),
        ),
      ),
    );
  }

  Widget formContent() {
    void login() {
      print(phoneNo);
      print(password);
    }

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // emailTextField(),
            phoneTextField(),
            SizedBox(
              height: 10,
            ),
            passwordTextField(),
            SizedBox(
              height: 30,
            ),
            // Container(
            //   width: 250,
            //   height: 50.0,
            //   decoration: BoxDecoration(
            //     color: primaryColor,
            //     borderRadius: BorderRadius.circular(15),
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.shade300,
            //         spreadRadius: 2,
            //         blurRadius: 2,
            //         offset: Offset(3, 3),
            //       ),
            //     ],
            //   ),
            //   child: TextButton(
            //     onPressed: () {
            //       if (_formKey.currentState!.validate()) {
            //         _formKey.currentState!.save();
            //         login();
            //       }
            //     },
            //     child: Text(
            //       'Sign In',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 16,
            //       ),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // TextButton(
            //   onPressed: () {},
            //   child: Text(
            //     "Forgot password?",
            //     style: TextStyle(
            //         color: Colors.blue,
            //         fontSize: 16,
            //         fontWeight: FontWeight.w600),
            //     textAlign: TextAlign.center,
            //   ),
            // ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => primaryColor),
                elevation: MaterialStateProperty.resolveWith((states) => 5.0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  login();
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.6,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                    color: solidWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "proximanova",
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => SignupScreen(),
                  ),
                );
              },
              child: new RichText(
                text: new TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 12,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                      text: ' Create new account',
                      style: new TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget passwordTextField() {
    return TextFormField(
      onSaved: (value) => password = value!,
      cursorColor: primaryColor,
      textInputAction: TextInputAction.done,
      obscureText: _obscureTextPassword,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _obscureTextPassword ? Icons.visibility_off : Icons.visibility,
            color: _obscureTextPassword ? solidGrey : primaryColor,
          ),
          onPressed: () {
            setState(() => _obscureTextPassword = !_obscureTextPassword);
          },
        ),
        hintText: 'Password',
        prefixIcon: Icon(
          Icons.lock,
          color: primaryColor,
        ),
        hintStyle: TextStyle(color: primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: MultiValidator([
        RequiredValidator(errorText: 'password is required'),
        // MinLengthValidator(8,
        //     errorText: 'password must be at least 8 digits long'),
      ]),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      onSaved: (value) => email = value!,
      cursorColor: primaryColor,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        hintText: 'Email',
        prefixIcon: Icon(
          Icons.email,
          color: primaryColor,
        ),
        hintStyle: TextStyle(color: primaryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: MultiValidator([
        RequiredValidator(errorText: 'Email is required'),
        EmailValidator(errorText: 'Enter a valid email address')
      ]),
    );
  }

  Widget phoneTextField() {
    return TextFormField(
      onSaved: (value) => phoneNo = int.tryParse(value!)!,
      cursorColor: primaryColor,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      maxLength: 10,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        hintText: 'Phone Number',
        prefixIcon: Icon(
          Icons.phone,
          color: primaryColor,
        ),
        hintStyle: TextStyle(color: primaryColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: MultiValidator([
        RequiredValidator(errorText: 'Phone number is required'),
        MinLengthValidator(10, errorText: 'Enter a valid phone number')
      ]),
    );
  }
}
