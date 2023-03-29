import 'package:flutter/material.dart';

import '../../../constans/font.dart';
import '../../home/home.dart';
import '../login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class btnLogin extends StatelessWidget {
  final String text; // khai báo biến text là một tham số của class

  btnLogin({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.0,
      height: 40.0,
      child: ElevatedButton(
        child: Text(
          text,
          style: fontButon,
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFFC000),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
        onPressed: () async {
          // if (formKey.currentState!.validate()) {
          if (true) {
            if (userNameController.text.compareTo("a") == 0 &&
                passwordController.text.compareTo("a") == 0) {
              String userName = userNameController.text;
              var sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setString('username', userNameController.text);
              sharedPreferences.setString('password', passwordController.text);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => homepage()),
              );
            } else {
              print("Đăng nhập thất bại");
              statusOfClickLogin = ENTERED;
            }
          } else {
            print(passwordController.text.toString());
            statusOfClickLogin = ENTERED;
          }
        },
      ),
    );
  }
}
