import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MyData> data = [];

//obtenemos el token que esta guardado adentro de celular
  Future<String?> obtenToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // final tokenGuardado = obtenToken();

  //hacemos la peticion al back
  Future<void> fetchData() async {
    final response =
        await http.get(Uri.http('${dotenv.get('IP_BACK')}', '/smallblog'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        data = responseData.map((item) => MyData.fromJson(item)).toList();

        // token = await obtenToken();
      });
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Llama a la función para obtener datos del servidor al cargar la pantalla de inicio.
  }

  @override
  Widget build(BuildContext context) {
    //para obtener el width de la pantalla
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: screenWidth,
          height: screenHeight,
          color: Color.fromARGB(255, 80, 155, 217),
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    //forma de pasar parametros
                    final id = data[index].blog_id;
                    context.goNamed('blog', pathParameters: {'id': '$id'});
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(data[index].title),
                      subtitle: Text(data[index].body),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

// final List<Map<String, dynamic>> jsonData = [];
//para iterar un objeto
class MyData {
  final String title;
  final String body;
  final int blog_id;

  MyData({required this.title, required this.body, required this.blog_id});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
        title: json['title'], body: json['body'], blog_id: json['blog_id']);
  }
}
