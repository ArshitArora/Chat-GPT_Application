import 'dart:convert';
import 'package:chatgpt_app/Controller/MessageController.dart';
import 'package:get/get.dart';
import '../services/openai_service.dart';

MessageController messageController =Get.put(MessageController()) ;
class OpenAIRepository {
  final OpenAIService _openAIService;
  final String prompt;

  OpenAIRepository(this.prompt, {required OpenAIService openAIService})
      : _openAIService = openAIService;

    fetchPrompts() async
  {
    messageController.updateObjMessageController(
        {
          "isUser":false,
          "message":"loading"
        });
    var response = await _openAIService.openAiService(prompt);
    var jsonData = json.decode(response.body);
    if(response.statusCode==200)
    {
      messageController.objMessageController.removeLast();
      messageController.updateObjMessageController(
          {
            "isUser":false,
            "message":jsonData["choices"][0]["message"]["content"]
          }
          );
      messageController.objMessageController.refresh();

    }else
    {
      messageController.objMessageController.removeLast();
      messageController.updateObjMessageController(
          {
            "isUser":false,
            "message":"error"
          });
    }
  }

}