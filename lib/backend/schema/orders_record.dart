import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "order_value" field.
  double? _orderValue;
  double get orderValue => _orderValue ?? 0.0;
  bool hasOrderValue() => _orderValue != null;

  // "num_order" field.
  int? _numOrder;
  int get numOrder => _numOrder ?? 0;
  bool hasNumOrder() => _numOrder != null;

  // "date_hour_order" field.
  DateTime? _dateHourOrder;
  DateTime? get dateHourOrder => _dateHourOrder;
  bool hasDateHourOrder() => _dateHourOrder != null;

  // "fk_user" field.
  DocumentReference? _fkUser;
  DocumentReference? get fkUser => _fkUser;
  bool hasFkUser() => _fkUser != null;

  // "shopCart" field.
  List<DocumentReference>? _shopCart;
  List<DocumentReference> get shopCart => _shopCart ?? const [];
  bool hasShopCart() => _shopCart != null;

  // "type_delivery" field.
  String? _typeDelivery;
  String get typeDelivery => _typeDelivery ?? '';
  bool hasTypeDelivery() => _typeDelivery != null;

  // "type_payment" field.
  String? _typePayment;
  String get typePayment => _typePayment ?? '';
  bool hasTypePayment() => _typePayment != null;

  // "fk_user_admin" field.
  DocumentReference? _fkUserAdmin;
  DocumentReference? get fkUserAdmin => _fkUserAdmin;
  bool hasFkUserAdmin() => _fkUserAdmin != null;

  // "fk_invoincing" field.
  DocumentReference? _fkInvoincing;
  DocumentReference? get fkInvoincing => _fkInvoincing;
  bool hasFkInvoincing() => _fkInvoincing != null;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _orderValue = castToType<double>(snapshotData['order_value']);
    _numOrder = castToType<int>(snapshotData['num_order']);
    _dateHourOrder = snapshotData['date_hour_order'] as DateTime?;
    _fkUser = snapshotData['fk_user'] as DocumentReference?;
    _shopCart = getDataList(snapshotData['shopCart']);
    _typeDelivery = snapshotData['type_delivery'] as String?;
    _typePayment = snapshotData['type_payment'] as String?;
    _fkUserAdmin = snapshotData['fk_user_admin'] as DocumentReference?;
    _fkInvoincing = snapshotData['fk_invoincing'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? status,
  double? orderValue,
  int? numOrder,
  DateTime? dateHourOrder,
  DocumentReference? fkUser,
  String? typeDelivery,
  String? typePayment,
  DocumentReference? fkUserAdmin,
  DocumentReference? fkInvoincing,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'order_value': orderValue,
      'num_order': numOrder,
      'date_hour_order': dateHourOrder,
      'fk_user': fkUser,
      'type_delivery': typeDelivery,
      'type_payment': typePayment,
      'fk_user_admin': fkUserAdmin,
      'fk_invoincing': fkInvoincing,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.status == e2?.status &&
        e1?.orderValue == e2?.orderValue &&
        e1?.numOrder == e2?.numOrder &&
        e1?.dateHourOrder == e2?.dateHourOrder &&
        e1?.fkUser == e2?.fkUser &&
        listEquality.equals(e1?.shopCart, e2?.shopCart) &&
        e1?.typeDelivery == e2?.typeDelivery &&
        e1?.typePayment == e2?.typePayment &&
        e1?.fkUserAdmin == e2?.fkUserAdmin &&
        e1?.fkInvoincing == e2?.fkInvoincing;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.status,
        e?.orderValue,
        e?.numOrder,
        e?.dateHourOrder,
        e?.fkUser,
        e?.shopCart,
        e?.typeDelivery,
        e?.typePayment,
        e?.fkUserAdmin,
        e?.fkInvoincing
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
