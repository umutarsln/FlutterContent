import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Container createContainer(String harf, Color renk, {double margin = 0}) {
    return Container(
      width: 75,
      height: 75,
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: margin),
      color: renk,
      child: Text(
        harf,
        style: const TextStyle(fontSize: 48),
      ),
    );
  }

  Row createRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        createContainer('D', Colors.orange.shade200),
        createContainer('A', Colors.orange.shade400),
        createContainer('R', Colors.orange.shade600),
        createContainer('T', Colors.orange.shade800),
      ],
    );
  }

  Column createColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: createContainer('F', Colors.orange.shade300, margin: 15),
        ),
        Expanded(
          child: createContainer('L', Colors.orange.shade400, margin: 15),
        ),
        Expanded(
          child: createContainer('U', Colors.orange.shade500, margin: 15),
        ),
        Expanded(
          child: createContainer('T', Colors.orange.shade600, margin: 15),
        ),
        Expanded(
          child: createContainer('T', Colors.orange.shade700, margin: 15),
        ),
        Expanded(
          child: createContainer('E', Colors.orange.shade800, margin: 15),
        ),
        Expanded(
          child: createContainer('R', Colors.orange.shade900, margin: 15),
        ),
      ],
    );
  }

  final String _img1 =
      'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2Fyc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80';

  final String _img2 =
      'https://emrealtunbilek.com/wp-content/uploads/2016/10/apple-icon-72x72.png';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Container'),
        ),
        body: Container(
          color: Colors.red.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createRow(),
              Expanded(child: createColumn()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint('Clicked');
          },
          child: const Icon(
            Icons.account_circle_rounded,
            color: Colors.blue,
          ),
          backgroundColor: Colors.red,
        ),
      ),
    );
  }

  List<Widget> get flexibleContainer {
    return [
      Flexible(
        flex: 1,
        child: Container(
          width: 200,
          height: 300,
          color: Colors.yellow,
        ),
      ),
      Flexible(
        flex: 1,
        child: Container(
          width: 200,
          height: 300,
          color: Colors.red,
        ),
      ),
      Flexible(
        flex: 1,
        child: Container(
          width: 200,
          height: 300,
          color: Colors.blue,
        ),
      ),
      Flexible(
        flex: 1,
        child: Container(
          width: 200,
          height: 300,
          color: Colors.purple,
        ),
      ),
      Flexible(
        child: Container(
          width: 100,
          height: 300,
          color: Colors.red,
        ),
      ),
    ];
  }

  List<Widget> get expandedContainer {
    return [
      Expanded(
        flex: 2,
        child: Container(
          width: 25,
          height: 75,
          color: Colors.yellow,
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          height: 75,
          color: Colors.red,
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          width: 575,
          height: 75,
          color: Colors.blue,
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          width: 75,
          height: 75,
          color: Colors.orange,
        ),
      ),
    ];
  }

  Container rowColumn() {
    return Container(
      color: Colors.red.shade300,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'A',
              ),
              Text('B'),
              Text('C'),
              Text('D'),
            ],
          ),
          const Icon(
            Icons.add_circle,
            size: 64,
            color: Colors.green,
          ),
          const Icon(
            Icons.add_circle,
            size: 64,
            color: Colors.red,
          ),
          const Icon(
            Icons.add_circle,
            size: 64,
            color: Colors.blue,
          ),
          const Icon(
            Icons.add_circle,
            size: 64,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget container() {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: const Text(
          'example',
          style: TextStyle(fontSize: 128),
        ),
        decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.rectangle,
            border: Border.all(width: 4, color: Colors.purple),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            image: DecorationImage(
                image: NetworkImage(_img2),
                fit: BoxFit.scaleDown,
                repeat: ImageRepeat.repeat),
            boxShadow: const [
              BoxShadow(
                  color: Colors.green, offset: Offset(0, 20), blurRadius: 20),
              BoxShadow(
                  color: Colors.yellow, offset: Offset(0, -90), blurRadius: 10),
            ]),
      ),
    );
  }
}
