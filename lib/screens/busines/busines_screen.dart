import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/componants.dart';

import '../../cubit.dart';
import '../../states.dart';

class BusinesScreen extends StatelessWidget {
  const BusinesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var List = NewsCubit.get(context).business;
        return articalbilder(List, context);
      },
    );
  }
}
