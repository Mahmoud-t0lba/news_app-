import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'veiw/home/home_layout.dart';
import 'controler/bloc_observer.dart';
import 'controler/components/constants.dart';
import 'controler/cubit/cubit.dart';
import 'controler/cubit/states.dart';
import 'controler/network/local/cache_helper.dart';
import 'controler/network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(NewsApp(isDark));
}

class NewsApp extends StatelessWidget {
  final bool isDark;

  NewsApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => NewsCubit()
            ..getEverything()
            ..getBusiness()
            ..getScience()
            ..getSports()
            ..changeAppMode(fromShared: isDark),
        ),
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: NewsCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: lightMode,
            darkTheme: darkMode,
            title: 'News',
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
