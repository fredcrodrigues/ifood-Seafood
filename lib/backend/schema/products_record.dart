import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  bool hasQuantity() => _quantity != null;

  // "in_stock" field.
  bool? _inStock;
  bool get inStock => _inStock ?? false;
  bool hasInStock() => _inStock != null;

  // "value" field.
  double? _value;
  double get value => _value ?? 0.0;
  bool hasValue() => _value != null;

  // "fk_type_product" field.
  DocumentReference? _fkTypeProduct;
  DocumentReference? get fkTypeProduct => _fkTypeProduct;
  bool hasFkTypeProduct() => _fkTypeProduct != null;

  // "phto_url" field.
  String? _phtoUrl;
  String get phtoUrl => _phtoUrl ?? '';
  bool hasPhtoUrl() => _phtoUrl != null;

  // "fk_user_admin" field.
  DocumentReference? _fkUserAdmin;
  DocumentReference? get fkUserAdmin => _fkUserAdmin;
  bool hasFkUserAdmin() => _fkUserAdmin != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _quantity = castToType<int>(snapshotData['quantity']);
    _inStock = snapshotData['in_stock'] as bool?;
    _value = castToType<double>(snapshotData['value']);
    _fkTypeProduct = snapshotData['fk_type_product'] as DocumentReference?;
    _phtoUrl = snapshotData['phto_url'] as String?;
    _fkUserAdmin = snapshotData['fk_user_admin'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? name,
  String? description,
  int? quantity,
  bool? inStock,
  double? value,
  DocumentReference? fkTypeProduct,
  String? phtoUrl,
  DocumentReference? fkUserAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'quantity': quantity,
      'in_stock': inStock,
      'value': value,
      'fk_type_product': fkTypeProduct,
      'phto_url': phtoUrl,
      'fk_user_admin': fkUserAdmin,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.quantity == e2?.quantity &&
        e1?.inStock == e2?.inStock &&
        e1?.value == e2?.value &&
        e1?.fkTypeProduct == e2?.fkTypeProduct &&
        e1?.phtoUrl == e2?.phtoUrl &&
        e1?.fkUserAdmin == e2?.fkUserAdmin;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.quantity,
        e?.inStock,
        e?.value,
        e?.fkTypeProduct,
        e?.phtoUrl,
        e?.fkUserAdmin
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
