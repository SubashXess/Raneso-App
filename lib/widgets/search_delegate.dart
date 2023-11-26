import 'package:flutter/material.dart';
import '../models/models.dart';

class Search extends SearchDelegate {
  List<ListModel> filteredList = ListModel.generatedItem;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear_rounded,
          size: 20.0,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: const Icon(
        Icons.arrow_back_rounded,
        size: 20.0,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildListView(filteredList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    filteredList = query.isEmpty
        ? ListModel.generatedItem
        : ListModel.generatedItem
            .where((item) =>
                item.title.toLowerCase().contains(query.toLowerCase()) ||
                item.subtitle.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return buildListView(filteredList);
  }

  Widget buildListView(List<ListModel> items) {
    return ListView.separated(
      itemCount: items.length,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        item.subtitle,
                        style: const TextStyle(
                            fontSize: 14.0, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${item.price}',
                      style: const TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 4.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: item.profits.contains('+')
                              ? Colors.green.shade600
                              : Colors.redAccent),
                      child: Text(
                        item.profits,
                        style: const TextStyle(
                            fontSize: 14.0, color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(height: 0.0),
    );
  }
}
