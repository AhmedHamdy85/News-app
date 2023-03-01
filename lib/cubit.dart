import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/dio_helper.dart';
import 'package:news/screens/busines/busines_screen.dart';
import 'package:news/screens/scince/scince_screen.dart';
import 'package:news/screens/sports/sports_screen.dart';

import 'package:news/states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInatialState());
  static NewsCubit get(context) => BlocProvider.of(context);
  int curentindex = 0;
  List<BottomNavigationBarItem> bottomitems = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'science',
    ),
  ];
  List<Widget> screens = [
    BusinesScreen(),
    SportsScreen(),
    ScinceScreen(),
  ];
  void ChangeBottomNavBar(index) {
    curentindex = index;
    if (index == 1)
      getSports();
    else if (index == 2) getScince();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusines() {
    emit(NewsGetBusinessLodindState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '3f3a0e763c0f441884832e8d473717e0',
      },
    ).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSucsesState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetBusinessErrorState(onError.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLodindState());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '3f3a0e763c0f441884832e8d473717e0',
        },
      ).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportsSucsesState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetSportsErrorState(onError.toString()));
      });
    } else
      emit(NewsGetSportsSucsesState());
  }

  List<dynamic> scince = [];
  void getScince() {
    emit(NewsGetScinceLodindState());
    if (scince.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '3f3a0e763c0f441884832e8d473717e0',
        },
      ).then((value) {
        scince = value.data['articles'];
        emit(NewsGetScinceSucsesState());
      }).catchError((onError) {
        print(onError.toString());
        emit(NewsGetScinceErrorState(onError.toString()));
      });
    } else
      emit(NewsGetScinceSucsesState());
  }

  List<dynamic> search = [];
  void Search(String value) {
    emit(NewsGetSearchLodindState());
    search = [];
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': '3f3a0e763c0f441884832e8d473717e0',
      },
    ).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSucsesState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewsGetSearchErrorState(onError.toString()));
    });
  }
}
