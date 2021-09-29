import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controler/components/components.dart';
import '../../controler/cubit/cubit.dart';
import '../../controler/cubit/states.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  Widget actionIcon = Icon(Icons.search);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            title: TextFormField(
              onEditingComplete: () {
                if (searchController.text.isEmpty) {
                  return null;
                } else {
                  NewsCubit.get(context).getSearch(searchController.text);
                }
              },
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Search must not be empty';
                }
                return null;
              },
              style: Theme.of(context).textTheme.bodyText1,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  if (searchController.text.isEmpty) {
                    return null;
                  } else {
                    NewsCubit.get(context).getSearch(searchController.text);
                  }
                },
                icon: actionIcon,
              )
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: itemNews(list),
              ),
            ],
          ),
        );
      },
    );
  }
}
