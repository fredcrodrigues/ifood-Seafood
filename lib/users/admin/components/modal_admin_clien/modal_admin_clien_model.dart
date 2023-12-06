import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/users/admin/components/modal_client/modal_client_widget.dart';
import 'modal_admin_clien_widget.dart' show ModalAdminClienWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class ModalAdminClienModel extends FlutterFlowModel<ModalAdminClienWidget> {
  ///  Local state fields for this component.

  bool stateModal = false;

  ///  State fields for stateful widgets in this component.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  String? _nameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo de nome obrigatório';
    }

    return null;
  }

  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameController;
  String? Function(BuildContext, String?)? lastnameControllerValidator;
  String? _lastnameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo de sobrenome obrigatório';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo de email obrigatório';
    }

    return null;
  }

  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  final phoneMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for state widget.
  FocusNode? stateFocusNode;
  TextEditingController? stateController;
  String? Function(BuildContext, String?)? stateControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode;
  TextEditingController? cityController;
  String? Function(BuildContext, String?)? cityControllerValidator;
  // State field(s) for adressMob widget.
  FocusNode? adressMobFocusNode;
  TextEditingController? adressMobController;
  String? Function(BuildContext, String?)? adressMobControllerValidator;
  // State field(s) for cepMob widget.
  FocusNode? cepMobFocusNode;
  TextEditingController? cepMobController;
  String? Function(BuildContext, String?)? cepMobControllerValidator;
  // State field(s) for numberMob widget.
  FocusNode? numberMobFocusNode;
  TextEditingController? numberMobController;
  String? Function(BuildContext, String?)? numberMobControllerValidator;
  // State field(s) for cep widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepController;
  final cepMask = MaskTextInputFormatter(mask: '######-###');
  String? Function(BuildContext, String?)? cepControllerValidator;
  String? _cepControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo de número';
    }

    return null;
  }

  // State field(s) for adress widget.
  FocusNode? adressFocusNode;
  TextEditingController? adressController;
  String? Function(BuildContext, String?)? adressControllerValidator;
  // State field(s) for numero widget.
  FocusNode? numeroFocusNode;
  TextEditingController? numeroController;
  String? Function(BuildContext, String?)? numeroControllerValidator;
  // State field(s) for complemento widget.
  FocusNode? complementoFocusNode;
  TextEditingController? complementoController;
  String? Function(BuildContext, String?)? complementoControllerValidator;
  // State field(s) for usernameWeb widget.
  FocusNode? usernameWebFocusNode;
  TextEditingController? usernameWebController;
  String? Function(BuildContext, String?)? usernameWebControllerValidator;
  String? _usernameWebControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo de usuario obrigatório';
    }

    return null;
  }

  // State field(s) for passwordWeb widget.
  FocusNode? passwordWebFocusNode;
  TextEditingController? passwordWebController;
  late bool passwordWebVisibility;
  String? Function(BuildContext, String?)? passwordWebControllerValidator;
  String? _passwordWebControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo de senha obrigatório';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 8) {
      return 'Maximum 8 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(
            '^(?=.*[a-zA-Z0-9!@#\$%^&*()-_+=])[a-zA-Z0-9!@#\$%^&*()-_+=]{1,8}\$')
        .hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for replacepasswordWeb widget.
  FocusNode? replacepasswordWebFocusNode;
  TextEditingController? replacepasswordWebController;
  late bool replacepasswordWebVisibility;
  String? Function(BuildContext, String?)?
      replacepasswordWebControllerValidator;
  String? _replacepasswordWebControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo de confirmar senha obrigatório';
    }

    if (val.length < 8) {
      return 'Requires at least 8 characters.';
    }
    if (val.length > 8) {
      return 'Maximum 8 characters allowed, currently ${val.length}.';
    }
    if (!RegExp(
            '^(?=.*[a-zA-Z0-9!@#\$%^&*()-_+=])[a-zA-Z0-9!@#\$%^&*()-_+=]{1,8}\$')
        .hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for categoryWeb widget.
  String? categoryWebValue;
  FormFieldController<String>? categoryWebValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameControllerValidator = _nameControllerValidator;
    lastnameControllerValidator = _lastnameControllerValidator;
    emailControllerValidator = _emailControllerValidator;
    cepControllerValidator = _cepControllerValidator;
    usernameWebControllerValidator = _usernameWebControllerValidator;
    passwordWebVisibility = false;
    passwordWebControllerValidator = _passwordWebControllerValidator;
    replacepasswordWebVisibility = false;
    replacepasswordWebControllerValidator =
        _replacepasswordWebControllerValidator;
  }

  void dispose() {
    nameFocusNode?.dispose();
    nameController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();

    stateFocusNode?.dispose();
    stateController?.dispose();

    cityFocusNode?.dispose();
    cityController?.dispose();

    adressMobFocusNode?.dispose();
    adressMobController?.dispose();

    cepMobFocusNode?.dispose();
    cepMobController?.dispose();

    numberMobFocusNode?.dispose();
    numberMobController?.dispose();

    cepFocusNode?.dispose();
    cepController?.dispose();

    adressFocusNode?.dispose();
    adressController?.dispose();

    numeroFocusNode?.dispose();
    numeroController?.dispose();

    complementoFocusNode?.dispose();
    complementoController?.dispose();

    usernameWebFocusNode?.dispose();
    usernameWebController?.dispose();

    passwordWebFocusNode?.dispose();
    passwordWebController?.dispose();

    replacepasswordWebFocusNode?.dispose();
    replacepasswordWebController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
