import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'cv_page_widget.dart' show CvPageWidget;
import 'package:flutter/material.dart';

class CvPageModel extends FlutterFlowModel<CvPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameTextController;
  String? Function(BuildContext, String?)? fullNameTextControllerValidator;
  String? _fullNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter the patients full name.';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode1;
  TextEditingController? descriptionTextController1;
  String? Function(BuildContext, String?)? descriptionTextController1Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode2;
  TextEditingController? descriptionTextController2;
  String? Function(BuildContext, String?)? descriptionTextController2Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode3;
  TextEditingController? descriptionTextController3;
  String? Function(BuildContext, String?)? descriptionTextController3Validator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode4;
  TextEditingController? descriptionTextController4;
  String? Function(BuildContext, String?)? descriptionTextController4Validator;

  @override
  void initState(BuildContext context) {
    fullNameTextControllerValidator = _fullNameTextControllerValidator;
  }

  @override
  void dispose() {
    fullNameFocusNode?.dispose();
    fullNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    descriptionFocusNode1?.dispose();
    descriptionTextController1?.dispose();

    descriptionFocusNode2?.dispose();
    descriptionTextController2?.dispose();

    descriptionFocusNode3?.dispose();
    descriptionTextController3?.dispose();

    descriptionFocusNode4?.dispose();
    descriptionTextController4?.dispose();
  }
}
