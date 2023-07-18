import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/pages/detail_pages/cubit/store_page_info_states.dart';

class StorePageInfoCubits extends Cubit<List<StorePageInfoStates>> {
  StorePageInfoCubits() : super([]);

  addPageInfo(
    String? name,
    int? index,
    Color? color,
  ) {
    emit([
      StorePageInfoStates(
        name: name,
        index: index,
        color: color,
      ),
      ...state,
    ]);
  }

  updatePageInfo(
    String? name,
    int? index,
    Color? color,
  ) {
    var myList = state;
    for (int i = 0; i < myList.length; i++) {
      if (myList[i].name == name) {
        state.removeAt(i);
      }
    }
    emit([
      StorePageInfoStates(
        name: name,
        index: index,
        color: color,
      ),
      ...state,
    ]);
  }

  updatePageWish(String? name, int? index, Color? color) {
    var myList = state;

    for (int i = 0; i < myList.length; i++) {
      if (myList[i].name == name) {
        state.removeAt(i);
      }
    }
    //with this we always get the updated color of we change with wish button color
    emit([
      StorePageInfoStates(
        name: name,
        index: index,
        color: color,
      ),
      ...state,
    ]);
  }
}
