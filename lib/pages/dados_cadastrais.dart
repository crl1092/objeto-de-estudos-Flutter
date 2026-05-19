import 'package:flutter/material.dart';
import 'package:login_teste/repositories/nivel_repository.dart';

class DadosCadastraisPage extends StatefulWidget {
   DadosCadastraisPage({super.key});

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  TextEditingController nomeController = TextEditingController(text: "");
  TextEditingController dataNacimento = TextEditingController(text: "");
  var niveis = [];
  var niveisRepository = NivelRepository();
  var nivelSelected = "";

  @override
  void initState() {
    niveis = niveisRepository.retorarNivel();
    super.initState();
  }

  Text retornarTexto(String texto) {
    return Text(texto, style: TextStyle(fontSize: 16, fontWeight: FontWeight(600)));
  }
  @override
  Widget build(BuildContext context) {
    return Material(
       child: SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Meus Dados"), centerTitle: true,),
      body: Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 8 ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          retornarTexto('Nome: '),
          TextField(
            controller: nomeController,
          ),
          retornarTexto(' Data De Nacimento:'),
          TextField(
            controller: dataNacimento,
            readOnly: true,
            onTap: () async {
             var data =  await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000,1,1),
                  firstDate: DateTime(1900,1,1),
                  lastDate: DateTime(2026,12,31));
             if(data != null) {
               dataNacimento.text = data.toString();
             }
            }
          ),
          retornarTexto("Nivel de experiencia"),
          Column(
            children:
              niveis.map((nivel) => RadioListTile(
                title:  Text(nivel.toString()),
                selected: nivelSelected == nivel,
                value: nivel.toString(),
              groupValue: nivelSelected,
              onChanged: (value) {
                print(value);
                setState(() {
                  nivelSelected = value.toString();
                });
              },)).toList(),

          ),
          TextButton(
              onPressed: () {
                print(nomeController.text);
              },
              child: Text('salvar'))
        ],
      ),)
        ),
    ),
    );
  }
}
