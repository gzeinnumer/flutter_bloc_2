import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_2/ColorBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
        builder: (context) => ColorBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.amber,
            onPressed: () {
              colorBloc.dispatch(ColorEvent.to_amber);
            },
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            backgroundColor: Colors.lightBlue,
            onPressed: () {
              colorBloc.dispatch(ColorEvent.to_light_blue);
            },
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Bloc Dengan Libary flutter_bloc"),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, state) =>  AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 100,
            height: 100,
            color: state,
          ),
        ),
      ),
    );
  }
}
