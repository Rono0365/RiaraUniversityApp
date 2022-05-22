import 'package:http/http.dart' as http;
import 'dart:convert';

Future GetData(url) async {
  var Response = await http.get(Uri.parse(url));
  print(Response.toString());
  return Response;
}
