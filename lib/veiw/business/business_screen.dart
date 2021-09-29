import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controler/components/components.dart';
import '../../controler/cubit/cubit.dart';
import '../../controler/cubit/states.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<dynamic> list = NewsCubit.get(context).business;

        return list.length > 0
            ? itemNews(list)
            : Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              );
      },
    );
  }
}
