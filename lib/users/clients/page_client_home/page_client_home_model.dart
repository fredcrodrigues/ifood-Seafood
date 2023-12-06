import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general/nav_client/nav_client_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/users/clients/components/modal_product_details/modal_product_details_widget.dart';
import '/users/clients/components/modal_shop_car_empty/modal_shop_car_empty_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'page_client_home_widget.dart' show PageClientHomeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class PageClientHomeModel extends FlutterFlowModel<PageClientHomeWidget> {
  ///  Local state fields for this page.

  int numberCar = 0;

  List<ProductsRecord> listProducts = [];
  void addToListProducts(ProductsRecord item) => listProducts.add(item);
  void removeFromListProducts(ProductsRecord item) => listProducts.remove(item);
  void removeAtIndexFromListProducts(int index) => listProducts.removeAt(index);
  void insertAtIndexInListProducts(int index, ProductsRecord item) =>
      listProducts.insert(index, item);
  void updateListProductsAtIndex(
          int index, Function(ProductsRecord) updateFn) =>
      listProducts[index] = updateFn(listProducts[index]);

  bool isSeacher = true;

  bool closed = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in pageClientHome widget.
  List<ShopCartRecord>? collectionShopCart;
  // Stores action output result for [Firestore Query - Query a collection] action in pageClientHome widget.
  List<ProductsRecord>? collectionProducts;
  // Stores action output result for [Firestore Query - Query a collection] action in pageClientHome widget.
  List<TypeOfProductRecord>? collectionType;
  // Model for navClient component.
  late NavClientModel navClientModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ProductsRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navClientModel = createModel(context, () => NavClientModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navClientModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
