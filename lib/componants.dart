import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/web_viw_screen.dart';

Widget DefoltButon({
  double width = double.infinity,
  Color background = Colors.blue,
  required VoidCallback? function,
  required String text,
  bool isUpercase = true,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpercase ? text.toUpperCase() : text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

Widget DefoltTextButton({
  required VoidCallback? function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget DefoltFormFilde({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onChange,
  GestureTapCallback? ontap,
  required FormFieldValidator<String>? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  bool isClicable = true,
  VoidCallback? SuffixPresd,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: (value) {
        print(value);
      },
      onChanged: onChange,
      enabled: isClicable,
      validator: validate,
      onTap: ontap,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: SuffixPresd,
                icon: Icon(
                  suffix,
                ))
            : null,
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );

// Widget BildeTaskItem(Map model, context) => Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 40,
//             child: Text('${model['time']}'),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '${model['title']}',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   '${model['data']}',
//                   style: TextStyle(
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           IconButton(
//             onPressed: () {
//               AppCuibit.get(context).UpdateDAtabase(
//                 status: 'done',
//                 id: model['id'],
//               );
//             },
//             icon: Icon(
//               Icons.check_box,
//               color: Colors.green,
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//               AppCuibit.get(context).UpdateDAtabase(
//                 status: 'archive',
//                 id: model['id'],
//               );
//             },
//             icon: Icon(
//               Icons.archive,
//               color: Colors.black45,
//             ),
//           ),
//         ],
//       ),
//     );

Widget BildeArticalItem(artical, context) => InkWell(
      onTap: () {
        NavigateTo(context, WebViewScreen(artical['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    '${artical['urlToImage']}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text('${artical['title']}',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    Text(
                      '${artical['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget MyDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
    );

// ignore: avoid_types_as_parameter_names
Widget articalbilder(List, context, {isSerch = false}) => ConditionalBuilder(
      condition: List.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => BildeArticalItem(List[index], context),
        separatorBuilder: (context, index) => MyDivider(),
        itemCount: 10,
      ),
      fallback: (context) => isSerch
          ? Container()
          : Center(child: const CircularProgressIndicator()),
    );

void NavigateTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

void NavigateAndFinsh(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (route) => false);
