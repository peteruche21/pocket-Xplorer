import '/components/assets_list/assets_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'assets_page_widget.dart' show AssetsPageWidget;
import 'package:flutter/material.dart';

class AssetsPageModel extends FlutterFlowModel<AssetsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AssetsList component.
  late AssetsListModel assetsListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    assetsListModel = createModel(context, () => AssetsListModel());
  }

  void dispose() {
    unfocusNode.dispose();
    assetsListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
