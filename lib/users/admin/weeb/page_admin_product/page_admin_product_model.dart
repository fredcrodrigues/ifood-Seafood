import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general/navbar_admin/navbar_admin_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/users/admin/components/modal_admin_product/modal_admin_product_widget.dart';
import '/users/admin/components/modal_category/modal_category_widget.dart';
import '/users/admin/components/modal_category_produto/modal_category_produto_widget.dart';
import '/users/admin/components/modal_delete_product/modal_delete_product_widget.dart';
import '/users/admin/components/modal_update_product/modal_update_product_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'page_admin_product_widget.dart' show PageAdminProductWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class PageAdminProductModel extends FlutterFlowModel<PageAdminProductWidget> {
  ///  Local state fields for this page.

  List<ProductsRecord> productList = [];
  void addToProductList(ProductsRecord item) => productList.add(item);
  void removeFromProductList(ProductsRecord item) => productList.remove(item);
  void removeAtIndexFromProductList(int index) => productList.removeAt(index);
  void insertAtIndexInProductList(int index, ProductsRecord item) =>
      productList.insert(index, item);
  void updateProductListAtIndex(int index, Function(ProductsRecord) updateFn) =>
      productList[index] = updateFn(productList[index]);

  bool isSeacher = true;

  bool closed = true;

  bool isload = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in pageAdminProduct widget.
  List<ProductsRecord>? prodcutsCollection;
  // Stores action output result for [Firestore Query - Query a collection] action in pageAdminProduct widget.
  List<TypeOfProductRecord>? collectionTypeProduct;
  // Model for navbarAdmin component.
  late NavbarAdminModel navbarAdminModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ProductsRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navbarAdminModel = createModel(context, () => NavbarAdminModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navbarAdminModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
