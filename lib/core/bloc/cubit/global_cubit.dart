import 'package:bloc/bloc.dart';
import 'package:chef_app/core/bloc/cubit/global_state.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/services/service_locator.dart';

// class GlobalCubit extends Cubit<GlobalState> {
//   GlobalCubit() : super(GlobalInitial());
//   bool isArabic = false;
//   String languagecode = 'ar';
//   void changeLanguage() {
//     emit(ChangeLanguageLoading());
//     isArabic = !isArabic;
//     // languagecode = isArabic ? 'en' : 'ar';
//     languagecode = isArabic ? 'ar' : 'en';
//     emit(ChangeLanguageSucess());
//   }
// }

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  bool isArabic = false;
  String languageCode = 'en'; // Default to English

  void changeLanguage(String selectedLanguage) async {
    emit(ChangeLanguageLoading());
    if (languageCode != selectedLanguage) {
      languageCode = selectedLanguage;
      // isArabic = (languageCode == 'ar'); // Update flag
      await serviceLoactor<CacheHelper>().cacheLanguage(selectedLanguage);
      emit(ChangeLanguageSucess());
    }
  }


  void getcachedlanguage() {
    emit(ChangeLanguageLoading());
    final cachedlanguage = serviceLoactor<CacheHelper>().getCachedLanguage();
    languageCode = cachedlanguage;
    emit(ChangeLanguageSucess());
  }
}
