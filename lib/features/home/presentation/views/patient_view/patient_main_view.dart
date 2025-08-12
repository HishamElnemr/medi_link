import 'package:flutter/material.dart';
import 'package:medi_link/features/home/presentation/views/patient_view/widgets/main_view_body.dart';

import 'widgets/custom_buttom_nav_bar.dart';

class PatientMainView extends StatefulWidget {
  const PatientMainView({super.key});

  @override
  State<PatientMainView> createState() => _PatientMainViewState();
}

class _PatientMainViewState extends State<PatientMainView> {
  int currentViewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: MainViewBody(currentViewIndex: currentViewIndex)),
      bottomNavigationBar: CustomButtomNavBar(
        selectedIndex: currentViewIndex,
        onItemTapped: (index) {
          setState(() {
            currentViewIndex = index;
          });
        },
      ),
    );
  }
}
