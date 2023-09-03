
class ValidationService{

  //validating login info
  Map<String, dynamic> loginValidation({required String email, required String password}){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    bool passwordValid = password !='';

    String msg = !passwordValid? "Password cannot be empty.": '';
    msg = !emailValid? "Invalid email, please try again." : msg;

    return{
      'valid' : emailValid && passwordValid,
      'msg' : msg
    };
  }

  //validating registration info
  Map<String, dynamic> registrationValidation(
      { required String name,
        required String email,
        required String phoneNumber,
        required String password,
        required String rePassword
      }){

    String msg  = '';

    bool infoValid = false;


    //validation phone number
    validateMobile(String phoneNum) {
      RegExp regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
      if (phoneNum.isEmpty) {
        msg =  'Mobile number cannot be empty.';
        infoValid = false;
      }
      else if (!regExp.hasMatch(phoneNum)) {
        infoValid = false;
        msg =  'Please enter valid mobile number';
      }
      else{
        infoValid = true;
      }
    }


    //validating password
    passwordValidation(){
      if(password !='' && name !=''){
        if(rePassword == password){
          infoValid = true;
          validateMobile(phoneNumber);
        }
        else{
          infoValid = false;
          msg = "Passwords doesn't match.";
        }
      }
      else{
        infoValid = false;
        msg = "Please fill all fields";
      }
    }

    if(email!=''){
      //validating email & name
      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
      if(!emailValid){
        infoValid = false;
        msg = "Invalid email, please try again.";
      }
      else{
        infoValid = true;
        passwordValidation();
      }
    }
    else{
      msg = "Please fill all fields.";
      passwordValidation();
    }

    return{
      'valid' : infoValid,
      'msg' : msg
    };
  }

}