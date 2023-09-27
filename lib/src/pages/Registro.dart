import 'package:flutter/material.dart';
import 'package:flutter_app_1/src/provider/counter.dart';
import 'package:provider/provider.dart';
import '../util/http_funcion.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController passController = TextEditingController();
  //es una variable global
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                //para llamar los get
                // Text(context.watch<CounterProvider>().counter.toString()),
                TextFormField(
                  controller: nombreController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Nombre', prefixIcon: Icon(Icons.person)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo requerido';
                    }
                  },
                ),
                TextFormField(
                  controller: correoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Correo', prefixIcon: Icon(Icons.person)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo requerido';
                    }
                  },
                ),
                TextFormField(
                  controller: passController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Contraseña', prefixIcon: Icon(Icons.person)),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo requerido';
                    }
                  },
                ), // SwitchListTile.adaptive(value: false, onChanged: (bool? value) {}),
                MaterialButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      Map<String, dynamic> info = {
                        'name': nombreController.text,
                        'email': correoController.text,
                        'password': passController.text
                      };
                      const apiUrl = '192.168.0.11:3000';
                      try {
                        final datos = await fetchData(apiUrl, info);
                        print('los datos de la peticion son $datos');
                      } catch (error) {
                        print('Hubo error en la peticion en registro $error');
                      }
                    }

                    //para llamar funciones
                    // context.read<CounterProvider>().increment();
                  },
                  child: Text('Registrarse'),
                )
              ],
            )),
      ),
    );
  }
}
