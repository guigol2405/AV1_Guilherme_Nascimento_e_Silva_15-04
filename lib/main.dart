import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculadoraTMB(),
    );
  }
}

class CalculadoraTMB extends StatefulWidget {
  @override
  State<CalculadoraTMB> createState() => _CalculadoraTMBState();
}

class _CalculadoraTMBState extends State<CalculadoraTMB> {
  TextEditingController idade = TextEditingController();
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();

  String sexo = "Masculino";
  double atividade = 1.2;
  double resultado = 0;

  Map<String, double> atividades = {
    "Sedentário": 1.2,
    "Levemente ativo": 1.375,
    "Moderado": 1.55,
    "Intenso": 1.725,
    "Muito intenso": 1.9,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora Basal"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [

            Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: TextField(
                controller: idade,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Idade",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: TextField(
                controller: peso,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: TextField(
                controller: altura,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: "Masculino",
                    groupValue: sexo,
                    onChanged: (v) {
                      setState(() {
                        sexo = v!;
                      });
                    },
                  ),
                  Text("Masculino"),
                  Radio<String>(
                    value: "Feminino",
                    groupValue: sexo,
                    onChanged: (v) {
                      setState(() {
                        sexo = v!;
                      });
                    },
                  ),
                  Text("Feminino"),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: DropdownButtonFormField<double>(
                value: atividade,
                decoration: InputDecoration(
                  labelText: "Atividade",
                  border: OutlineInputBorder(),
                ),
                items: atividades.entries.map((item) {
                  return DropdownMenuItem<double>(
                    value: item.value,
                    child: Text(item.key),
                  );
                }).toList(),
                onChanged: (v) {
                  setState(() {
                    atividade = v!;
                  });
                },
              ),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                if (idade.text == "" ||
                    peso.text == "" ||
                    altura.text == "") {
                  return;
                }

                double i = double.parse(idade.text);
                double p = double.parse(peso.text);
                double a = double.parse(altura.text);

                double tmb = 0;

                if (sexo == "Masculino") {
                  tmb = 66 + (13.7 * p) + (5 * a) - (6.8 * i);
                } else {
                  tmb = 655 + (9.6 * p) + (1.8 * a) - (4.7 * i);
                }

                setState(() {
                  resultado = tmb * atividade;
                });
              },
              child: Text("Calcular"),
            ),

            SizedBox(height: 15),

            Container(
              margin: EdgeInsets.all(6),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(),
              ),
              child: Text(
                resultado == 0
                    ? "Coloque os dados"
                    : "Seu gasto é ${resultado.toStringAsFixed(0)} kcal",
              ),
            )

          ],
        ),
      ),
    );
  }
}