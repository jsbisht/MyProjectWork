part of main;

@NgComponent(
    selector: 'data-stream',
    templateUrl: 'dart/components/data-stream/data-stream.html',
    cssUrl: const ['dart/components/data-stream/data-stream.css',
    'css/lib/bootstrap.css'],
    publishAs: 'DataStreamCmpnt')
class DataStreamComponent {
  DataStreamComponent(){
  }
}
