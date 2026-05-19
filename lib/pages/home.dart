import 'package:flutter/material.dart';
import 'package:login_teste/pages/dados_cadastrais.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController(initialPage: 0);
  int pagina = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Home"),),
          drawer: Drawer(
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Container (
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child:
                            const Text("Dados Cadastrados"),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DadosCadastraisPage() )
                          );
                        },
                      ),
                      const Divider(),
                      const SizedBox(height: 10,),
                      const Text("Termos de uso e privacidade"),
                      const Divider(),
                      const SizedBox(height: 10,),
                      const Text("Configurações")
                    ],
            )
            ),
          ),
          body: PageView(
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                pagina = value;
              });
            },
            children: [
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.black12,
              ),
              Container(
                color: Colors.amberAccent,
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(currentIndex: pagina,
              onTap: (value) {
           controller.jumpToPage(value);
              },
              items: [
                BottomNavigationBarItem(label: "Home",icon: Icon( Icons.home_filled)),
                BottomNavigationBarItem(label: "Add",icon: Icon(Icons.add)),
                BottomNavigationBarItem(label: "Details",icon: Icon(Icons.person))
          ]),
        ),
      )
    );

  }
}
