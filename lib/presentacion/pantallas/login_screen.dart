import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_03/presentacion/pantallas/tasklist_screen.dart';
import 'package:test_03/utils/color.dart';
import 'package:test_03/utils/input_style.dart';
import 'package:test_03/utils/message.dart';
import 'package:test_03/widget/social_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   final TextEditingController controllerText = TextEditingController();
   final TextEditingController controllerPassword = TextEditingController();
   final key = GlobalKey<FormState>();
   String? errorMessage;
   bool obscurePassword = true;
   bool rememberMe = false;

  void messageFuture() {
    MessageFloat.custom(context: context, color: ColorApp.color_06, text: 'Proximamente');
  }

  void seePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  void validationText() {
    if (key.currentState!.validate()) {
      setState(() {
        if (controllerText.text == 'Fabian' && controllerPassword.text == 'test123') {
          errorMessage = null;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TaskList())
          );
        } else {
          errorMessage = 'Credenciales incorrectas';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;


    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: ColorApp.color_02,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  ColorApp.color_08,
                  ColorApp.color_08,
                  ColorApp.color_07,
                  ColorApp.color_07,
                ],
                stops: const [0.0, 0.5, 0.5, 1.0]
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 30),
                SvgPicture.asset('assets/images/image_login.svg', width: 150),
                Text(
                  'Inicia Sesion en\ntu cuenta',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: ColorApp.color_02, fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'Complete sus datos para ingresar:',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: ColorApp.color_07, fontSize: 15),
                ),
                const SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                  width: 350,
                  decoration: BoxDecoration(
                    color: ColorApp.color_02,
                    border: Border.all(color: ColorApp.color_04.withOpacity(0.1), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SocialButton( onTap: messageFuture, iconPath: 'assets/images/google_logo.svg'),
                          SocialButton(onTap: messageFuture, iconPath: 'assets/images/apple_logo.svg'),
                          SocialButton(onTap: messageFuture, iconPath: 'assets/images/facebook_logo.svg'),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(color: ColorApp.color_09  , thickness: 1, endIndent: 10,)
                          ),
                          Text(
                            'O Inicia sesion con',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(color: ColorApp.color_01, fontSize: 15),
                          ),
                          Expanded(
                            child: Divider(color: ColorApp.color_09  , thickness: 1, indent: 10,)
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Form(
                        key: key,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controllerText,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: 'Correo:',
                                labelStyle: TextStyle(color: ColorApp.color_10),
                                isDense: true,
                                enabledBorder: InputStyles.customBorder(color: ColorApp.color_09),
                                focusedBorder: InputStyles.customBorder(color: ColorApp.color_09),
                                errorBorder: InputStyles.customBorder(color: ColorApp.color_11),
                                focusedErrorBorder: InputStyles.customBorder(color: ColorApp.color_11),
                              ),
                            validator: (value) => (value?.trim().isEmpty ?? true) ? 'Ingresa tu correo' : null,
                            ),
                            const SizedBox(height: 15),
                            TextFormField(
                              controller: controllerPassword,
                              keyboardType: TextInputType.text,
                              onChanged: (value) => setState((){}),
                              obscureText: obscurePassword,
                              decoration: InputDecoration(
                                labelText: 'Contraseña:',
                                labelStyle: TextStyle(color: ColorApp.color_10),
                                isDense: true,
                                enabledBorder: InputStyles.customBorder(color: ColorApp.color_09),
                                focusedBorder: InputStyles.customBorder(color: ColorApp.color_09),
                                errorBorder: InputStyles.customBorder(color: ColorApp.color_11),
                                focusedErrorBorder: InputStyles.customBorder(color: ColorApp.color_11),
                                suffixIcon: controllerPassword.text.isNotEmpty
                                ? IconButton(
                                    onPressed: seePassword, 
                                    icon: Icon(obscurePassword? Icons.visibility_off : Icons.visibility)
                                  )
                                : null
                              ),
                              validator: (value) => (value?.trim().isEmpty ?? true) ? 'Ingresa tu contraseña' : null,
                            ),
                            const SizedBox(height: 5),
                            if (errorMessage != null) 
                              Text(errorMessage!,
                              style: GoogleFonts.poppins(color: ColorApp.color_11, fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 10),
                            CheckboxListTile(
                              title: const Text(
                                'Recordarme',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF6C7278),
                                ),
                              ),
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 0,
                              controlAffinity:  ListTileControlAffinity.leading,
                              checkboxShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)
                              ),
                              activeColor: ColorApp.color_08,
                              side: const BorderSide(color: Color(0xFF6C7278), width: 2),
                              value: rememberMe, 
                              onChanged: (bool? newValue) {
                                setState(() {
                                  rememberMe = newValue!;
                                });
                              }
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: validationText,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorApp.color_08,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              child: const Text('Iniciar Sesion', style: TextStyle(color: ColorApp.color_02, fontSize: 20))
                            )
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}