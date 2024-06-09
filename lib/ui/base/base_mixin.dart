import 'package:todo/constant/constants.dart';
import 'package:todo/di/di.dart';
import 'package:todo/services/navService/i_navigation_service.dart';
import 'package:todo/ui/utils/utils.dart';

import '../../data/local_data_source/preference/i_pref_helper.dart';

mixin BaseMixin {
  final INavigationService _navigator = inject<INavigationService>();
  final Px _dimens = inject<Px>();
  final Utils _utils = inject<Utils>();
  Utils get utils => _utils;
  final IPrefHelper iPrefHelper = inject<IPrefHelper>();
  INavigationService get navigator => _navigator;
  Px get dimens => _dimens;
}
