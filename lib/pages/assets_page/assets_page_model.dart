import '/components/assets_list/assets_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'assets_page_widget.dart' show AssetsPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
