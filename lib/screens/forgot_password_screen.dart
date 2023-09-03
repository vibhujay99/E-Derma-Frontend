import 'package:flutter/material.dart';
import 'package:e_derma/global/global_user.dart';

import '../services/auth_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  // final  email;
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  TextEditingController otp = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController rePassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: (){
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: Center(
                child: Column(children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100,),
                      const Text(
                        'Reset password',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'We have sent you an one time code to your email. Please enter it and your new password below to change the password.',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      buildTextField(
                          hint: 'One Time Code', controller: otp),
                      const SizedBox(
                        height: 15,
                      ),
                      buildTextField(hint: 'New Password', controller: newPassword),
                      const SizedBox(
                        height: 15,
                      ),
                      buildTextField(
                          hint: 'Confirm Password', controller: rePassword),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: ()async{
                          var response = await AuthService().updatePassword(GlobalUser.currentUser.email, otp.text, newPassword.text);
                          ScaffoldMessenger.of(context).showSnackBar(
                               SnackBar(content: Row(
                                 children: [
                                   Text(response),
                                   const Spacer(),
                                   const SizedBox(
                                       height: 10,
                                       width: 10,
                                       child: CircularProgressIndicator())
                                 ],
                               )));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding:
                          const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                          decoration: BoxDecoration(
                              color: const Color(0xff0F00FF),
                              borderRadius: BorderRadius.circular(25)),
                          child: const Text(
                            'Change Password',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  // Positioned(
                  //     top: 20, left: 0,
                  //     child: GestureDetector(
                  //         onTap: (){
                  //           Navigator.of(context).pop();
                  //         },
                  //         child: const Icon(Icons.arrow_back_rounded)))
                ]),
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
          borderRadius: BorderRadius.circular(6)),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: InputBorder.none,
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
    otp.dispose();
    newPassword.dispose();
    rePassword.dispose();
  }
}
