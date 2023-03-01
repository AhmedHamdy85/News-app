abstract class NewsStates {}

class NewsInatialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetBusinessLodindState extends NewsStates {}

class NewsGetBusinessSucsesState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  late final String erorr;
  NewsGetBusinessErrorState(this.erorr);
}

class NewsGetSportsLodindState extends NewsStates {}

class NewsGetSportsSucsesState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  late final String erorr;
  NewsGetSportsErrorState(this.erorr);
}

class NewsGetScinceLodindState extends NewsStates {}

class NewsGetScinceSucsesState extends NewsStates {}

class NewsGetScinceErrorState extends NewsStates {
  late final String erorr;
  NewsGetScinceErrorState(this.erorr);
}

class NewsGetSearchLodindState extends NewsStates {}

class NewsGetSearchSucsesState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  late final String erorr;
  NewsGetSearchErrorState(this.erorr);
}
