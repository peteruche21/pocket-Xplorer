import '/components/history_list/history_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'history_page_widget.dart' show HistoryPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistoryPageModel extends FlutterFlowModel<HistoryPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HistoryList component.
  late HistoryListModel historyListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    historyListModel = createModel(context, () => HistoryListModel());
  }

  void dispose() {
    unfocusNode.dispose();
    historyListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
