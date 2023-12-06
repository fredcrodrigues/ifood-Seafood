import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'modal_edit_local_widget.dart' show ModalEditLocalWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ModalEditLocalModel extends FlutterFlowModel<ModalEditLocalWidget> {
  ///  Local state fields for this component.

  bool stateText = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in modalEditLocal widget.
  UsersRecord? userID;
  // State field(s) for CEP widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepController;
  final cepMask = MaskTextInputFormatter(mask: '*');
  String? Function(BuildContext, String?)? cepControllerValidator;
  // State field(s) for Endereco widget.
  FocusNode? enderecoFocusNode;
  TextEditingController? enderecoController;
  final enderecoMask = MaskTextInputFormatter(mask: '*');
  String? Function(BuildContext, String?)? enderecoControllerValidator;
  // State field(s) for Complemento widget.
  FocusNode? complementoFocusNode;
  TextEditingController? complementoController;
  final complementoMask = MaskTextInputFormatter(mask: '*');
  String? Function(BuildContext, String?)? complementoControllerValidator;
  // State field(s) for Bairro widget.
  FocusNode? bairroFocusNode;
  TextEditingController? bairroController;
  final bairroMask = MaskTextInputFormatter(mask: '*');
  String? Function(BuildContext, String?)? bairroControllerValidator;
  // State field(s) for Numero widget.
  FocusNode? numeroFocusNode;
  TextEditingController? numeroController;
  final numeroMask = MaskTextInputFormatter(mask: '*');
  String? Function(BuildContext, String?)? numeroControllerValidator;
  // State field(s) for Cidade widget.
  FocusNode? cidadeFocusNode;
  TextEditingController? cidadeController;
  final cidadeMask = MaskTextInputFormatter(mask: '*');
  String? Function(BuildContext, String?)? cidadeControllerValidator;
  // State field(s) for Estado widget.
  FocusNode? estadoFocusNode;
  TextEditingController? estadoController;
  final estadoMask = MaskTextInputFormatter(mask: '*');
  String? Function(BuildContext, String?)? estadoControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    cepFocusNode?.dispose();
    cepController?.dispose();

    enderecoFocusNode?.dispose();
    enderecoController?.dispose();

    complementoFocusNode?.dispose();
    complementoController?.dispose();

    bairroFocusNode?.dispose();
    bairroController?.dispose();

    numeroFocusNode?.dispose();
    numeroController?.dispose();

    cidadeFocusNode?.dispose();
    cidadeController?.dispose();

    estadoFocusNode?.dispose();
    estadoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
