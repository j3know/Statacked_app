import 'package:stacked_2/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stacked_2/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked_2/ui/views/home/home_view.dart';
import 'package:stacked_2/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_2/ui/views/users/users_view.dart';
import 'package:stacked_2/services/user_service.dart';
import 'package:stacked_2/ui/views/details/details_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: UsersView),
    MaterialRoute(page: UserDetailsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UsersService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
