import 'package:flutter/material.dart';
import 'package:pilot/Components/Main/HomeScreen/home_screen_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});
 
  final HomeScreenViewModel viewModel;
  
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {

  void _pushScreen(BuildContext context) {
    print('push screen...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.viewModel.model.screenTitle),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed:  () {
                _pushScreen(context);
              },
              child: const Text('Do something...'),
            ), 
          ],
        ),
      ),
    );
  }
}
