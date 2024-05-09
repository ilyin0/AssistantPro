import 'package:async/async.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';

enum GeminiClientErrors { requestFailed }

@singleton
class GeminiClient {
  const GeminiClient();

  static final model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: const String.fromEnvironment('gemini-api-key'),
  );

  Future<Result<String>> sendMessage(String text) async {
    try {
      final response = await model.generateContent([Content.text(text)]);
      var responseText = response.text;
      return responseText != null
          ? Result.value(responseText)
          : Result.error(GeminiClientErrors.requestFailed);
    } catch (error) {
      return Result.error(error);
    }
  }
}
