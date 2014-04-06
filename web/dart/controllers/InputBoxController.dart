part of main;

@NgController(
    selector: '[input-box-controller]',
    publishAs: 'InputBoxCtrl')
class InputBoxController {
  InputDataStruct inputData;
  DataStreamService dataStreamSrvc;
  String commentText;

  InputBoxController(DataStreamService dataStreamSrvc){
    this.dataStreamSrvc = dataStreamSrvc;
  }

  void addComment() {
    inputData = new InputDataStruct(commentText);
    commentText = '';

    Future addComment = dataStreamSrvc.addComment(inputData);

    Future<List<InputDataStruct>> getDataStream = dataStreamSrvc.getDataStream();

  }
}
