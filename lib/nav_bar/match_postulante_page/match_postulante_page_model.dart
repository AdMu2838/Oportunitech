import '/flutter_flow/flutter_flow_util.dart';
import 'match_postulante_page_widget.dart' show MatchPostulantePageWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MatchPostulantePageModel
    extends FlutterFlowModel<MatchPostulantePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
