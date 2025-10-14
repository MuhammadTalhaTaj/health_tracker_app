import 'dart:io';

import 'package:intl/intl.dart';


mixin Validators {
  String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (!RegExp(
            r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|:<>?~`[\]\\\-=/.,;\'\\]).{8,}$")
        .hasMatch(value)) {
      return "Password: 8+ char, upper, lower, num, special.";
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    } else if (value != password) {
      print('$value d'  '$password a');
      return 'Password does not match';
    }
    return null;
  }
  String? validateConfirmEmail(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Confirm Email is required';
    } else if (value != password) {
      print('$value d'  '$password a');
      return 'Email does not match';
    }
    return null;
  }

  String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Email address cannot be empty';
    }
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
            .hasMatch(value)
        ? null
        : 'Please enter a valid email address';
  }

  bool isValidEmail(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value);
  }

  bool isValidPassword(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    } else if (value.length < 8) {
      return false;
    }
    return true;
  }

  String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Title is required';
    } else if (value.length < 10) {
      return 'Title must be at least 10 characters';
    }
    return null;
  }

  String? validateSecondTime(String startTime, String endTime) {
    if (startTime.isEmpty || endTime.isEmpty) {
      return 'Time is required';
    }

    // Parse start time
    DateTime startDateTime = DateFormat('hh:mm a').parse(startTime);

    // Parse end time
    DateTime endDateTime = DateFormat('hh:mm a').parse(endTime);

    if (endDateTime.isBefore(startDateTime)) {
      return "End time must be greater than start time";
    }

    return null;
  }


  String? validateName(value) {

    if (value == null || value.isEmpty) {
      return 'Name cannot be empty';
    } else if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }
  String? validateDropDown(value,title) {

    if (value == null || value.isEmpty) {
      return '$title cannot be empty';
    }
    return null;
  }

  String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    } else if (value.length < 3) {
      return 'Amount must be at least 3 characters';
    }
    return null;
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Address is required';
    } else if (value.length < 10) {
      return 'Address must be at least 10 characters';
    }
    return null;
  }

  String? validatePhoneNumber(value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number cannot be empty';
    } else if (value.length < 7 || value.length > 10) {
      return 'Phone Number must be between 7-10 digit.';
    }
    return null;
  }

  String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Description is required';
    } else if (value.length < 100) {
      return 'Description must be at least 100 characters';
    }
    return null;
  }

  String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Category is required';
    }
    return null;
  }

  String? validateAccountTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'Account title is required';
    }
    return null;
  }

  String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Account Number is required';
    }
    return null;
  }

  String? validateAvatar(int selectedAvatar, File? imageFile) {
    if (selectedAvatar == -1 && imageFile == null) {
      return 'Please choose an avatar or add your own photo!';
    }
    return null;
  }

  String? validateGender(String? gender) {
    if (gender == null || gender.isEmpty) {
      return 'Please select a gender first!';
    }
    return null;
  }
}
