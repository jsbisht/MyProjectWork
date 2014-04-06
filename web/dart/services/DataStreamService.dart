part of main;

class DataStreamService {

  CommentListDbHelper commentListDbHelper;
  InputDataStruct inputDataStruct;
  List<InputDataStruct> dataStream = [];

  DataStreamService(CommentListDbHelper commentListDbHelper) {
    this.commentListDbHelper = commentListDbHelper;

    Future openDatabase = commentListDbHelper.open();
  }

  /**
   * Add the InputData to database
   */
  Future addComment(InputDataStruct inputData){
    return commentListDbHelper.addComment(inputData.text);
  }

  /**
   * Get data stream from database
   */
  Future<List<InputDataStruct>> getDataStream(){

    return commentListDbHelper.getAllCommentItems().then((commentList){
      setDataStreamObj(commentList);
    });

  }

  /**
   * Set data stream object
   */
  void setDataStreamObj(List<String> commentList){
    for(String commentText in commentList){
      inputDataStruct = new InputDataStruct(commentText);
      dataStream.add(inputDataStruct);
    }

    print(commentList.length);
  }

  void setDataStream(){

    dataStream.add(new InputDataStruct("Test Value"));

  }

}
