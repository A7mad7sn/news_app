String currentRegion = 'us';

String baseUrl =
    'https://newsapi.org/v2/top-headlines?apiKey=9904595b2aa749e99a5fd71eb7585926&country=$currentRegion';

final today = DateTime.now().subtract(const Duration(days: 1));
String _currentDate = '${today.year}-${today.month}-${today.day}';
    

String todaysNewsUrl =
    'https://newsapi.org/v2/everything?apiKey=9904595b2aa749e99a5fd71eb7585926&q=*&from=$_currentDate';

const String loadingScreen = '/';
const String mainScreen = '/main_screen';
const String detailsScreen = '/details_screen';
const String newsLinkScreen = "/news_link";

const List<String> allRegions = [
  'ae',
  'ar',
  'at',
  'au',
  'be',
  'bg',
  'br',
  'ca',
  'ch',
  'cn',
  'co',
  'cu',
  'cz',
  'de',
  'eg',
  'fr',
  'gb',
  'gr',
  'hk',
  'hu',
  'id',
  'ie',
  'in',
  'it',
  'jp',
  'kr',
  'lt',
  'lv',
  'ma',
  'mx',
  'my',
  'ng',
  'nl',
  'no',
  'nz',
  'ph',
  'pl',
  'pt',
  'ro',
  'rs',
  'ru',
  'sa',
  'se',
  'sg',
  'si',
  'sk',
  'th',
  'tr',
  'tw',
  'ua',
  'us',
  've',
  'za'
];
