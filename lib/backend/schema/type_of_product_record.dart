import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TypeOfProductRecord extends FirestoreRecord {
  TypeOfProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "fk_user_admin" field.
  DocumentReference? _fkUserAdmin;
  DocumentReference? get fkUserAdmin => _fkUserAdmin;
  bool hasFkUserAdmin() => _fkUserAdmin != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _fkUserAdmin = snapshotData['fk_user_admin'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TypeOfProduct');

  static Stream<TypeOfProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TypeOfProductRecord.fromSnapshot(s));

  static Future<TypeOfProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TypeOfProductRecord.fromSnapshot(s));

  static TypeOfProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TypeOfProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TypeOfProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TypeOfProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TypeOfProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TypeOfProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTypeOfProductRecordData({
  String? type,
  DocumentReference? fkUserAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'fk_user_admin': fkUserAdmin,
    }.withoutNulls,
  );

  return firestoreData;
}

class TypeOfProductRecordDocumentEquality
    implements Equality<TypeOfProductRecord> {
  const TypeOfProductRecordDocumentEquality();

  @override
  bool equals(TypeOfProductRecord? e1, TypeOfProductRecord? e2) {
    return e1?.type == e2?.type && e1?.fkUserAdmin == e2?.fkUserAdmin;
  }

  @override
  int hash(TypeOfProductRecord? e) =>
      const ListEquality().hash([e?.type, e?.fkUserAdmin]);

  @override
  bool isValidKey(Object? o) => o is TypeOfProductRecord;
}
