
// To parse this JSON data, do
//
//     final weatherCondition = weatherConditionFromJson(jsonString);

import 'dart:convert';

List<WeatherCondition> weatherConditionFromJson(String str) => List<WeatherCondition>.from(json.decode(str).map((x) => WeatherCondition.fromJson(x)));

String weatherConditionToJson(List<WeatherCondition> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WeatherCondition {
  WeatherCondition({
    required this.code,
    required this.day,
    required this.night,
    required this.icon,
    required this.languages,
  });

  final int code;
  final String day;
  final String night;
  final int icon;
  final List<Language> languages;

  factory WeatherCondition.fromJson(Map<String, dynamic> json) => WeatherCondition(
    code: json["code"],
    day: json["day"],
    night: json["night"],
    icon: json["icon"],
    languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "day": day,
    "night": night,
    "icon": icon,
    "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
  };
}

class Language {
  Language({
    this.langName,
    this.langIso,
    required this.dayText,
    required this.nightText,
  });

  final LangName? langName;
  final LangIso? langIso;
  final String dayText;
  final String nightText;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    langName: langNameValues.map[json["lang_name"]],
    langIso: langIsoValues.map[json["lang_iso"]],
    dayText: json["day_text"],
    nightText: json["night_text"],
  );

  Map<String, dynamic> toJson() => {
    "lang_name": langNameValues.reverse[langName],
    "lang_iso": langIsoValues.reverse[langIso],
    "day_text": dayText,
    "night_text": nightText,
  };
}

enum LangIso { AR, BN, BG, ZH, ZH_TW, CS, NL, FI, FR, DE, EL, HI, HU, IT, JA, JV, KO, ZH_CMN, MR, PL, PT, PA, RO, RU, SR, SI, SK, ES, SV, TA, TE, TR, UK, UR, VI, ZH_WUU, ZH_HSN, ZH_YUE, ZU }

final langIsoValues = EnumValues({
  "ar": LangIso.AR,
  "bg": LangIso.BG,
  "bn": LangIso.BN,
  "cs": LangIso.CS,
  "de": LangIso.DE,
  "el": LangIso.EL,
  "es": LangIso.ES,
  "fi": LangIso.FI,
  "fr": LangIso.FR,
  "hi": LangIso.HI,
  "hu": LangIso.HU,
  "it": LangIso.IT,
  "ja": LangIso.JA,
  "jv": LangIso.JV,
  "ko": LangIso.KO,
  "mr": LangIso.MR,
  "nl": LangIso.NL,
  "pa": LangIso.PA,
  "pl": LangIso.PL,
  "pt": LangIso.PT,
  "ro": LangIso.RO,
  "ru": LangIso.RU,
  "si": LangIso.SI,
  "sk": LangIso.SK,
  "sr": LangIso.SR,
  "sv": LangIso.SV,
  "ta": LangIso.TA,
  "te": LangIso.TE,
  "tr": LangIso.TR,
  "uk": LangIso.UK,
  "ur": LangIso.UR,
  "vi": LangIso.VI,
  "zh": LangIso.ZH,
  "zh_cmn": LangIso.ZH_CMN,
  "zh_hsn": LangIso.ZH_HSN,
  "zh_tw": LangIso.ZH_TW,
  "zh_wuu": LangIso.ZH_WUU,
  "zh_yue": LangIso.ZH_YUE,
  "zu": LangIso.ZU
});

enum LangName { ARABIC, BENGALI, BULGARIAN, CHINESE_SIMPLIFIED, CHINESE_TRADITIONAL, CZECH, DUTCH, FINNISH, FRENCH, GERMAN, GREEK, HINDI, HUNGARIAN, ITALIAN, JAPANESE, JAVANESE, KOREAN, MANDARIN, MARATHI, POLISH, PORTUGUESE, PUNJABI, ROMANIAN, RUSSIAN, SERBIAN, SINHALESE, SLOVAK, SPANISH, SWEDISH, TAMIL, TELUGU, TURKISH, UKRAINIAN, URDU, VIETNAMESE, WU_SHANGHAINESE, XIANG, YUE_CANTONESE, ZULU }

final langNameValues = EnumValues({
  "Arabic": LangName.ARABIC,
  "Bengali": LangName.BENGALI,
  "Bulgarian": LangName.BULGARIAN,
  "Chinese Simplified": LangName.CHINESE_SIMPLIFIED,
  "Chinese Traditional": LangName.CHINESE_TRADITIONAL,
  "Czech": LangName.CZECH,
  "Dutch": LangName.DUTCH,
  "Finnish": LangName.FINNISH,
  "French": LangName.FRENCH,
  "German": LangName.GERMAN,
  "Greek": LangName.GREEK,
  "Hindi": LangName.HINDI,
  "Hungarian": LangName.HUNGARIAN,
  "Italian": LangName.ITALIAN,
  "Japanese": LangName.JAPANESE,
  "Javanese": LangName.JAVANESE,
  "Korean": LangName.KOREAN,
  "Mandarin": LangName.MANDARIN,
  "Marathi": LangName.MARATHI,
  "Polish": LangName.POLISH,
  "Portuguese": LangName.PORTUGUESE,
  "Punjabi": LangName.PUNJABI,
  "Romanian": LangName.ROMANIAN,
  "Russian": LangName.RUSSIAN,
  "Serbian": LangName.SERBIAN,
  "Sinhalese": LangName.SINHALESE,
  "Slovak": LangName.SLOVAK,
  "Spanish": LangName.SPANISH,
  "Swedish": LangName.SWEDISH,
  "Tamil": LangName.TAMIL,
  "Telugu": LangName.TELUGU,
  "Turkish": LangName.TURKISH,
  "Ukrainian": LangName.UKRAINIAN,
  "Urdu": LangName.URDU,
  "Vietnamese": LangName.VIETNAMESE,
  "Wu (Shanghainese)": LangName.WU_SHANGHAINESE,
  "Xiang": LangName.XIANG,
  "Yue (Cantonese)": LangName.YUE_CANTONESE,
  "Zulu": LangName.ZULU
});

class EnumValues<T> {
  late Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
