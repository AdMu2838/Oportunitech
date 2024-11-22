import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmpleoPresentacionRecord extends FirestoreRecord {
  EmpleoPresentacionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "company" field.
  DocumentReference? _company;
  DocumentReference? get company => _company;
  bool hasCompany() => _company != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "published_time" field.
  DateTime? _publishedTime;
  DateTime? get publishedTime => _publishedTime;
  bool hasPublishedTime() => _publishedTime != null;

  void _initializeFields() {
    _company = snapshotData['company'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _publishedTime = snapshotData['published_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('empleoPresentacion');

  static Stream<EmpleoPresentacionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmpleoPresentacionRecord.fromSnapshot(s));

  static Future<EmpleoPresentacionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EmpleoPresentacionRecord.fromSnapshot(s));

  static EmpleoPresentacionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmpleoPresentacionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmpleoPresentacionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmpleoPresentacionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmpleoPresentacionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmpleoPresentacionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmpleoPresentacionRecordData({
  DocumentReference? company,
  String? title,
  String? description,
  DateTime? publishedTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'company': company,
      'title': title,
      'description': description,
      'published_time': publishedTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmpleoPresentacionRecordDocumentEquality
    implements Equality<EmpleoPresentacionRecord> {
  const EmpleoPresentacionRecordDocumentEquality();

  @override
  bool equals(EmpleoPresentacionRecord? e1, EmpleoPresentacionRecord? e2) {
    return e1?.company == e2?.company &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.publishedTime == e2?.publishedTime;
  }

  @override
  int hash(EmpleoPresentacionRecord? e) => const ListEquality()
      .hash([e?.company, e?.title, e?.description, e?.publishedTime]);

  @override
  bool isValidKey(Object? o) => o is EmpleoPresentacionRecord;
}
