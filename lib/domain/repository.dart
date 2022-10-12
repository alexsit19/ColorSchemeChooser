import 'package:color_scheme_chooser/data/palette_response_model.dart';

abstract class Repository {

  Future<List<PaletteResponseModel>?> getPalettes([int offset = 0]);
}