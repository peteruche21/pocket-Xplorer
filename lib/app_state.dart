import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userId = prefs.getString('ff_userId') ?? _userId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _xploreAddress = '';
  String get xploreAddress => _xploreAddress;
  set xploreAddress(String _value) {
    _xploreAddress = _value;
  }

  NetworkInfoStruct _networks = NetworkInfoStruct.fromSerializableMap(jsonDecode(
      '{\"chainId\":\"1\",\"networkName\":\"eth-mainnet\",\"nativeToken\":\"ETH\",\"explorer\":\"https://etherscan.io\",\"webhookTopic\":\"ethereum_erc20_transfer\"}'));
  NetworkInfoStruct get networks => _networks;
  set networks(NetworkInfoStruct _value) {
    _networks = _value;
  }

  void updateNetworksStruct(Function(NetworkInfoStruct) updateFn) {
    updateFn(_networks);
  }

  String _userId = 'null';
  String get userId => _userId;
  set userId(String _value) {
    _userId = _value;
    prefs.setString('ff_userId', _value);
  }

  bool _watching = false;
  bool get watching => _watching;
  set watching(bool _value) {
    _watching = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
