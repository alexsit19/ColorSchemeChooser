import 'package:color_scheme_chooser/data/palette_response_model.dart';
import 'package:color_scheme_chooser/data/palettes_repository.dart';
import 'package:flutter/material.dart';

class ColorSchemeChooserApp extends StatelessWidget {
  const ColorSchemeChooserApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var repository = PaletteRepository();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Color scheme chooser "),
        ),
        body: FutureBuilder<List<PaletteResponseModel>?>(
          future: repository.getPalettes(),
          builder: (context, snapshot) {
            List<PaletteResponseModel>? list = snapshot.data;
            return ListView.builder(
              itemCount:  list?.length,
              itemBuilder: (context, index) {
                var title = list?[index].title;
                return ListTile(
                  title: Text(list?[index].title ?? "No title"),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
