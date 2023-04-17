class Validator {
  int calculate(int a) {
    a = 100;
    return 5 * 5 + a;
  }

  bool validateZipCode(String zipCode) {
    // Check if the ZIP code has a match in the USPS's official address database
    bool matchUSPSdb = true;

    // Check if the ZIP code corresponds accurately with the city or town in the
    bool isCityTownAccurate = true;
    int? zipValue = int.tryParse(zipCode);
    if (zipValue != null &&
        zipCode.length == 6 &&
        isCityTownAccurate &&
        matchUSPSdb) {
      return true;
    } else {
      return false;
    }
  }

  String? validatePassword(String? password) {
    if (password == null) return "please fill in your password";

    RegExp regExp = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    if (regExp.hasMatch(password)) {
      return null;
    } else {
      return "Please fill in the right characters";
    }
  }

  String? validateEmail(String? email) {
    if (email == null) return "Please fill in your email address";
    RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (regExp.hasMatch(email)) {
      return null;
    } else {
      return "Invalide email address";
    }
  }

  bool validateIpv4Address(String ipAddr) {
    if (ipAddr.isEmpty) return false;

    List<String> splitted = ipAddr.split('.');

    if (splitted.length != 4) return false;

    for (var i in splitted) {
      //just wanna check if not a type
      // if (i is int) {
      int? iToInt = int.tryParse(i);

      if (iToInt != null && iToInt >= 0 && iToInt <= 255) {
        continue;
      } else {
        return false;
      }
    }

    return true;
  }

  bool validateIpv6Address(String ipAddr) {
    bool isHexDigit(String char) {
      return '0123456789ABCDEFabcdef'.contains(char);
    }

    if (ipAddr.isEmpty) return false;

    List<String> parts = ipAddr.split(':');

    if (parts.length != 8) return false;

    for (String i in parts) {
      if (i.isEmpty || i.length > 4) return false;

      for (var j = 0; j < i.length; j++) {
        String char = i[j];
        if (!isHexDigit(char)) {
          return false;
        }
      }
    }

    return true;
  }

  // Longest prifix

  String longestCommonPrefix(List<String> strs) {
    String ag = "";
    bool bas = ag.isEmpty;

    if (strs.isEmpty) return "";
    if (strs.length < 2) return strs.first;
    bool isOfSameIndex = true;
    Set<String> commonChars = strs.first.split('').toSet();
    for (var i = 0; i < strs.length; i++) {
      String currentString = strs[i];
      commonChars = commonChars.intersection(currentString.split('').toSet());
      // check correct index.
      var listCommonChars = commonChars.toList();
      for (var j = 0; j < commonChars.length; j++) {
        if (listCommonChars[j] == currentString[j]) {
          continue;
        } else {
          commonChars.remove(listCommonChars[j]);
          // isOfSameIndex = false;
        }
      }
    }

    String diff = '';
    for (var i in commonChars) {
      diff += i;
    }

    return diff;
  }
}

