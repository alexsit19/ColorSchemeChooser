import 'package:color_scheme_chooser/data/palette_response_model.dart';
import 'package:color_scheme_chooser/domain/repository.dart';
import 'package:dio/dio.dart';

class PaletteRepository implements Repository {
  Dio dio = Dio();

  @override
  Future<List<PaletteResponseModel>?> getPalettes([int offset = 0]) async {
    List<PaletteResponseModel> palettes = [];
    try {
      var response = await dio.get('http://www.colourlovers.com/api/palettes?format=json&offset=$offset');
      if (response.statusCode == 200) {
        var data = response.data as List;
        palettes = data.map((item) => PaletteResponseModel.fromJson(item)).toList();
      }


    } catch (error) {
      print(error);
    }


      return palettes;
    }
  }


