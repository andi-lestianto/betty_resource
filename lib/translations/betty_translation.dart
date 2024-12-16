import 'package:betty_resource/translations/bettygeneral/bettygeneral_enus_translation.dart';
import 'package:betty_resource/translations/bettygeneral/bettygeneral_idid_translation.dart';
import 'package:get/get.dart';

class BettyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': BettyGeneralEnUSTranslation.language,
        'id_ID': BettyGeneralIdIDTranslation.language
      };
}
