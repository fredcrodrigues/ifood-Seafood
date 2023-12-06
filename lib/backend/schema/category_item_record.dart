import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryItemRecord extends FirestoreRecord {
  CategoryItemRecord._(
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
      FirebaseFirestore.instance.collection('CategoryItem');

  static Stream<CategoryItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryItemRecord.fromSnapshot(s));

  static Future<CategoryItemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryItemRecord.fromSnapshot(s));

  static CategoryItemRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryItemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryItemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryItemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryItemRecordData({
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

class CategoryItemRecordDocumentEquality
    implements Equality<CategoryItemRecord> {
  const CategoryItemRecordDocumentEquality();

  @override
  bool equals(CategoryItemRecord? e1, CategoryItemRecord? e2) {
    return e1?.name == e2?.name && e1?.fkUserAdmin == e2?.fkUserAdmin;
  }

  @override
  int hash(CategoryItemRecord? e) =>
      const ListEquality().hash([e?.name, e?.fkUserAdmin]);

  @override
  bool isValidKey(Object? o) => o is CategoryItemRecord;
}
