import 'package:color_scheme_chooser/data/palette_response_model.dart';
import 'package:flutter/material.dart';

class PalettesList extends StatefulWidget {
  final List<PaletteResponseModel> list;
  const PalettesList({Key? key, required this.list}) : super(key: key);

  @override
  State<PalettesList> createState() => _PalettesListState();
}

class _PalettesListState extends State<PalettesList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    List<PaletteResponseModel> list = widget.list;
    return ListView.builder(
      controller: _scrollController,
      itemCount: list.length,
      itemBuilder: (context, index) {
        var title = list[index].title;
        var imageUrl = list[index].imageUrl;
        return _getListElement(title!, imageUrl!);
      },
    );
  }

  Widget _getListElement(String title, String imageUrl) {
    return Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Row(
          children: [
            _getImage(imageUrl),
            _getTitle(title),
          ],
        ));
  }

  Widget _getImage(String imageUrl) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: SizedBox(
          width: 100,
          child: Image.network(imageUrl)),
    );
  }

  Widget _getTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    print("scroll");
    if (_isBottom) {
      print("is Bottom");
    }
    print("scroll");
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
