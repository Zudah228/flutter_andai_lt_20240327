import 'package:flutter_deck/flutter_deck.dart';

import 'src/form_importance_1_slide.dart';
import 'src/form_issue_code_1_slide.dart';
import 'src/form_issue_code_2_slide.dart';
import 'src/form_issue_summary_1_slide.dart';
import 'src/form_issue_summary_2_slide.dart';
import 'src/form_issue_summary_3_slide.dart';
import 'src/form_issue_summary_4_slide.dart';
import 'src/form_issue_summary_5_slide.dart';
import 'src/form_solution_1_slide.dart';
import 'src/form_solution_2_slide.dart';
import 'src/form_solution_3_slide.dart';
import 'src/form_solution_4_slide.dart';
import 'src/form_solution_5_slide.dart';
import 'src/introduction_1_slide.dart';
import 'src/introduction_2_slide.dart';
import 'src/introduction_3_slide.dart';
import 'src/introduction_4_slide.dart';
import 'src/introduction_5_slide.dart';
import 'src/introduction_6_slide.dart';
import 'src/outlook_1_slide.dart';
import 'src/outlook_2_slide.dart';
import 'src/summary_slide.dart';
import 'src/thanks_slide.dart';
import 'src/title_slide.dart';

List<FlutterDeckSlideWidget> get slides => [
      TitleSlide(),
      Introduction1Slide(),
      Introduction2Slide(),
      Introduction3Slide(),
      Introduction4Slide(),
      Introduction5Slide(),
      Introduction6Slide(),
      FormImportance1Slide(),
      FormIssueCode1Slide(),
      FormIssueCode2Slide(),
      FormIssueSummary1Slide(),
      FormIssueSummary2Slide(),
      FormIssueSummary3Slide(),
      FormIssueSummary4Slide(),
      FormIssueSummary5Slide(),
      FormSolution1Slide(),
      FormSolution2Slide(),
      FormSolution3Slide(),
      FormSolution4Slide(),
      FormSolution5Slide(),
      Outlook1Slide(),
      Outlook2Slide(),
      SummarySlide(),
      ThanksSlide(),
    ];
