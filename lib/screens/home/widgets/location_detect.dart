import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grabclone/cubit/global_cubit.dart';
import 'package:grabclone/cubit/global_state.dart';

class LocationDetect extends StatefulWidget {
  const LocationDetect({super.key});

  @override
  State<LocationDetect> createState() => _LocationDetect();
}

class _LocationDetect extends State<LocationDetect> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(builder: (context, state) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('LAT: ${state.currentUserPosition?.latitude ?? ""}'),
            Text('LNG: ${state.currentUserPosition?.longitude ?? ""}'),
            Text('ADDRESS: ${state.currentAddress ?? ""}'),
          ],
        ),
      );
    });
  }
}
