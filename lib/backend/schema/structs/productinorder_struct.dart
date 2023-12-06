// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductinorderStruct extends FFFirebaseStruct {
  ProductinorderStruct({
    List<ListProductInorderStruct>? lisproduct,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lisproduct = lisproduct,
        super(firestoreUtilData);

  // "lisproduct" field.
  List<ListProductInorderStruct>? _lisproduct;
  List<ListProductInorderStruct> get lisproduct => _lisproduct ?? const [];
  set lisproduct(List<ListProductInorderStruct>? val) => _lisproduct = val;
  void updateLisproduct(Function(List<ListProductInorderStruct>) updateFn) =>
      updateFn(_lisproduct ??= []);
  bool hasLisproduct() => _lisproduct != null;

  static ProductinorderStruct fromMap(Map<String, dynamic> data) =>
      ProductinorderStruct(
        lisproduct: getStructList(
          data['lisproduct'],
          ListProductInorderStruct.fromMap,
        ),
      );

  static ProductinorderStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ProductinorderStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'lisproduct': _lisproduct?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lisproduct': serializeParam(
          _lisproduct,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ProductinorderStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductinorderStruct(
        lisproduct: deserializeStructParam<ListProductInorderStruct>(
          data['lisproduct'],
          ParamType.DataStruct,
          true,
          structBuilder: ListProductInorderStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProductinorderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductinorderStruct &&
        listEquality.equals(lisproduct, other.lisproduct);
  }

  @override
  int get hashCode => const ListEquality().hash([lisproduct]);
}

ProductinorderStruct createProductinorderStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductinorderStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductinorderStruct? updateProductinorderStruct(
  ProductinorderStruct? productinorder, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productinorder
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductinorderStructData(
  Map<String, dynamic> firestoreData,
  ProductinorderStruct? productinorder,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productinorder == null) {
    return;
  }
  if (productinorder.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productinorder.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productinorderData =
      getProductinorderFirestoreData(productinorder, forFieldValue);
  final nestedData =
      productinorderData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productinorder.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductinorderFirestoreData(
  ProductinorderStruct? productinorder, [
  bool forFieldValue = false,
]) {
  if (productinorder == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productinorder.toMap());

  // Add any Firestore field values
  productinorder.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductinorderListFirestoreData(
  List<ProductinorderStruct>? productinorders,
) =>
    productinorders
        ?.map((e) => getProductinorderFirestoreData(e, true))
        .toList() ??
    [];
