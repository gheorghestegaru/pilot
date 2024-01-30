import 'package:pilot/Components/Main/Adapters/Network/app_root_network.dart';
import 'package:pilot/Components/Main/Features/Main/Presentation/Home/home_screen_model.dart';

class HomeScreenViewModel {
  const HomeScreenViewModel({required this.network, required this.model});
  final HomeScreenModel model;
  final AppRootNetwork network;
  
  Future<String> getFirstRecipe() async {
    final response = await network.executeRandomRecipesGetRequest();
    final title = response?.first.title;
    if (title != null) {
      return title;
    }
    return "Error, no recipe found!";
  }
}