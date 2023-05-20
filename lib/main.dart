import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void getRequest() async {
    var uri = Uri.parse("https://reqres.in/api/users?page=2");
    var responce = await http.get(uri);
    print(responce.body.toString());
  }

  void postRequest() async {
    var uri = Uri.parse('https://reqres.in/api/login');
    var data = {"email": "eve.holt@reqres.in", "password": "cityslicka"};
    var reseonce = await http.post(uri, body: data);
    print(reseonce.body.toString());
  }

  @override
  void initState() {
    super.initState();
    postRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container()),
    );
  }
}
