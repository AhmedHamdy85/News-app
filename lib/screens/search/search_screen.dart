import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/componants.dart';
import 'package:news/cubit.dart';
import 'package:news/states.dart';

class SearchScreen extends StatelessWidget {
  var SearchControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var List = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DefoltFormFilde(
                    controller: SearchControler,
                    type: TextInputType.text,
                    validate: (value) {
                      if (value != null || value!.isEmpty) {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                    onChange: (value) {
                      NewsCubit.get(context).Search(value);
                    },
                    label: 'Search',
                    prefix: Icons.search,
                  ),
                ),
                Expanded(child: articalbilder(List, context, isSerch: true))
              ],
            ),
          );
        },
      ),
    );
  }
}
