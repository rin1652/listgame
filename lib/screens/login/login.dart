import 'package:flutter/material.dart';
import 'package:gamelist/constans/font.dart';
import '../home/home.dart';
import 'widgets/buttonlogin.dart';

var formKey = GlobalKey<FormState>();
var userNameController = TextEditingController();
var passwordController = TextEditingController();
const ENTERED = 1;
const UNENTERED = 2;

var statusOfClickLogin = 2;

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: backgroundImage, fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Image(image: logoBeeText),
                        buildCenterWidget(
                            userNameController, 'User name', USER_NAME),
                        buildCenterWidget(
                            passwordController, 'Password', PASSWORLD),
                        homepagelink(),
                        SizedBox(height: 36.0),
                        btnLogin(
                          text: 'ENTRAR',
                        ),
                        SizedBox(height: 36.0),
                        TxtOther('Anda não sou cadastrario'),
                      ],
                    ))),
            bottomNavigationBar:
                Container(child: TxtOther('Termos de uso e privacidade'))),
      ),
    );
  }
}

Widget TxtOther(String text) {
  return Text(
    text,
    style: lblText,
    textAlign: TextAlign.center,
  );
}

class homepagelink extends StatelessWidget {
  const homepagelink({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
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
      padding: EdgeInsets.symmetric(vertical: 7.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
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
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
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
              return "${hint} không được để trống";
            } else {
              if (type == PASSWORLD && statusOfClickLogin == ENTERED) {
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
