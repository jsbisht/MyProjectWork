library database;

import 'dart:html';
import 'dart:async';
import 'dart:indexed_db';

class CommentListDbHelper {
  static final String Comment_DB = "Comments";
  static final String Comments_STORE = "Comments_Store";

  Database database;
  int version = 1;

  Future open() {
    return window.indexedDB.open(Comment_DB, version: version,
        onUpgradeNeeded: onUpgradeNeeded)
    .then(onDbOpened)
    .catchError(onError);
  }

  close(){
  }

  void onError(e) {
    // Get the user's attention for the sake of this tutorial. (Of course we
    // would *never* use window.alert() in real life.)
    window.alert('Oh no! Something went wrong. See the console for details.');
    window.console.log('An error occurred: {$e}');
  }

  void onDbOpened(Database db) {
    database = db;
  }

  void onUpgradeNeeded(VersionChangeEvent e) {
    Database db = (e.target as OpenDBRequest).result;
    if (!db.objectStoreNames.contains(Comments_STORE)) {
      db.createObjectStore(Comments_STORE, keyPath: 'timeStamp');
    }
  }

  Future addComment(String text) {
    if(database != null){
      var trans = database.transaction(Comments_STORE, 'readwrite');
      var store = trans.objectStore(Comments_STORE);
      var datetime =  new DateTime.now();
      Map dataToBeAdded = {
          'text': text,
          'timeStamp': datetime
      };

      return store.put(dataToBeAdded)
      .catchError((e) => onError);
    }
  }

  void deleteComment(String id) {
    var trans = database.transaction(Comments_STORE, 'readwrite');
    var store =  trans.objectStore(Comments_STORE);
    var request = store.delete(id);
    request.then((e) => getAllCommentItems(), onError: onError);
  }

  Future<List<String>> getAllCommentItems() {
    Completer completer = new Completer();

    if(database != null){
      List<String> commentList = new List<String>();
      Transaction trans = database.transaction(Comments_STORE, 'readwrite');
      ObjectStore store = trans.objectStore(Comments_STORE);

      // Get everything in the store.
      store.openCursor(autoAdvance:true).listen((cursor) {
        commentList.add(cursor.value['text']);
      }, onError: onError);

      completer.complete(commentList);

      return completer.future;
    }


  }

}
