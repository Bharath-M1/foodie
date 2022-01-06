import 'package:flutter/material.dart';
import 'package:foodie/utils/const.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController regNo = TextEditingController();
  TextEditingController dept = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  bool _obscurePassword = true, _obscureConfirmPassword = true;
  bool focus = false;
  String _gender = "Male";
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 75,
        elevation: 0,
        title: Text(
          "REGISTER",
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
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: formContent(),
        ),
      ),
    );
  }

  Widget formContent() {
    void signup() async {
      // BlocProvider.of<SignupBloc>(context).add(
      //   SignupButtonPressed(
      //     firstName: firstName.text,
      //     lastName: lastName.text,
      //     dateofbirth: dob.text,
      //     userName: username.text,
      //     email: email.text,
      //     password: password.text,
      //   ),
      // );
    }

    return Form(
        key: _formKey,
        child: Column(
          children: [
            // GestureDetector(
            //   onTap: () {
            //     selectImage();
            //   },
            //   child: Container(
            //     height: 100,
            //     width: 100,
            //     margin: EdgeInsets.all(20),
            //     child: ClipRRect(
            //         borderRadius: BorderRadius.circular(100),
            //         // ignore: unnecessary_null_comparison
            //         child: imageFile != null
            //             ? Image.file(
            //                 imageFile,
            //                 fit: BoxFit.cover,
            //               )
            //             : CircleAvatar(
            //                 child: Icon(
            //                   Icons.person,
            //                   color: primaryColor,
            //                 ),
            //                 backgroundColor: primaryColor[100],
            //               )),
            //   ),
            // ),
            // Text("Profile Picture", style: TextStyle(fontSize: 16)),
            // SizedBox(
            //   height: 5,
            // ),
            // Text("( Optional )",
            //     style: TextStyle(fontSize: 14, color: Colors.grey)),
            // SizedBox(
            //   height: 30,
            // ),
            usernameTF(),
            regNoTF(),
            deptTF(),
            emailTF(),
            dateofbirth(),
            genderTF(),
            addressTF(),
            passwordTF(),
            confirmPasswordTF(),
            SizedBox(
              height: 30,
            ),
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
                  signup();
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.6,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                child: Text(
                  "SIGNUP",
                  style: TextStyle(
                    color: solidWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "proximanova",
                  ),
                ),
              ),
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

            //         if (password.text == confirmpassword.text) {
            //           signup();
            //         } else {}
            //       }
            //     },
            //     child: Text(
            //       'Sign Up',
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 16,
            //       ),
            //       textAlign: TextAlign.center,
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account?',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 16,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                      text: ' Login here',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Center(
          child: Theme(
            child: child as Widget,
            data: ThemeData.light().copyWith(
              primaryColor: primaryColor,
              accentColor: primaryColor,
              colorScheme: ColorScheme.light(
                primary: primaryColor,
              ),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
          ),
        );
      },
    ) as DateTime;
    if (picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dob.text = DateFormat("yyyy-MM-dd").format(selectedDate);
      });
  }

  Widget dateofbirth() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        onTap: () {
          _selectDate(context);
        },
        controller: dob,
        cursorColor: primaryColor,
        textInputAction: TextInputAction.next,
        readOnly: true,
        decoration: InputDecoration(
          labelText: "Date of Birth",
          labelStyle: TextStyle(color: primaryColor),
          hintText: 'Date of Birth',
          prefixIcon: Icon(
            Icons.star,
            color: primaryColor,
            size: 10,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.date_range_outlined,
              color: primaryColor,
            ),
          ),
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: primaryColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: primaryColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: RequiredValidator(errorText: "Date of birth is Required"),
      ),
    );
  }

  Widget usernameTF() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          controller: username,
          cursorColor: primaryColor,
          // onSaved: (value) => username = value,
          decoration: InputDecoration(
            labelText: "Username",
            labelStyle: TextStyle(color: primaryColor),
            hintText: 'Username',
            prefixIcon: Icon(
              Icons.star,
              color: primaryColor,
              size: 10,
            ),
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: primaryColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: primaryColor, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: MultiValidator([
            RequiredValidator(errorText: "Username is Required"),
            // PatternValidator(r"(?:[^a-z][a-z])",
            //     errorText: 'Username must be in lower case without white space')
          ])),
    );
  }

  Widget regNoTF() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          controller: regNo,
          cursorColor: primaryColor,
          // onSaved: (value) => username = value,
          decoration: InputDecoration(
            labelText: "Register No/Admission Id",
            labelStyle: TextStyle(color: primaryColor),
            hintText: 'Register No/Admission Id',
            prefixIcon: Icon(
              Icons.star,
              color: primaryColor,
              size: 10,
            ),
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: primaryColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: primaryColor, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: MultiValidator([
            RequiredValidator(errorText: "Register Number is Required"),
            // PatternValidator(r"(?:[^a-z][a-z])",
            //     errorText: 'Username must be in lower case without white space')
          ])),
    );
  }

  Widget deptTF() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          controller: dept,
          cursorColor: primaryColor,
          // onSaved: (value) => username = value,
          decoration: InputDecoration(
            labelText: "Department Name",
            labelStyle: TextStyle(color: primaryColor),
            hintText: 'Department Name',
            prefixIcon: Icon(
              Icons.star,
              color: primaryColor,
              size: 10,
            ),
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: primaryColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: primaryColor, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: MultiValidator([
            RequiredValidator(errorText: "Department name is Required"),
            // PatternValidator(r"(?:[^a-z][a-z])",
            //     errorText: 'Username must be in lower case without white space')
          ])),
    );
  }

  Widget addressTF() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
          textInputAction: TextInputAction.next,
          maxLines: 4,
          maxLength: 200,
          keyboardType: TextInputType.name,
          controller: address,
          cursorColor: primaryColor,
          // onSaved: (value) => username = value,
          decoration: InputDecoration(
            labelText: "Address",
            labelStyle: TextStyle(color: primaryColor),
            hintText: 'Address',
            prefixIcon: Icon(
              Icons.star,
              color: primaryColor,
              size: 10,
            ),
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: primaryColor, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              borderSide: BorderSide(color: primaryColor, width: 1.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: primaryColor),
            ),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: MultiValidator([
            RequiredValidator(errorText: "Address is Required"),
            // PatternValidator(r"(?:[^a-z][a-z])",
            //     errorText: 'Username must be in lower case without white space')
          ])),
    );
  }

  Widget genderTF() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        onTap: () {},
        autovalidateMode: AutovalidateMode.onUserInteraction,
        value: _gender,
        decoration: InputDecoration(
          labelText: "Gender",
          labelStyle: TextStyle(color: primaryColor),
          hintText: 'Gender',
          prefixIcon: Icon(
            Icons.star,
            color: primaryColor,
            size: 10,
          ),
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: primaryColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: primaryColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
        onChanged: (value) {
          setState(() {
            _gender = value!;
          });
        },
        icon: Icon(
          Icons.arrow_drop_down,
          color: solidGrey,
        ),
        items: <String>["Male", "Female", "Other"].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: new Text(
              value,
              style: TextStyle(
                color: primaryColor,
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget emailTF() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        //onSaved: (value) => email = value,
        controller: email,
        cursorColor: primaryColor,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(color: primaryColor),
          hintText: 'Email',
          prefixIcon: Icon(
            Icons.star,
            color: primaryColor,
            size: 10,
          ),
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: primaryColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: primaryColor, width: 1.5),
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
      ),
    );
  }

  Widget passwordTF() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: password,
        // onSaved: (value) => password = value,
        cursorColor: primaryColor,
        textInputAction: TextInputAction.done,
        obscureText: _obscurePassword,
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: TextStyle(color: primaryColor),
          suffixIcon: IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: _obscurePassword ? Colors.grey : primaryColor,
            ),
            onPressed: () {
              if (!mounted) return;
              setState(() => _obscurePassword = !_obscurePassword);
            },
          ),
          hintText: 'Password',
          prefixIcon: Icon(
            Icons.star,
            color: primaryColor,
            size: 10,
          ),
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: primaryColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: primaryColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: MultiValidator([
          RequiredValidator(errorText: 'Password is required'),
          MinLengthValidator(8,
              errorText: 'Password must be at least 8 digits long'),
          PatternValidator(r'(?=.*?[#?!@$%^&*-])',
              errorText: 'Passwords must have at least one special character')
        ]),
      ),
    );
  }

  Widget confirmPasswordTF() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: confirmpassword,
        // onSaved: (value) => confirmpassword = value,
        cursorColor: primaryColor,
        textInputAction: TextInputAction.done,
        obscureText: _obscureConfirmPassword,
        decoration: InputDecoration(
          labelText: "Confirm Password",
          labelStyle: TextStyle(color: primaryColor),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
              color: _obscureConfirmPassword ? Colors.grey : primaryColor,
            ),
            onPressed: () {
              if (!mounted) return;
              setState(
                  () => _obscureConfirmPassword = !_obscureConfirmPassword);
            },
          ),
          hintText: 'Confirm Password',
          prefixIcon: Icon(
            Icons.star,
            color: primaryColor,
            size: 10,
          ),
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: primaryColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: primaryColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (val) =>
            MatchValidator(errorText: 'Please ensure passwords match')
                .validateMatch(val!, password.text),
      ),
    );
  }
}
