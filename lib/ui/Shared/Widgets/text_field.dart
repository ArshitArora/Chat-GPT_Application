import 'package:chatgpt_app/data/repositories/openai_repository.dart';
import 'package:chatgpt_app/data/services/openai_service.dart';
import 'package:chatgpt_app/utils/app_icons.dart';
import 'package:flutter/material.dart';




class AppTextField extends StatelessWidget {
  final TextEditingController controller;


  const AppTextField(
    this.controller,
 {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 30),
      child: Container(

        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(50.0),
          ),
          border: Border.all(color: Colors.white,width: 0.5),
          color: Colors.black,

        ),
        child:TextFormField(
          onFieldSubmitted: (e) async{
            if(e.isNotEmpty) {
              messageController.updateObjMessageController(
                  {
                    "isUser": true,
                    "message": e
                  }
              );
              OpenAIRepository(e, openAIService: OpenAIService()).fetchPrompts();

              messageController.objMessageController.refresh();
              controller.clear();
            }

          },
          controller: controller,
          style: const TextStyle(
            color: Colors.white,
          ),
          decoration:  InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            focusColor: Colors.white,
            filled: true,
            fillColor: AppColor.keyboardColor,
            suffixIcon: InkWell(

              onTap: (){
                if(controller.text.isNotEmpty) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  messageController.updateObjMessageController(
                      {
                        "isUser": true,
                        "message": controller.text
                      }
                  );
                  OpenAIRepository(
                      controller.text, openAIService: OpenAIService())
                      .fetchPrompts();

                  messageController.objMessageController.refresh();
                  controller.clear();
                }
              },
              child: const Icon(
                Icons.send,
                color:AppColor.keyboardIconColor,
              ),
            ),
            focusedBorder: const OutlineInputBorder(

              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(

                Radius.circular(50.0),
              ),
            ),
            border: const OutlineInputBorder(

              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
          ),
        ),
      ),
    );
  }}

