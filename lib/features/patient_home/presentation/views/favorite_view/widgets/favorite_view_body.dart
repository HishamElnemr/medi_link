import 'package:flutter/material.dart';
import 'package:medi_link/core/widgets/custom_sliver_app_bar.dart';
import 'package:medi_link/features/patient_home/presentation/views/favorite_view/widgets/favorite_doctors_bloc_builder.dart';
import 'package:medi_link/generated/l10n.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: S.of(context).favorites),
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: FavoriteDoctorsList(),
        ),
      ],
    );
  }
}
