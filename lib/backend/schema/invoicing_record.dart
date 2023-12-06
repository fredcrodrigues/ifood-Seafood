import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoicingRecord extends FirestoreRecord {
  InvoicingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "order" field.
  DocumentReference? _order;
  DocumentReference? get order => _order;
  bool hasOrder() => _order != null;

  // "totalReceived" field.
  double? _totalReceived;
  double get totalReceived => _totalReceived ?? 0.0;
  bool hasTotalReceived() => _totalReceived != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "typePayment" field.
  String? _typePayment;
  String get typePayment => _typePayment ?? '';
  bool hasTypePayment() => _typePayment != null;

  // "idpayment" field.
  String? _idpayment;
  String get idpayment => _idpayment ?? '';
  bool hasIdpayment() => _idpayment != null;

  // "fk_user" field.
  DocumentReference? _fkUser;
  DocumentReference? get fkUser => _fkUser;
  bool hasFkUser() => _fkUser != null;

  // "fk_user_admin" field.
  DocumentReference? _fkUserAdmin;
  DocumentReference? get fkUserAdmin => _fkUserAdmin;
  bool hasFkUserAdmin() => _fkUserAdmin != null;

  // "refund" field.
  bool? _refund;
  bool get refund => _refund ?? false;
  bool hasRefund() => _refund != null;

  // "finished" field.
  bool? _finished;
  bool get finished => _finished ?? false;
  bool hasFinished() => _finished != null;

  void _initializeFields() {
    _order = snapshotData['order'] as DocumentReference?;
    _totalReceived = castToType<double>(snapshotData['totalReceived']);
    _time = snapshotData['time'] as DateTime?;
    _typePayment = snapshotData['typePayment'] as String?;
    _idpayment = snapshotData['idpayment'] as String?;
    _fkUser = snapshotData['fk_user'] as DocumentReference?;
    _fkUserAdmin = snapshotData['fk_user_admin'] as DocumentReference?;
    _refund = snapshotData['refund'] as bool?;
    _finished = snapshotData['finished'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Invoicing');

  static Stream<InvoicingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvoicingRecord.fromSnapshot(s));

  static Future<InvoicingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvoicingRecord.fromSnapshot(s));

  static InvoicingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvoicingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvoicingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvoicingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvoicingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvoicingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvoicingRecordData({
  DocumentReference? order,
  double? totalReceived,
  DateTime? time,
  String? typePayment,
  String? idpayment,
  DocumentReference? fkUser,
  DocumentReference? fkUserAdmin,
  bool? refund,
  bool? finished,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order': order,
      'totalReceived': totalReceived,
      'time': time,
      'typePayment': typePayment,
      'idpayment': idpayment,
      'fk_user': fkUser,
      'fk_user_admin': fkUserAdmin,
      'refund': refund,
      'finished': finished,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvoicingRecordDocumentEquality implements Equality<InvoicingRecord> {
  const InvoicingRecordDocumentEquality();

  @override
  bool equals(InvoicingRecord? e1, InvoicingRecord? e2) {
    return e1?.order == e2?.order &&
        e1?.totalReceived == e2?.totalReceived &&
        e1?.time == e2?.time &&
        e1?.typePayment == e2?.typePayment &&
        e1?.idpayment == e2?.idpayment &&
        e1?.fkUser == e2?.fkUser &&
        e1?.fkUserAdmin == e2?.fkUserAdmin &&
        e1?.refund == e2?.refund &&
        e1?.finished == e2?.finished;
  }

  @override
  int hash(InvoicingRecord? e) => const ListEquality().hash([
        e?.order,
        e?.totalReceived,
        e?.time,
        e?.typePayment,
        e?.idpayment,
        e?.fkUser,
        e?.fkUserAdmin,
        e?.refund,
        e?.finished
      ]);

  @override
  bool isValidKey(Object? o) => o is InvoicingRecord;
}
