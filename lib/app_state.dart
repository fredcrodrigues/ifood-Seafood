import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
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

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _isOptionsExpanded = false;
  bool get isOptionsExpanded => _isOptionsExpanded;
  set isOptionsExpanded(bool _value) {
    _isOptionsExpanded = _value;
  }

  bool _btnNavHome = false;
  bool get btnNavHome => _btnNavHome;
  set btnNavHome(bool _value) {
    _btnNavHome = _value;
  }

  bool _btnNavOrders = false;
  bool get btnNavOrders => _btnNavOrders;
  set btnNavOrders(bool _value) {
    _btnNavOrders = _value;
  }

  bool _btnNavClients = false;
  bool get btnNavClients => _btnNavClients;
  set btnNavClients(bool _value) {
    _btnNavClients = _value;
  }

  bool _btnNavInvoinving = false;
  bool get btnNavInvoinving => _btnNavInvoinving;
  set btnNavInvoinving(bool _value) {
    _btnNavInvoinving = _value;
  }

  bool _btnNavProducts = false;
  bool get btnNavProducts => _btnNavProducts;
  set btnNavProducts(bool _value) {
    _btnNavProducts = _value;
  }

  bool _stateMob = false;
  bool get stateMob => _stateMob;
  set stateMob(bool _value) {
    _stateMob = _value;
  }

  List<DocumentReference> _shoppingCartState = [];
  List<DocumentReference> get shoppingCartState => _shoppingCartState;
  set shoppingCartState(List<DocumentReference> _value) {
    _shoppingCartState = _value;
  }

  void addToShoppingCartState(DocumentReference _value) {
    _shoppingCartState.add(_value);
  }

  void removeFromShoppingCartState(DocumentReference _value) {
    _shoppingCartState.remove(_value);
  }

  void removeAtIndexFromShoppingCartState(int _index) {
    _shoppingCartState.removeAt(_index);
  }

  void updateShoppingCartStateAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _shoppingCartState[_index] = updateFn(_shoppingCartState[_index]);
  }

  void insertAtIndexInShoppingCartState(int _index, DocumentReference _value) {
    _shoppingCartState.insert(_index, _value);
  }

  bool _instock = false;
  bool get instock => _instock;
  set instock(bool _value) {
    _instock = _value;
  }

  int _contador = 0;
  int get contador => _contador;
  set contador(int _value) {
    _contador = _value;
  }

  String _stateOrder = '';
  String get stateOrder => _stateOrder;
  set stateOrder(String _value) {
    _stateOrder = _value;
  }

  bool _stateFilter = false;
  bool get stateFilter => _stateFilter;
  set stateFilter(bool _value) {
    _stateFilter = _value;
  }

  int _contadorAdmin = 0;
  int get contadorAdmin => _contadorAdmin;
  set contadorAdmin(int _value) {
    _contadorAdmin = _value;
  }

  int _contadorListShop = 0;
  int get contadorListShop => _contadorListShop;
  set contadorListShop(int _value) {
    _contadorListShop = _value;
  }

  String _statePayment = '';
  String get statePayment => _statePayment;
  set statePayment(String _value) {
    _statePayment = _value;
  }

  int _numberCar = 0;
  int get numberCar => _numberCar;
  set numberCar(int _value) {
    _numberCar = _value;
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
