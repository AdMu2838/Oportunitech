import '/components/datepicker/datepicker_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'login_complete_widget.dart' show LoginCompleteWidget;
import 'package:flutter/material.dart';

class LoginCompleteModel extends FlutterFlowModel<LoginCompleteWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for dni widget.
  FocusNode? dniFocusNode;
  TextEditingController? dniTextController;
  String? Function(BuildContext, String?)? dniTextControllerValidator;
  // State field(s) for firstNames widget.
  FocusNode? firstNamesFocusNode;
  TextEditingController? firstNamesTextController;
  String? Function(BuildContext, String?)? firstNamesTextControllerValidator;
  // State field(s) for lastNames widget.
  FocusNode? lastNamesFocusNode;
  TextEditingController? lastNamesTextController;
  String? Function(BuildContext, String?)? lastNamesTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // Model for datepicker component.
  late DatepickerModel datepickerModel;

  @override
  void initState(BuildContext context) {
    datepickerModel = createModel(context, () => DatepickerModel());
  }

  @override
  void dispose() {
    dniFocusNode?.dispose();
    dniTextController?.dispose();

    firstNamesFocusNode?.dispose();
    firstNamesTextController?.dispose();

    lastNamesFocusNode?.dispose();
    lastNamesTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    datepickerModel.dispose();
  }
}
