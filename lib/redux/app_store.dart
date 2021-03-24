/// Created by JB Pha Le on 3/24/21.
/// johnnycrystal9x@gmail.com

import 'package:phal_flutter_todo_app/redux/reducers/app_reducer.dart';
import 'package:phal_flutter_todo_app/redux/states/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

final Store<AppState> appStore = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
  middleware: [
    // Note the LoggingMiddleware should come last in the list of Middleware!
    new LoggingMiddleware.printer(),
  ],
);
