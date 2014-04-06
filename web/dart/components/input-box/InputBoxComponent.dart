part of main;

@NgComponent(
    selector: 'input-box',
    templateUrl: 'dart/components/input-box/input-box.html',
    cssUrl: const ['dart/components/input-box/input-box.css',
      'css/lib/bootstrap.css'],
    publishAs: 'InptBoxCmpnt')
class InputBoxComponent {
  InputBoxComponent(){
  }
}
