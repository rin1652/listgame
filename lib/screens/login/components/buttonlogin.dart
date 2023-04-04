import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../constans/font.dart';
import '../../home/home.dart';
import '../login.dart';

class BtnLogin extends StatelessWidget {
  final String text; // khai báo biến text là một tham số của class

  const BtnLogin({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130.0,
      height: 40.0,
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC000),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0))),
            onPressed: () async {
              // if (formKey.currentState!.validate()) {
              if (true) {
                if (userNameController.text.compareTo("a") == 0 &&
                    passwordController.text.compareTo("a") == 0) {
                  // String userName = userNameController.text;
                  ref.read(accountProviders.notifier).postAccount();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } else {
                  // ignore: avoid_print
                  print("Đăng nhập thất bại");
                  statusOfClickLogin = ENTERED;
                }
                // ignore: dead_code
              } else {
                // ignore: avoid_print
                print(passwordController.text.toString());
                statusOfClickLogin = ENTERED;
              }
            },
            child: Text(
              text,
              style: fontButon,
            ),
          );
        },
      ),
    );
  }
}
