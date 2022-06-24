import 'package:coba_rest_api/api_service.dart';
import 'package:coba_rest_api/constants.dart';
import 'package:coba_rest_api/detail_info.dart';
import 'package:coba_rest_api/user_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _email = "";
  int _x = 1;
  List<UserModel> _userModel = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _getData() async {
    var _users = (await ApiService().getUsers())!;

    //Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    setState(() {
      _userModel = _users;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REST API'),
      ),
      body: _userModel.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailInfo(
                                id: _userModel[index].id,
                              )));
                },
                child: Text(
                  _userModel[index].id.toString(),
                ),
              ),
            ),
      //
      //
      //
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         "${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}",
      //       ),
      //       Text(
      //         _email,
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _getData,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
