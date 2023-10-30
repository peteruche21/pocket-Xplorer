// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NetworkInfoStruct extends FFFirebaseStruct {
  NetworkInfoStruct({
    int? chainId,
    String? networkName,
    String? nativeToken,
    String? explorer,
    String? webhookTopic,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _chainId = chainId,
        _networkName = networkName,
        _nativeToken = nativeToken,
        _explorer = explorer,
        _webhookTopic = webhookTopic,
        super(firestoreUtilData);

  // "chainId" field.
  int? _chainId;
  int get chainId => _chainId ?? 0;
  set chainId(int? val) => _chainId = val;
  void incrementChainId(int amount) => _chainId = chainId + amount;
  bool hasChainId() => _chainId != null;

  // "networkName" field.
  String? _networkName;
  String get networkName => _networkName ?? '';
  set networkName(String? val) => _networkName = val;
  bool hasNetworkName() => _networkName != null;

  // "nativeToken" field.
  String? _nativeToken;
  String get nativeToken => _nativeToken ?? '';
  set nativeToken(String? val) => _nativeToken = val;
  bool hasNativeToken() => _nativeToken != null;

  // "explorer" field.
  String? _explorer;
  String get explorer => _explorer ?? '';
  set explorer(String? val) => _explorer = val;
  bool hasExplorer() => _explorer != null;

  // "webhookTopic" field.
  String? _webhookTopic;
  String get webhookTopic => _webhookTopic ?? '';
  set webhookTopic(String? val) => _webhookTopic = val;
  bool hasWebhookTopic() => _webhookTopic != null;

  static NetworkInfoStruct fromMap(Map<String, dynamic> data) =>
      NetworkInfoStruct(
        chainId: castToType<int>(data['chainId']),
        networkName: data['networkName'] as String?,
        nativeToken: data['nativeToken'] as String?,
        explorer: data['explorer'] as String?,
        webhookTopic: data['webhookTopic'] as String?,
      );

  static NetworkInfoStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? NetworkInfoStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'chainId': _chainId,
        'networkName': _networkName,
        'nativeToken': _nativeToken,
        'explorer': _explorer,
        'webhookTopic': _webhookTopic,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'chainId': serializeParam(
          _chainId,
          ParamType.int,
        ),
        'networkName': serializeParam(
          _networkName,
          ParamType.String,
        ),
        'nativeToken': serializeParam(
          _nativeToken,
          ParamType.String,
        ),
        'explorer': serializeParam(
          _explorer,
          ParamType.String,
        ),
        'webhookTopic': serializeParam(
          _webhookTopic,
          ParamType.String,
        ),
      }.withoutNulls;

  static NetworkInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      NetworkInfoStruct(
        chainId: deserializeParam(
          data['chainId'],
          ParamType.int,
          false,
        ),
        networkName: deserializeParam(
          data['networkName'],
          ParamType.String,
          false,
        ),
        nativeToken: deserializeParam(
          data['nativeToken'],
          ParamType.String,
          false,
        ),
        explorer: deserializeParam(
          data['explorer'],
          ParamType.String,
          false,
        ),
        webhookTopic: deserializeParam(
          data['webhookTopic'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NetworkInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NetworkInfoStruct &&
        chainId == other.chainId &&
        networkName == other.networkName &&
        nativeToken == other.nativeToken &&
        explorer == other.explorer &&
        webhookTopic == other.webhookTopic;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([chainId, networkName, nativeToken, explorer, webhookTopic]);
}

NetworkInfoStruct createNetworkInfoStruct({
  int? chainId,
  String? networkName,
  String? nativeToken,
  String? explorer,
  String? webhookTopic,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NetworkInfoStruct(
      chainId: chainId,
      networkName: networkName,
      nativeToken: nativeToken,
      explorer: explorer,
      webhookTopic: webhookTopic,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NetworkInfoStruct? updateNetworkInfoStruct(
  NetworkInfoStruct? networkInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    networkInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNetworkInfoStructData(
  Map<String, dynamic> firestoreData,
  NetworkInfoStruct? networkInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (networkInfo == null) {
    return;
  }
  if (networkInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && networkInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final networkInfoData =
      getNetworkInfoFirestoreData(networkInfo, forFieldValue);
  final nestedData =
      networkInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = networkInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNetworkInfoFirestoreData(
  NetworkInfoStruct? networkInfo, [
  bool forFieldValue = false,
]) {
  if (networkInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(networkInfo.toMap());

  // Add any Firestore field values
  networkInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNetworkInfoListFirestoreData(
  List<NetworkInfoStruct>? networkInfos,
) =>
    networkInfos?.map((e) => getNetworkInfoFirestoreData(e, true)).toList() ??
    [];
