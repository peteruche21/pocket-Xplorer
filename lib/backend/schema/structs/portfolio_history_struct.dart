// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PortfolioHistoryStruct extends FFFirebaseStruct {
  PortfolioHistoryStruct({
    List<int>? xCordinates,
    List<double>? yCordinates,
    String? netWorth,
    String? usdChange,
    String? percentChange,
    bool? percentChangePositive,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _xCordinates = xCordinates,
        _yCordinates = yCordinates,
        _netWorth = netWorth,
        _usdChange = usdChange,
        _percentChange = percentChange,
        _percentChangePositive = percentChangePositive,
        super(firestoreUtilData);

  // "xCordinates" field.
  List<int>? _xCordinates;
  List<int> get xCordinates => _xCordinates ?? const [];
  set xCordinates(List<int>? val) => _xCordinates = val;
  void updateXCordinates(Function(List<int>) updateFn) =>
      updateFn(_xCordinates ??= []);
  bool hasXCordinates() => _xCordinates != null;

  // "yCordinates" field.
  List<double>? _yCordinates;
  List<double> get yCordinates => _yCordinates ?? const [];
  set yCordinates(List<double>? val) => _yCordinates = val;
  void updateYCordinates(Function(List<double>) updateFn) =>
      updateFn(_yCordinates ??= []);
  bool hasYCordinates() => _yCordinates != null;

  // "netWorth" field.
  String? _netWorth;
  String get netWorth => _netWorth ?? '';
  set netWorth(String? val) => _netWorth = val;
  bool hasNetWorth() => _netWorth != null;

  // "usdChange" field.
  String? _usdChange;
  String get usdChange => _usdChange ?? '';
  set usdChange(String? val) => _usdChange = val;
  bool hasUsdChange() => _usdChange != null;

  // "percentChange" field.
  String? _percentChange;
  String get percentChange => _percentChange ?? '';
  set percentChange(String? val) => _percentChange = val;
  bool hasPercentChange() => _percentChange != null;

  // "percentChangePositive" field.
  bool? _percentChangePositive;
  bool get percentChangePositive => _percentChangePositive ?? false;
  set percentChangePositive(bool? val) => _percentChangePositive = val;
  bool hasPercentChangePositive() => _percentChangePositive != null;

  static PortfolioHistoryStruct fromMap(Map<String, dynamic> data) =>
      PortfolioHistoryStruct(
        xCordinates: getDataList(data['xCordinates']),
        yCordinates: getDataList(data['yCordinates']),
        netWorth: data['netWorth'] as String?,
        usdChange: data['usdChange'] as String?,
        percentChange: data['percentChange'] as String?,
        percentChangePositive: data['percentChangePositive'] as bool?,
      );

  static PortfolioHistoryStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? PortfolioHistoryStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'xCordinates': _xCordinates,
        'yCordinates': _yCordinates,
        'netWorth': _netWorth,
        'usdChange': _usdChange,
        'percentChange': _percentChange,
        'percentChangePositive': _percentChangePositive,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'xCordinates': serializeParam(
          _xCordinates,
          ParamType.int,
          true,
        ),
        'yCordinates': serializeParam(
          _yCordinates,
          ParamType.double,
          true,
        ),
        'netWorth': serializeParam(
          _netWorth,
          ParamType.String,
        ),
        'usdChange': serializeParam(
          _usdChange,
          ParamType.String,
        ),
        'percentChange': serializeParam(
          _percentChange,
          ParamType.String,
        ),
        'percentChangePositive': serializeParam(
          _percentChangePositive,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PortfolioHistoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PortfolioHistoryStruct(
        xCordinates: deserializeParam<int>(
          data['xCordinates'],
          ParamType.int,
          true,
        ),
        yCordinates: deserializeParam<double>(
          data['yCordinates'],
          ParamType.double,
          true,
        ),
        netWorth: deserializeParam(
          data['netWorth'],
          ParamType.String,
          false,
        ),
        usdChange: deserializeParam(
          data['usdChange'],
          ParamType.String,
          false,
        ),
        percentChange: deserializeParam(
          data['percentChange'],
          ParamType.String,
          false,
        ),
        percentChangePositive: deserializeParam(
          data['percentChangePositive'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'PortfolioHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PortfolioHistoryStruct &&
        listEquality.equals(xCordinates, other.xCordinates) &&
        listEquality.equals(yCordinates, other.yCordinates) &&
        netWorth == other.netWorth &&
        usdChange == other.usdChange &&
        percentChange == other.percentChange &&
        percentChangePositive == other.percentChangePositive;
  }

  @override
  int get hashCode => const ListEquality().hash([
        xCordinates,
        yCordinates,
        netWorth,
        usdChange,
        percentChange,
        percentChangePositive
      ]);
}

PortfolioHistoryStruct createPortfolioHistoryStruct({
  String? netWorth,
  String? usdChange,
  String? percentChange,
  bool? percentChangePositive,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PortfolioHistoryStruct(
      netWorth: netWorth,
      usdChange: usdChange,
      percentChange: percentChange,
      percentChangePositive: percentChangePositive,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PortfolioHistoryStruct? updatePortfolioHistoryStruct(
  PortfolioHistoryStruct? portfolioHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    portfolioHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPortfolioHistoryStructData(
  Map<String, dynamic> firestoreData,
  PortfolioHistoryStruct? portfolioHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (portfolioHistory == null) {
    return;
  }
  if (portfolioHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && portfolioHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final portfolioHistoryData =
      getPortfolioHistoryFirestoreData(portfolioHistory, forFieldValue);
  final nestedData =
      portfolioHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = portfolioHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPortfolioHistoryFirestoreData(
  PortfolioHistoryStruct? portfolioHistory, [
  bool forFieldValue = false,
]) {
  if (portfolioHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(portfolioHistory.toMap());

  // Add any Firestore field values
  portfolioHistory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPortfolioHistoryListFirestoreData(
  List<PortfolioHistoryStruct>? portfolioHistorys,
) =>
    portfolioHistorys
        ?.map((e) => getPortfolioHistoryFirestoreData(e, true))
        .toList() ??
    [];
