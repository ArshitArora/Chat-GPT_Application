import 'package:chatgpt_app/Controller/MessageController.dart';
import 'package:chatgpt_app/data/models/prompt_model.dart';



class HomeViewModel{
  final PromptModel promptModel;

  HomeViewModel({required this.promptModel});

  MessageController get messageController => promptModel.messageController;
}