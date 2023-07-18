import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_logics.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/pages/detail_pages/cubit/store_page_info_cubits.dart';
import 'package:travel_app/services/data_services.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AppCubits>(
            create: (_) => AppCubits(
              data: DataServices(),
            ),
          ),
          BlocProvider<StorePageInfoCubits>(
            create: (context) => StorePageInfoCubits(),
          ),
        ],
        child: const AppCubitLogics(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
