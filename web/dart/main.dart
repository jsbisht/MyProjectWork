library main;

import 'dart:async';
import 'dart:indexed_db';
import 'package:angular/angular.dart';

import 'structs/InputDataStruct.dart';

import 'database/CommentListDbHelper.dart';

part 'components/input-box/InputBoxComponent.dart';
part 'components/data-stream/DataStreamComponent.dart';
part 'controllers/InputBoxController.dart';
part 'controllers/DataStreamController.dart';
part 'services/DataStreamService.dart';

main() {
  ngBootstrap(module: new CommentModule());
}

class CommentModule extends Module {
  CommentModule() {
    type(InputBoxComponent);
    type(InputBoxController);

    type(CommentListDbHelper);

    type(DataStreamService);
    type(DataStreamComponent);
    type(DataStreamController);

  }
}
