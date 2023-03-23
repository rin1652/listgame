import 'package:flutter/material.dart';

import '../../../constans/font.dart';
import '../../home/home.dart';
import '../login.dart';

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
        onPressed: () {
          if (formKey.currentState!.validate()) {
            if (userNameController.text.compareTo("ab") == 0 &&
                passwordController.text.compareTo('1') == 0) {
              String userName = userNameController.text;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => homepage()),
              );
            } else {
              print("Đăng nhập thất bại");
              statusOfClickLogin = ENTERED;
            }
          } else {
            print("Dữ liệu không hợp lệ");
            statusOfClickLogin = ENTERED;
          }
        },
      ),
    );
  }
}
