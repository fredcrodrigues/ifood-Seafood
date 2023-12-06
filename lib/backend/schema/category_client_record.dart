import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryClientRecord extends FirestoreRecord {
  CategoryClientRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "fk_user_admin" field.
  DocumentReference? _fkUserAdmin;
  DocumentReference? get fkUserAdmin => _fkUserAdmin;
  bool hasFkUserAdmin() => _fkUserAdmin != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _fkUserAdmin = snapshotData['fk_user_admin'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CategoryClient');

  static Stream<CategoryClientRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryClientRecord.fromSnapshot(s));

  static Future<CategoryClientRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryClientRecord.fromSnapshot(s));

  static CategoryClientRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryClientRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryClientRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryClientRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryClientRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryClientRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryClientRecordData({
  String? name,
  DocumentReference? fkUserAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'fk_user_admin': fkUserAdmin,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryClientRecordDocumentEquality
    implements Equality<CategoryClientRecord> {
  const CategoryClientRecordDocumentEquality();

  @override
  bool equals(CategoryClientRecord? e1, CategoryClientRecord? e2) {
    return e1?.name == e2?.name && e1?.fkUserAdmin == e2?.fkUserAdmin;
  }

  @override
  int hash(CategoryClientRecord? e) =>
      const ListEquality().hash([e?.name, e?.fkUserAdmin]);

  @override
  bool isValidKey(Object? o) => o is CategoryClientRecord;
}
