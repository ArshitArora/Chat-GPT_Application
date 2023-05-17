
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
class OpenAIService {
  static const String _baseUrl = "https://api.openai.com/v1/chat/completions";
  static final String _apiKey = '${dotenv.env["jwtToken"]}';

  Future<http.Response> openAiService(String content) async {
    Map data = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "user",
          "content": content
        }
      ]
    };
    String body = json.encode(data);
    try{
      final response = await http.post(
          Uri.parse(_baseUrl),
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization' :_apiKey ,
          },
          body: body);

      return response;
    }catch(error)
    {
      return http.Response(body, 0);
    }

  }
}

