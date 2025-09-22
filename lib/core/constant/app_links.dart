class AppLinks {
  // ======================= Server ==========================
  static const String serverOld = 'http://10.0.2.2:8000/api';
  static const String server = 'http://192.168.100.23:8001/api';
  // ======================= Images Links =====================
  static const String imageRootOld = 'http://10.0.2.2:8000';
  static const String imageRoot = 'http://192.168.100.23:8001';
  // ======================= Auth Links ========================
  static const String register = '$server/register';
  static const String login = '$server/login';
  static const String logout = '$server/logout';
  static const String registerCheckEmail = '$server/verify-code';
  // ======================= Firebase ========================
  static const String signInWithGoogle = '$server/firebase-login';
  static const String savaeFcmToken = '$server/fcm-token';
  // Forget Password Links
  static const String forgetPassword = '$server/forget-password';
  static const String resetPassword = '$server/reset-password';
  // ======================= Home Links ===========================
  static const String home = '$server/home';
  // ======================= Categories Links ======================
  static const String categories = '$server/styles';
  // ======================= Brands =============================
  static const String brands = '$server/brands';
  // ======================= Favorite ============================
  static const String favoriteAdd = '$server/favorites';
  static const String favoriteView = '$server/favorites';
  static const String deleteFromFavorite = '$server/favorites';
  // ====================== Car Parts ============================
  static const String carPartsBrands = '$server/brands';
  static const String carPartsCategories = '$server/parts/categories';
  static const String carPartsItems = '$server/parts/brands';
  // ====================== Cart ================================
  static const String cartAdd = '$server/cart';
  static const String cartRemove = '$server/cart';
  static const String cartView = '$server/cart';
  // ====================== Serach & Filter ==============================
  static const String filter = '$server/search';
  static const String homeSearch = '$server/home?search=';

  // Price Prediction
  // static const String flaskServer = 'http://10.0.2.2:3000';
  static const String pricePrediction = 'http://10.0.2.2:3000/predict';
}
