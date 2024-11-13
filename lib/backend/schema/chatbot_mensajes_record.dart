import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatbotMensajesRecord extends FirestoreRecord {
  ChatbotMensajesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "isGemini" field.
  bool? _isGemini;
  bool get isGemini => _isGemini ?? false;
  bool hasIsGemini() => _isGemini != null;

  // "mensaje" field.
  String? _mensaje;
  String get mensaje => _mensaje ?? '';
  bool hasMensaje() => _mensaje != null;

  // "RefChat" field.
  DocumentReference? _refChat;
  DocumentReference? get refChat => _refChat;
  bool hasRefChat() => _refChat != null;

  void _initializeFields() {
    _isGemini = snapshotData['isGemini'] as bool?;
    _mensaje = snapshotData['mensaje'] as String?;
    _refChat = snapshotData['RefChat'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatbot_mensajes');

  static Stream<ChatbotMensajesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatbotMensajesRecord.fromSnapshot(s));

  static Future<ChatbotMensajesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatbotMensajesRecord.fromSnapshot(s));

  static ChatbotMensajesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatbotMensajesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatbotMensajesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatbotMensajesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatbotMensajesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatbotMensajesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatbotMensajesRecordData({
  bool? isGemini,
  String? mensaje,
  DocumentReference? refChat,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isGemini': isGemini,
      'mensaje': mensaje,
      'RefChat': refChat,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatbotMensajesRecordDocumentEquality
    implements Equality<ChatbotMensajesRecord> {
  const ChatbotMensajesRecordDocumentEquality();

  @override
  bool equals(ChatbotMensajesRecord? e1, ChatbotMensajesRecord? e2) {
    return e1?.isGemini == e2?.isGemini &&
        e1?.mensaje == e2?.mensaje &&
        e1?.refChat == e2?.refChat;
  }

  @override
  int hash(ChatbotMensajesRecord? e) =>
      const ListEquality().hash([e?.isGemini, e?.mensaje, e?.refChat]);

  @override
  bool isValidKey(Object? o) => o is ChatbotMensajesRecord;
}
