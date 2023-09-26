import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchData(String apiUrl, dynamic requestBody) async {
  final Uri Url = Uri.http('$apiUrl', '/register');
  final http.Response response = await http.post(Url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(requestBody));

  if (response.statusCode == 20) {
    final responseData = json.decode(response.body);
    print('la peticion se fue');
    return responseData;
  } else {
    throw Exception('Error al cargar los datos');
  }
}
