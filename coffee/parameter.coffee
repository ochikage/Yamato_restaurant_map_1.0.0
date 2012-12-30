###############################################################################
## @---	12/24/2012	Y.Ochi	Initial version                                  ##
###############################################################################

SEARCH_ZOOM_LEVEL = 16
USER_ID = 47009             #Lenovo accout ID
INIT_LATITUDE = 35.457611    #MMC building
INIT_LONGTITUDE = 139.633296 #MMC building
BALLOON_OFFSET = -110

CAT_NAME = {
  category       : "カテゴリ"
  japanese       : "日本料理"
  sushi          : "寿司"
  fish           : "魚介・海鮮料理"
  soba           : "そば(蕎麦)"
  udon           : "うどん"
  eel            : "うなぎ"
  grilled_chiken : "焼き鳥"
  fried_pork     : "とんかつ"
  spit_roasting  : "串揚げ"
  tempura        : "天ぷら"
  okonomi        : "お好み焼き"
  monja          : "もんじゃ焼き"
  syabusyabu     : "しゃぶしゃぶ"
  okinawa        : "沖縄料理"
  western        : "洋食"
  french         : "フレンチ"
  italian        : "イタリアン"
  spanish        : "スペイン料理"
  pasta          : "パスタ"
  pizza          : "ピザ"
  steak          : "ステーキ"
  hamburg_steak  : "ハンバーグ"
  hamburger      : "ハンバーガー"
  chinese        : "中華料理"
  dumpling       : "餃子"
  korean         : "韓国料理"
  thai           : "タイ料理"
  ramen          : "ラーメン"
  carry          : "カレー"
  grilled_meat   : "焼肉"
  organ          : "ホルモン"
  nabe           : "鍋"
  motsu_nabe     : "もつ鍋"
}

CAT_WORD = {
  category       : ".*"
  japanese       : "日本|和食"
  sushi          : "寿司|すし|スシ"
  fish           : "魚介|海鮮"
  soba           : "ソバ|そば|蕎麦"
  udon           : "うどん|饂飩"
  eel            : "うなぎ|ウナギ|鰻"
  grilled_chiken : "焼き鳥|やきとり|焼きとり"
  fried_pork     : "とんかつ|トンカツ|豚カツ"
  spit_roasting  : "串揚げ"
  tempura        : "天ぷら|てんぷら|天麩羅|テンプラ"
  okonomi        : "お好み焼き"
  monja          : "もんじゃ"
  syabusyabu     : "しゃぶしゃぶ"
  okinawa        : "沖縄"
  western        : "洋食|西洋"
  french         : "フレンチ|フランス料理"
  italian        : "イタリアン|イタリア料理"
  spanish        : "スパニッシュ|スペイン料理"
  pasta          : "パスタ"
  pizza          : "ピザ|ピッツア"
  steak          : "ステーキ"
  hamburg_steak  : "ハンバーグ"
  hamburger      : "ハンバーガー"
  chinese        : "中華"
  dumpling       : "ギョウザ|ぎょうざ|餃子"
  korean         : "韓国"
  thai           : "タイ"
  ramen          : "拉麺|ラーメン"
  carry          : "カレー"
  grilled_meat   : "焼肉"
  organ          : "ホルモン"
  nabe           : "鍋"
  motsu_nabe     : "もつ鍋"
}

TARGET_TARGET = ["category"]
TARGET_LUNCH = ["category", "japanese", "sushi", "fish"]
TARGET_DINNER = ["category", "soba", "udon", "eel"]
TARGET_CAFE = ["category", "grilled_chiken", "fried_pork", "spit_roasting"]
TARGET_PARTY = ["category", "tempura", "okonomi", "monja"]
TARGET_ENTERTAINMENT = ["category", "syabusyabu", "okinawa", "western"]
