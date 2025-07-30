import 'package:bkd/services/custom_widgets/custom_app_bar.dart';
import 'package:bkd/services/flavors/flavors.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: F.title,),
    );
  }
}
