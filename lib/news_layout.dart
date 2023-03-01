import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/componants.dart';
import 'package:news/cubit.dart';
import 'package:news/screens/search/search_screen.dart';
import 'package:news/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getBusines()
        ..getScince()
        ..getSports(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'News App',
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    NavigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                    Icons.search,
                  ),
                ),
              ],
            ),
            body: cubit.screens[cubit.curentindex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.curentindex,
              onTap: (index) {
                cubit.ChangeBottomNavBar(index);
              },
              items: cubit.bottomitems,
            ),
          );
        },
      ),
    );
  }
}
