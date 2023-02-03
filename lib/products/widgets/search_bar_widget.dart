import 'package:flutter/material.dart';
import '../view_model/search/search_view_model.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.viewModel,
    required this.searchBarStream,
  }) : super(key: key);

  final SearchViewModel viewModel;
  final Stream searchBarStream;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: TextFormField(
        decoration: InputDecoration(
            border:
                UnderlineInputBorder(borderRadius: BorderRadius.circular(20)),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            prefixIcon: const Icon(Icons.search),
            hintText: 'Sözcük Ara...'),
        onChanged: (val) {
          viewModel.filter(
            val,
            searchBarStream.listen(
              (event) {
                viewModel.name = event;
              },
            ),
          );
        },
      ),
    );
  }
}
