
import 'package:flutter/material.dart';
import 'package:login_teste/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var senhaController = TextEditingController();
  bool isObscure = true;

  Object? get email => null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black26,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ) ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Image.network(
                        "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                        height: 120,
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Já tem cadastro?",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight(600),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Faça seu login e make the change._",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                        style: TextStyle(color: Colors.white),
                      controller: emailController,
                      onChanged: (value) {

                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.purple[200]),
                        hint: Text("Email", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      obscureText: isObscure,
                      controller: senhaController,
                      onChanged: (value) {
                      debugPrint(senhaController as String?);
                      },
                      decoration: InputDecoration(
                        hint: Text("senha",  style: TextStyle(color: Colors.white)),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          child:
                            Icon(isObscure? Icons.visibility_off: Icons.visibility),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement( context, MaterialPageRoute(builder:  (context) => const HomePage() ));
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.purple[200],
                        ),
                      ),
                      child: Text("Entrar"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(child: Container()),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: Text(
                      "esqueci minha senha",
                      style: TextStyle(fontSize: 16, color: Colors.amber),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: Text(
                      "Criar conta",
                      style: TextStyle(color: Colors.green, fontSize: 13),
                    ),

                  ),
                  const SizedBox(height: 60,)
                ],
              )
          )
        ),
      ),
    );
  }
}
