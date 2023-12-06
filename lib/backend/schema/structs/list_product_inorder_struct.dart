// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListProductInorderStruct extends FFFirebaseStruct {
  ListProductInorderStruct({
    int? qtd,
    DocumentReference? productOrder,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _qtd = qtd,
        _productOrder = productOrder,
        super(firestoreUtilData);

  // "qtd" field.
  int? _qtd;
  int get qtd => _qtd ?? 0;
  set qtd(int? val) => _qtd = val;
  void incrementQtd(int amount) => _qtd = qtd + amount;
  bool hasQtd() => _qtd != null;

  // "productOrder" field.
  DocumentReference? _productOrder;
  DocumentReference? get productOrder => _productOrder;
  set productOrder(DocumentReference? val) => _productOrder = val;
  bool hasProductOrder() => _productOrder != null;

  static ListProductInorderStruct fromMap(Map<String, dynamic> data) =>
      ListProductInorderStruct(
        qtd: castToType<int>(data['qtd']),
        productOrder: data['productOrder'] as DocumentReference?,
      );

  static ListProductInorderStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? ListProductInorderStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'qtd': _qtd,
        'productOrder': _productOrder,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'qtd': serializeParam(
          _qtd,
          ParamType.int,
        ),
        'productOrder': serializeParam(
          _productOrder,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ListProductInorderStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ListProductInorderStruct(
        qtd: deserializeParam(
          data['qtd'],
          ParamType.int,
          false,
        ),
        productOrder: deserializeParam(
          data['productOrder'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['Products'],
        ),
      );

  @override
  String toString() => 'ListProductInorderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ListProductInorderStruct &&
        qtd == other.qtd &&
        productOrder == other.productOrder;
  }

  @override
  int get hashCode => const ListEquality().hash([qtd, productOrder]);
}

ListProductInorderStruct createListProductInorderStruct({
  int? qtd,
  DocumentReference? productOrder,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ListProductInorderStruct(
      qtd: qtd,
      productOrder: productOrder,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ListProductInorderStruct? updateListProductInorderStruct(
  ListProductInorderStruct? listProductInorder, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    listProductInorder
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addListProductInorderStructData(
  Map<String, dynamic> firestoreData,
  ListProductInorderStruct? listProductInorder,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (listProductInorder == null) {
    return;
  }
  if (listProductInorder.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && listProductInorder.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final listProductInorderData =
      getListProductInorderFirestoreData(listProductInorder, forFieldValue);
  final nestedData =
      listProductInorderData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      listProductInorder.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getListProductInorderFirestoreData(
  ListProductInorderStruct? listProductInorder, [
  bool forFieldValue = false,
]) {
  if (listProductInorder == null) {
    return {};
  }
  final firestoreData = mapToFirestore(listProductInorder.toMap());

  // Add any Firestore field values
  listProductInorder.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getListProductInorderListFirestoreData(
  List<ListProductInorderStruct>? listProductInorders,
) =>
    listProductInorders
        ?.map((e) => getListProductInorderFirestoreData(e, true))
        .toList() ??
    [];
