import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShopCartRecord extends FirestoreRecord {
  ShopCartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fk_product" field.
  DocumentReference? _fkProduct;
  DocumentReference? get fkProduct => _fkProduct;
  bool hasFkProduct() => _fkProduct != null;

  // "fk_user" field.
  DocumentReference? _fkUser;
  DocumentReference? get fkUser => _fkUser;
  bool hasFkUser() => _fkUser != null;

  // "qtd" field.
  int? _qtd;
  int get qtd => _qtd ?? 0;
  bool hasQtd() => _qtd != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "finished" field.
  bool? _finished;
  bool get finished => _finished ?? false;
  bool hasFinished() => _finished != null;

  // "subTotal" field.
  double? _subTotal;
  double get subTotal => _subTotal ?? 0.0;
  bool hasSubTotal() => _subTotal != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "fk_user_admin" field.
  DocumentReference? _fkUserAdmin;
  DocumentReference? get fkUserAdmin => _fkUserAdmin;
  bool hasFkUserAdmin() => _fkUserAdmin != null;

  void _initializeFields() {
    _fkProduct = snapshotData['fk_product'] as DocumentReference?;
    _fkUser = snapshotData['fk_user'] as DocumentReference?;
    _qtd = castToType<int>(snapshotData['qtd']);
    _name = snapshotData['name'] as String?;
    _finished = snapshotData['finished'] as bool?;
    _subTotal = castToType<double>(snapshotData['subTotal']);
    _status = snapshotData['status'] as String?;
    _created = snapshotData['created'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _fkUserAdmin = snapshotData['fk_user_admin'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shopCart');

  static Stream<ShopCartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShopCartRecord.fromSnapshot(s));

  static Future<ShopCartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShopCartRecord.fromSnapshot(s));

  static ShopCartRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShopCartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShopCartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShopCartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShopCartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShopCartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShopCartRecordData({
  DocumentReference? fkProduct,
  DocumentReference? fkUser,
  int? qtd,
  String? name,
  bool? finished,
  double? subTotal,
  String? status,
  DateTime? created,
  String? image,
  DocumentReference? fkUserAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fk_product': fkProduct,
      'fk_user': fkUser,
      'qtd': qtd,
      'name': name,
      'finished': finished,
      'subTotal': subTotal,
      'status': status,
      'created': created,
      'image': image,
      'fk_user_admin': fkUserAdmin,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShopCartRecordDocumentEquality implements Equality<ShopCartRecord> {
  const ShopCartRecordDocumentEquality();

  @override
  bool equals(ShopCartRecord? e1, ShopCartRecord? e2) {
    return e1?.fkProduct == e2?.fkProduct &&
        e1?.fkUser == e2?.fkUser &&
        e1?.qtd == e2?.qtd &&
        e1?.name == e2?.name &&
        e1?.finished == e2?.finished &&
        e1?.subTotal == e2?.subTotal &&
        e1?.status == e2?.status &&
        e1?.created == e2?.created &&
        e1?.image == e2?.image &&
        e1?.fkUserAdmin == e2?.fkUserAdmin;
  }

  @override
  int hash(ShopCartRecord? e) => const ListEquality().hash([
        e?.fkProduct,
        e?.fkUser,
        e?.qtd,
        e?.name,
        e?.finished,
        e?.subTotal,
        e?.status,
        e?.created,
        e?.image,
        e?.fkUserAdmin
      ]);

  @override
  bool isValidKey(Object? o) => o is ShopCartRecord;
}
