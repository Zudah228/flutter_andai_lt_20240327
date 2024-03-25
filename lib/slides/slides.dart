import 'package:flutter_deck/flutter_deck.dart';

import 'src/form_importance_1_slide.dart';
import 'src/form_importance_2_slide.dart';
import 'src/form_importance_3_slide.dart';
import 'src/form_issue_code_1_slide.dart';
import 'src/form_issue_code_2_slide.dart';
import 'src/form_issue_summary_1_slide.dart';
import 'src/form_issue_summary_2_slide.dart';
import 'src/form_issue_summary_3_slide.dart';
import 'src/form_issue_summary_4_slide.dart';
import 'src/form_issue_summary_5_slide.dart';
import 'src/introduction_1_slide.dart';
import 'src/introduction_2_slide.dart';

List<FlutterDeckSlideWidget> get slides => [
      Introduction1Slide(),
      Introduction2Slide(),
      FormImportance1Slide(),
      FormImportance2Slide(),
      FormImportance3Slide(),
      FormIssueCode1Slide(),
      FormIssueCode2Slide(),
      FormIssueSummary1Slide(),
      FormIssueSummary2Slide(),
      FormIssueSummary3Slide(),
      FormIssueSummary4Slide(),
      FormIssueSummary5Slide(),
    ];
