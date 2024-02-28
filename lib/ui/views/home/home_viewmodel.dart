import 'package:stacked_2/app/app.bottomsheets.dart';
import 'package:stacked_2/app/app.dialogs.dart';
import 'package:stacked_2/app/app.locator.dart';
import 'package:stacked_2/app/app.router.dart';
import 'package:stacked_2/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  String get counterLabel => '$_counter';

  int _counter = 0;

  navigateToUsersView() async {
    await _navigationService.navigateToUsersView();
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void decrementCounter() {
    if (_counter > 0) {
      _counter--;
    }
    rebuildUi();
  }

  void resetCounter() {
    _counter = 0;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
