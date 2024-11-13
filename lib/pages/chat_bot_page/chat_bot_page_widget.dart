import '/backend/backend.dart';
import '/backend/gemini/gemini.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'chat_bot_page_model.dart';
export 'chat_bot_page_model.dart';

class ChatBotPageWidget extends StatefulWidget {
  /// chat
  const ChatBotPageWidget({super.key});

  @override
  State<ChatBotPageWidget> createState() => _ChatBotPageWidgetState();
}

class _ChatBotPageWidgetState extends State<ChatBotPageWidget> {
  late ChatBotPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatBotPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: StreamBuilder<List<ChatbotRecord>>(
              stream: queryChatbotRecord(),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<ChatbotRecord> listViewChatbotRecordList = snapshot.data!;

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: listViewChatbotRecordList.length,
                  itemBuilder: (context, listViewIndex) {
                    final listViewChatbotRecord =
                        listViewChatbotRecordList[listViewIndex];
                    return Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 15.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          _model.idChat = listViewChatbotRecord.reference;
                          safeSetState(() {});
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 10.0, 0.0, 0.0),
                              child: Text(
                                listViewChatbotRecord.titulo,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 15.0, 0.0),
                              child: Icon(
                                Icons.linear_scale,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.dehaze,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: Text(
            'Asistente Laboral',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
                  child: StreamBuilder<List<ChatbotMensajesRecord>>(
                    stream: queryChatbotMensajesRecord(
                      queryBuilder: (chatbotMensajesRecord) =>
                          chatbotMensajesRecord.where(
                        'RefChat',
                        isEqualTo: _model.idChat,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<ChatbotMensajesRecord>
                          listViewChatbotMensajesRecordList = snapshot.data!;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewChatbotMensajesRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewChatbotMensajesRecord =
                              listViewChatbotMensajesRecordList[listViewIndex];
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (listViewChatbotMensajesRecord.isGemini)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 50.0, 30.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.robot,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.8,
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: AutoSizeText(
                                            listViewChatbotMensajesRecord
                                                .mensaje,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (!listViewChatbotMensajesRecord.isGemini)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      30.0, 40.0, 30.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.75,
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            listViewChatbotMensajesRecord
                                                .mensaje,
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.person,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: Container(
                      width: 370.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(50.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (!_model.isCrearChat)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderRadius: 15.0,
                                buttonSize: 40.0,
                                fillColor: const Color(0xFF2C21A8),
                                icon: Icon(
                                  Icons.create,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  _model.isCrearChat = true;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          if (_model.isCrearChat)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 15.0,
                                buttonSize: 40.0,
                                fillColor: const Color(0xFF2C21A8),
                                icon: Icon(
                                  Icons.close,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  _model.isCrearChat = false;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 10.0, 0.0),
                              child: SizedBox(
                                width: 100.0,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    hintText: 'Escriba su pregunta',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    filled: true,
                                    fillColor:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  cursorColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 15.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 15.0,
                              buttonSize: 40.0,
                              fillColor: const Color(0xFF3B30A3),
                              icon: Icon(
                                Icons.send,
                                color: FlutterFlowTheme.of(context).info,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                var shouldSetState = false;
                                if (_model.isCrearChat) {
                                  var chatbotRecordReference =
                                      ChatbotRecord.collection.doc();
                                  await chatbotRecordReference
                                      .set(createChatbotRecordData(
                                    titulo: _model.textController.text,
                                  ));
                                  _model.idChatbot =
                                      ChatbotRecord.getDocumentFromData(
                                          createChatbotRecordData(
                                            titulo: _model.textController.text,
                                          ),
                                          chatbotRecordReference);
                                  shouldSetState = true;
                                  _model.idChat = _model.idChatbot?.reference;
                                  _model.isCrearChat = false;
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                } else {
                                  await geminiGenerateText(
                                    context,
                                    _model.textController.text,
                                  ).then((generatedText) {
                                    safeSetState(
                                        () => _model.resGemini = generatedText);
                                  });

                                  shouldSetState = true;

                                  await ChatbotMensajesRecord.collection
                                      .doc()
                                      .set(createChatbotMensajesRecordData(
                                        isGemini: false,
                                        mensaje: _model.textController.text,
                                        refChat: _model.idChat,
                                      ));

                                  await ChatbotMensajesRecord.collection
                                      .doc()
                                      .set(createChatbotMensajesRecordData(
                                        isGemini: true,
                                        mensaje: _model.resGemini,
                                        refChat: _model.idChat,
                                      ));
                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });
                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }

                                if (shouldSetState) safeSetState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
