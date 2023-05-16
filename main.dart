import 'package:chatgpt_app/data/models/prompt_model.dart';
import 'package:chatgpt_app/ui/views/home/home_view.dart';
import 'package:chatgpt_app/ui/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'Controller/MessageController.dart';
void main() async{
  try {
    await dotenv.load(fileName: '.env.Production');
  }catch(e){
    print(e);
  }
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatGpt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

MessageController messageController = Get.put(MessageController()) ;
final prompt = PromptModel(messageController: messageController);

class _MyHomePageState extends State<MyHomePage> {

  final homeViewModel = HomeViewModel(promptModel: prompt);

  @override
  Widget build(BuildContext context) {
    return HomeView(homeViewModel: homeViewModel,);
  }
}
