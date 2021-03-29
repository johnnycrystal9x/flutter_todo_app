/// Created by JB Pha Le on 3/29/21.
/// johnnycrystal9x@gmail.com

import 'package:flutter_redux/flutter_redux.dart';
import 'package:phal_flutter_todo_app/redux/states/app_state.dart';
import 'package:redux/redux.dart';

Store storeSelector(context) => StoreProvider.of<AppState>(context);

AppState appStateSelector(context) => storeSelector(context).state;
