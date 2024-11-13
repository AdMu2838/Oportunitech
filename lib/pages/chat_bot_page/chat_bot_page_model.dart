import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_bot_page_widget.dart' show ChatBotPageWidget;
import 'package:flutter/material.dart';

class ChatBotPageModel extends FlutterFlowModel<ChatBotPageWidget> {
  ///  Local state fields for this page.

  String? respuesta;

  String? tokens;

  DocumentReference? idChat;

  bool isCrearChat = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatbotRecord? idChatbot;
  // Stores action output result for [Gemini - Generate Text] action in IconButton widget.
  String? resGemini;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
