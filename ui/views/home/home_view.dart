

import 'package:chatgpt_app/data/repositories/openai_repository.dart';
import 'package:chatgpt_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../Shared/Widgets/prompt_card.dart';
import '../../Shared/Widgets/text_field.dart';
import 'home_view_model.dart';

class HomeView extends StatefulWidget {
  final HomeViewModel homeViewModel;
   const HomeView({Key? key, required this.homeViewModel}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}
final ScrollController _scrollController = ScrollController();



class _HomeViewState extends State<HomeView> {
  @override
  void initState() {

    super.initState();
  }
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.backGroundColor,
        appBar: AppBar(

          backgroundColor: AppColor.backGroundColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(

                AppIcons.gptIcon,
                width: 30,
              ),
              const SizedBox(width: 10,),
              const Text("ChatGPT"),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child:
                Obx(()=>ListView.builder(
                  controller: _scrollController,
                  itemCount: widget.homeViewModel.messageController.objMessageController.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment:widget.homeViewModel.messageController.objMessageController[index]["isUser"]?Alignment.topRight:Alignment.topLeft,
                          child: UserMessage(text: widget.homeViewModel.messageController.objMessageController[index]["message"]??"", color:Colors.black, icon: const Icon(Icons.confirmation_num_sharp), isUser:widget.homeViewModel.messageController.objMessageController[index]["isUser"] ,)),
                    );
                  },
                ),
                  )


              ),

            ),
            Row(
              children: [

                Expanded(
                  flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: ElevatedButton(onPressed: (){
                        messageController.objMessageController.clear();
                        messageController.objMessageController.refresh();
                      },style: ButtonStyle(

                        backgroundColor: MaterialStateProperty.all(const Color(0xffff394867)),
                        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                      ), child:  const Icon(Icons.add,color: Colors.white,),),
                    )),
                Expanded(
                    flex:5,child: Container(color: const Color(0xffff212a3e),child: AppTextField(textEditingController))),

              ],
            )
          ],
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
