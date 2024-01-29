import 'package:flutter/material.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Home/home_screen_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});
 
  final HomeScreenViewModel viewModel;
  
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}
class _HomeScreenState extends State<HomeScreen> {
  String? firstRecipeTitle;

  Future<void> _getRecipes(BuildContext context) async {
    print('Get Recipes...');
    final response = await widget.viewModel.network.executeRandomRecipesGetRequest();

    setState(() {
      firstRecipeTitle = response?.first.title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.viewModel.model.screenTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _getRecipes(context);
              },
              child: const Text('Get Recipes...'),
            ),
            const SizedBox(height: 20),
            if (firstRecipeTitle != null)
              Text(
                'First Recipe: \n $firstRecipeTitle',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
