

class Validations {

//validators
  bool isValidEmail(String email){
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool isPassword(String password){
    return RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$')
        .hasMatch(password);
  }

  bool isName(String name){
    return RegExp(
        r"^.{3,}$")
        .hasMatch(name);
  }

  bool isPhoneNumber(String phone){
    return RegExp(
        r"^[0-9]{10}$")
        .hasMatch(phone);
  }

  bool isDob(String dob){
    return RegExp(
        r"^.{3,}$")
        .hasMatch(dob);
  }

  bool isJobQty(String isJobQty){
    return RegExp(r'^(0|[1-9][0-9]*)$')
        .hasMatch(isJobQty);
  }

  bool isPrice(String isPrice){
    return  RegExp(r'^[1-9][\.\d]*(,\d+)?$')
        .hasMatch(isPrice);
  }

  bool isNumber(String isPrice){
    return  RegExp(r'^[0-9][\.\d]*(,\d+)?$')
        .hasMatch(isPrice);
  }

  bool isEqual(String inputOne,String inputTwo){

    if (inputOne == inputTwo) {
      return true;
    }
    return false;
  }
}