import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatbotRecord extends FirestoreRecord {
  ChatbotRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatbot');

  static Stream<ChatbotRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatbotRecord.fromSnapshot(s));

  static Future<ChatbotRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatbotRecord.fromSnapshot(s));

  static ChatbotRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ChatbotRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatbotRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatbotRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatbotRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatbotRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatbotRecordData({
  String? titulo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatbotRecordDocumentEquality implements Equality<ChatbotRecord> {
  const ChatbotRecordDocumentEquality();

  @override
  bool equals(ChatbotRecord? e1, ChatbotRecord? e2) {
    return e1?.titulo == e2?.titulo;
  }

  @override
  int hash(ChatbotRecord? e) => const ListEquality().hash([e?.titulo]);

  @override
  bool isValidKey(Object? o) => o is ChatbotRecord;
}
