import 'package:flutter/material.dart';
import 'package:statefulwidget/screen/home_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Root(),
    ),
  );
}

class Root extends StatefulWidget {
  Root({Key? key}) : super(key: key) {
    print('Root Constructor 실행!');
  }

  @override
  _RootState createState() {
    print('Root createState 실행!');
    return _RootState();
  }
}

class _RootState extends State<Root> {
  Color color = Colors.blue;
  bool show = false;

  @override
  void initState() {
    print('Root initState 실행!');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('Root didChangeDependencies 실행!');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('Root build 실행!');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: show
                      ? HomeScreen(
                          color: color,
                        )
                      : Container(),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        color = color == Colors.red ? Colors.blue : Colors.red;
                      });
                    },
                    child: Text(
                      '색깔 변경하기',
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        print('Root setState 실행!');
                        show = !show;
                      });
                    },
                    child: Text(
                      !show ? '위젯 생성하기' : '위젯 삭제하기',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
