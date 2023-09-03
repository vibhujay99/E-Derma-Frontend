import 'package:e_derma/screens/select_option_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_derma/screens/forgot_password_screen.dart';
import 'package:e_derma/screens/register_screen.dart';
import 'package:e_derma/services/auth_service.dart';
import 'package:e_derma/services/validation_service.dart';
import '../global/global_user.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  //controls the email text field
  TextEditingController email = TextEditingController();
  //controls the name text field
  TextEditingController password = TextEditingController();

  AuthService auth = AuthService();
  ValidationService validationService = ValidationService();

  bool loading = false;
  bool hideText = true;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392.72727272727275, 750.909090909091),
      builder: (_,__) => GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
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
                                  builder: (context) => const SelectOptionScreen()));
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                              color: Color(0xff0F00FF),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    //logo section
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        'E-Derma',
                        style: TextStyle(
                            fontSize: 55.00, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 50.w,
                        child: Image.asset(
                          'images/leaficon.png',
                          fit: BoxFit.fill,
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 70.h,
                    ),
                    const Text(
                      'Hi there!',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0F00FF),
                      ),
                    ),
                    const Text(
                      'Welcome back, please login to continue.',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //email text field
                    buildTextField(
                        hint: 'Email',
                        controller: email,
                        icon: const Icon(Icons.person_outline)),
                    SizedBox(
                      height: 20.h,
                    ),
                    //password text field
                    buildTextField(
                        hint: 'Password',
                        controller: password,
                        icon: const Icon(Icons.lock_outline)),
                    SizedBox(
                      height: 5.h,
                    ),
                    //forgot password button
                    Container(
                      alignment: Alignment.centerRight,
                      color: Colors.white,
                      child: InkWell(
                          onTap: () {
                            if(email.text.isNotEmpty){
                              GlobalUser.currentUser.email = email.text;
                              AuthService().sendPasswordResetRequest(GlobalUser.currentUser.email);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordScreen()));
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Please fill the email field!")));
                            }
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                                color: Color(0xff0F00FF),
                                fontSize: 14),
                          )),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    //login button
                    InkWell(
                      onTap: () async {
                        setState(() {
                          loading = true;
                        });
                        var validation = validationService.loginValidation(
                            email: email.text, password: password.text);

                        if (validation['valid']) {
                          var response = await auth.login(
                              email: email.text, password: password.text);
                          if (response["success"] == true) {
                            GlobalUser.authToken = response['token'];
                            await auth.getInfo();

                            setState(() {
                              loading = false;
                            });

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SelectOptionScreen()));
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
                          String msg = validation['msg'];
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(msg)));
                        }
                      },
                      child: Card(
                        margin: const EdgeInsets.all(0),
                        elevation: 7,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: const Color(0xff0F00FF)),
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          margin: EdgeInsets.symmetric(horizontal: 0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 15),
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
                      height: 12.h,
                    ),
                    //google login button
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen()));
                            },
                            child: Card(
                              margin: const EdgeInsets.all(0),
                              borderOnForeground: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r)),
                              elevation: 7,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                margin: EdgeInsets.symmetric(horizontal: 0.w),
                                // width: double.infinity,
                                decoration: BoxDecoration(
                                    // border: Border.all(
                                    //     color: const Color(0xff0F00FF), width: 1),
                                    color: const Color(0xff0F00FF)
                                        .withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Color(0xff0F00FF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),

                          //skip button
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            'By logging in to E-Derma you agree to our',
                            style: TextStyle(
                                fontSize: 11,
                                color: Color(0xff737373)),
                          ),
                          const Text(
                            'terms & conditions',
                            style: TextStyle(
                                color: Color(0xff0F00FF),
                                fontSize: 11),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      ),
                    )
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
      {required String hint,
      required TextEditingController controller,
      required Icon icon}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.20),
          borderRadius: BorderRadius.circular(6.r)),
      padding: EdgeInsets.only(left: 20.w),
      margin: EdgeInsets.symmetric(horizontal: 0.w),
      child: TextField(
        obscureText: hint == "Password" ? hideText : false,
        cursorColor: const Color(0xff0F00FF),
        controller: controller,
        decoration: InputDecoration(
            icon: icon,
            suffixIcon: Visibility(
              visible: hint == "Password" ? true : false,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      hideText = !hideText;
                    });
                  },
                  child:
                      Icon(hideText ? Icons.visibility_off : Icons.visibility)),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12.h),
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff737373),
                fontWeight: FontWeight.normal)),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }
}
