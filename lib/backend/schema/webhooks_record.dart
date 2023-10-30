import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class WebhooksRecord extends FirestoreRecord {
  WebhooksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "webHookId" field.
  String? _webHookId;
  String get webHookId => _webHookId ?? '';
  bool hasWebHookId() => _webHookId != null;

  // "topic" field.
  String? _topic;
  String get topic => _topic ?? '';
  bool hasTopic() => _topic != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _webHookId = snapshotData['webHookId'] as String?;
    _topic = snapshotData['topic'] as String?;
    _address = snapshotData['address'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('webhooks')
          : FirebaseFirestore.instance.collectionGroup('webhooks');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('webhooks').doc();

  static Stream<WebhooksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WebhooksRecord.fromSnapshot(s));

  static Future<WebhooksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WebhooksRecord.fromSnapshot(s));

  static WebhooksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WebhooksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WebhooksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WebhooksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WebhooksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WebhooksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWebhooksRecordData({
  String? webHookId,
  String? topic,
  String? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'webHookId': webHookId,
      'topic': topic,
      'address': address,
    }.withoutNulls,
  );

  return firestoreData;
}

class WebhooksRecordDocumentEquality implements Equality<WebhooksRecord> {
  const WebhooksRecordDocumentEquality();

  @override
  bool equals(WebhooksRecord? e1, WebhooksRecord? e2) {
    return e1?.webHookId == e2?.webHookId &&
        e1?.topic == e2?.topic &&
        e1?.address == e2?.address;
  }

  @override
  int hash(WebhooksRecord? e) =>
      const ListEquality().hash([e?.webHookId, e?.topic, e?.address]);

  @override
  bool isValidKey(Object? o) => o is WebhooksRecord;
}
