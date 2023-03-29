import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Color color;

  HomeScreen({
    required this.color,
    Key? key,
  }) : super(key: key) {
    print('HomeScreen Constructor 실행!');
  }

  @override
  _HomeScreenState createState() {
    print('HomeScreen createState 실행!');
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int number = 0;

  @override
  void initState() {
    print('HomeScreen initState 실행!');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('HomeScreen didChangeDependencies 실행!');
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    print('HomeScreen deactivate 실행!');
    super.deactivate();
  }

  @override
  void dispose() {
    print('HomeScreen dispose 실행!');
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    print('HomeScreen didUpdateWidget 실행!');
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print('HomeScreen build 실행!');

    return GestureDetector(
      onTap: () {
        setState(() {
          print('박스 setState 실행!');
          number++;
        });
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        color: widget.color,
        child: Center(
          child: Text(
            number.toString(),
          ),
        ),
      ),
    );
  }
}
