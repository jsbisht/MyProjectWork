part of main;

@NgController(
    selector: '[data-stream-controller]',
    publishAs: 'DataStreamCtrl')
class DataStreamController {

  List<InputDataStruct> dataStream = [];

  DataStreamService dataStreamSrvc;

  DataStreamController(DataStreamService dataStreamSrvc){
    this.dataStreamSrvc = dataStreamSrvc;
    this.dataStream = dataStreamSrvc.dataStream;
  }

}
