import 'package:e_derma/screens/select_option_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_derma/global/global_user.dart';
import 'package:e_derma/models/user_model.dart';
import 'package:e_derma/services/auth_service.dart';
import 'package:e_derma/services/validation_service.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //controls the name text field
  final TextEditingController email = TextEditingController();

  //controls the email text field
  final TextEditingController fullName = TextEditingController();

  //controls the phone number text field
  final TextEditingController phoneNum = TextEditingController();

  //controls the password text field
  final TextEditingController password = TextEditingController();

  //controls the confirm password text field
  final TextEditingController rePassword = TextEditingController();

  //instance of the authentication class
  final AuthService auth = AuthService();

  final ValidationService validationService = ValidationService();

  bool loading = false;
  bool hideText = true;
  bool hideText2 = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (_, __) => SafeArea(
        child: GestureDetector(
          //auto dismissing the keyboard
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                height: height,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectOptionScreen()));
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Sign up',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0F00FF)),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Already have an account?',
                          style:
                              TextStyle(color: Color(0xff737373), fontSize: 14),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogInScreen()));
                          },
                          child: const Text(
                            ' Log in',
                            style: TextStyle(
                                color: Color(0xff0F00FF),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    //name text field
                    buildTextField(hint: 'Full name', controller: fullName),
                    SizedBox(
                      height: 14.5.h,
                    ),
                    // email field
                    buildTextField(hint: 'Email', controller: email),
                    SizedBox(
                      height: 14.5.h,
                    ),
                    // phone number field
                    buildTextField(hint: 'Phone number', controller: phoneNum),
                    SizedBox(
                      height: 14.5.h,
                    ),
                    //password text field
                    buildTextField(hint: 'Password', controller: password),
                    SizedBox(
                      height: 14.5.h,
                    ),
                    //re password text field
                    buildTextField(
                        hint: 'Re-type password', controller: rePassword),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                      'By signing up to E-Derma you agree to our',
                      style: TextStyle(fontSize: 11, color: Color(0xff737373)),
                    ),
                    const Text(
                      'terms & conditions',
                      style: TextStyle(color: Color(0xff0F00FF), fontSize: 11),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //sign up button
                    InkWell(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        //sending the register request to the backend
                        Map result = validationService.registrationValidation(
                          name: fullName.text,
                          email: email.text,
                          phoneNumber: phoneNum.text,
                          password: password.text,
                          rePassword: rePassword.text,
                        );
                        //if the request is a success then creating the global user
                        if (result['valid']) {
                          var response = await auth.register(
                              email: email.text,
                              password: password.text,
                              name: fullName.text,
                              phoneNumber: phoneNum.text,
                              dateOfBirth: "dateOfBirth.text");
                          if (response["success"] == true) {
                            GlobalUser.currentUser = User(
                                name: fullName.text,
                                email: email.text,
                                phoneNum: phoneNum.text,
                                dateOfBirth: "dateOfBirth.text");
                            setState(() {
                              loading = false;
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SelectOptionScreen()));
                          } else {
                            setState(() {
                              loading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(response['msg'])));
                          }
                        } else {
                          setState(() {
                            loading = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(result['msg'])));
                        }
                      },
                      child: Card(
                        margin: const EdgeInsets.all(0),
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r)),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                            vertical: 11.h,
                          ),
                          // width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff0F00FF),
                              borderRadius: BorderRadius.circular(6.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sign up',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 14.sp),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Visibility(
                                visible: loading,
                                child: const SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //google sign up button
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInScreen()));
                      },
                      child: Card(
                        margin: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.r)),
                        elevation: 7,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          decoration: BoxDecoration(
                              // border: Border.all(
                              //     color: const Color(0xff0F00FF), width: 1),
                              color: const Color(0xff0F00FF).withOpacity(0.05),
                              borderRadius: BorderRadius.circular(6.r)),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Color(0xff0F00FF),
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //building a text field
  Widget buildTextField(
      {required String hint, required TextEditingController controller}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.20),
          borderRadius: BorderRadius.circular(6.r)),
      padding: EdgeInsets.only(left: 20.w),
      margin: EdgeInsets.symmetric(horizontal: 0.w),
      child: TextField(
        obscureText: hint == "Password"
            ? hideText
            : hint == "Re-type password"
                ? hideText2
                : false,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            border: InputBorder.none,
            suffixIcon: Visibility(
              visible: hint == "Password" || hint == "Re-type password"
                  ? true
                  : false,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      if (hint == "Password") {
                        hideText = !hideText;
                      } else if (hint == "Re-type password") {
                        hideText2 = !hideText2;
                      }
                    });
                  },
                  child: hint == "Password"
                      ? Icon(hideText ? Icons.visibility_off : Icons.visibility)
                      : Icon(
                          hideText2 ? Icons.visibility_off : Icons.visibility)),
            ),
            hintText: hint,
            hintStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xff737373),
                fontWeight: FontWeight.normal)),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    fullName.dispose();
    email.dispose();
    phoneNum.dispose();
    password.dispose();
    rePassword.dispose();
  }
}
