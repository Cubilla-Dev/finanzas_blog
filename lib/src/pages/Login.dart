import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  Future<void> loginUser() async {
    final Uri loginUrl = Uri.http('192.168.0.11:3000', '/login');

    final Map<String, dynamic> requestBody = {
      'email': emailController.text,
      'password': passController.text
    };

    final http.Response response = await http.post(loginUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestBody));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String token = responseData['token'];

      // Guardar el token en SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      //
      // Navigator.of(context).pushNamedAndRemoveUntil('/blog', (route) => false);
      context.go('/home');
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['message'];
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error de inicio de sesion'),
              content: Text(errorMessage),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cerrar'))
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                loginUser();
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}

//no utilizado todavia

// Widget cuerpo(BuildContext context, TextEditingController emailController,
//     TextEditingController passController) {
//   return Container(
//     decoration: const BoxDecoration(
//       image: DecorationImage(
//         image: NetworkImage(
//             'https://cdn.shopify.com/s/files/1/0525/0452/7046/files/nezuko-Kamado-Demon-Slayer-Kimetsu-no-Yaiba-2_480x480.jpg?v=1615237194'),
//         fit: BoxFit.cover,
//       ),
//     ),
//     child: Form(
//         child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         const Text(
//           'Iniciar Sesion',
//           style: TextStyle(color: Colors.white, fontSize: 26),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: TextField(
//             controller: emailController,
//             obscureText: true,
//             decoration: const InputDecoration(
//               hintText: 'Correo',
//               fillColor: Colors.white,
//               filled: true,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//           child: TextField(
//             controller: passController,
//             obscureText: true,
//             decoration: const InputDecoration(
//               hintText: 'Contraseña',
//               fillColor: Colors.white,
//               filled: true,
//             ),
//           ),
//         ),
//         ElevatedButton(
//             onPressed: () {
//               onHome(context);
//             },
//             child: const Text('Iniciar Sesion'))
//       ],
//     )),
//   );
// }

// void onHome(BuildContext context) =>
//     Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
