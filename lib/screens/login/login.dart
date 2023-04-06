import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gamelist/constans/font.dart';
import '../splash/components/getData.dart';
import 'components/buttonlogin.dart';
import 'package:gamelist/screens/splash/splash_screen.dart';

var formKey = GlobalKey<FormState>();
var userNameController = TextEditingController();
var passwordController = TextEditingController();
// ignore: constant_identifier_names
const ENTERED = 1;
// ignore: constant_identifier_names
const UNENTERED = 2;

var statusOfClickLogin = UNENTERED;
final accountProviders =
    StateNotifierProvider<AccountProvider, String>((ref) => AccountProvider());

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      bottom: true,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: backgroundImage, fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Image(image: logoBeeText),
                        buildCenterWidget(
                            userNameController, 'User name', USER_NAME),
                        buildCenterWidget(
                            passwordController, 'Password', PASSWORLD),
                        const Homepagelink(),
                        const SizedBox(height: 36.0),
                        const BtnLogin(
                          text: 'ENTRAR',
                        ),
                        const SizedBox(height: 36.0),
                        txtOther('Anda não sou cadastrario'),
                      ],
                    ))),
            bottomNavigationBar:
                Container(child: txtOther('Termos de uso e privacidade'))),
      ),
    );
  }
}

Widget txtOther(String text) {
  return Text(
    text,
    style: lblText,
    textAlign: TextAlign.center,
  );
}

class Homepagelink extends StatelessWidget {
  const Homepagelink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Esquueci minha senga',
      style: TextStyle(
          decoration: TextDecoration.underline,
          decorationThickness: 1.0,
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.normal),
    );
  }
}

Widget buildCenterWidget(
    TextEditingController controller, String hint, int type) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: TextFormField(
          obscureText: type == PASSWORLD ? true : false,
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[700],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            // label: Text('Tên đăng nhập'),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey[700]),

            // prefixIcon: Icon(Icons.person)
          ),
          style: TextStyle(
            color: Colors.grey[350],
          ),
          validator: (str) {
            if (str == null || str.isEmpty) {
              return "$hint không được để trống";
            } else {
              if (type == PASSWORLD && statusOfClickLogin == ENTERED) {
                statusOfClickLogin = UNENTERED;
                return "Sai tài khoản hoặc mật khẩu";
              }
              return null;
            }
          },
        ),
      ),
    ),
  );
}
