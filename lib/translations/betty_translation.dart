import 'package:betty_resource/translations/bettyfnb/bettyfnb_enus_translation.dart';
import 'package:betty_resource/translations/bettyfnb/bettyfnb_idid_translation.dart';
import 'package:betty_resource/translations/bettygeneral/bettygeneral_enus_translation.dart';
import 'package:betty_resource/translations/bettygeneral/bettygeneral_idid_translation.dart';
import 'package:betty_resource/translations/bettymain/bettymain_enus_translation.dart';
import 'package:betty_resource/translations/bettymain/bettymain_idid_translation.dart';
import 'package:get/get.dart';

class BettyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {}
          ..addAll(BettyGeneralEnUSTranslation.language)
          ..addAll(BettyMainEnUSTranslation.language)
          ..addAll(BettyFnBEnUSTranslation.language),
        'id_ID': {}
          ..addAll(BettyGeneralIdIDTranslation.language)
          ..addAll(BettyMainIdIDTranslation.language)
          ..addAll(BettyFnBIdIDTranslation.language)
      };
}
