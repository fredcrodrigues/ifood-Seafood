import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'modal_edit_client_widget.dart' show ModalEditClientWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ModalEditClientModel extends FlutterFlowModel<ModalEditClientWidget> {
  ///  Local state fields for this component.

  bool stateText = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in modalEditClient widget.
  UsersRecord? userID;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  final emailMask = MaskTextInputFormatter(mask: '*');
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for Telefone widget.
  FocusNode? telefoneFocusNode;
  TextEditingController? telefoneController;
  final telefoneMask = MaskTextInputFormatter(mask: '*');
  String? Function(BuildContext, String?)? telefoneControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    emailFocusNode?.dispose();
    emailController?.dispose();

    telefoneFocusNode?.dispose();
    telefoneController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
