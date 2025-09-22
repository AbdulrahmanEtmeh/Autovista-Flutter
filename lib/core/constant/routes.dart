import 'package:get/get.dart';

import 'package:graduation_project/core/constant/app_routes.dart';
import 'package:graduation_project/view/screen/auth/forgetPassword/email_verification_screen.dart';
import 'package:graduation_project/view/screen/auth/forgetPassword/forget_password_screen.dart';
import 'package:graduation_project/view/screen/auth/forgetPassword/reset_password_screen.dart';
import 'package:graduation_project/view/screen/auth/forgetPassword/success_reset_password_screen.dart';
import 'package:graduation_project/view/screen/auth/login_screen.dart';
import 'package:graduation_project/view/screen/auth/register_check_email_screen.dart';
import 'package:graduation_project/view/screen/auth/register_screen.dart';
import 'package:graduation_project/view/screen/auth/success_register_screen.dart';
import 'package:graduation_project/view/screen/brands_screen.dart';
import 'package:graduation_project/view/screen/carDetails/car_details_screen.dart';
import 'package:graduation_project/view/screen/car_parts/car_parts_brands.dart';
import 'package:graduation_project/view/screen/car_parts/car_parts_categories.dart';
import 'package:graduation_project/view/screen/car_parts/car_parts_products.dart';
import 'package:graduation_project/view/screen/cart_screen.dart';
import 'package:graduation_project/view/screen/categories_screen.dart';
import 'package:graduation_project/view/screen/chat/chat_screen.dart';
import 'package:graduation_project/view/screen/favorite_screen.dart';
import 'package:graduation_project/view/screen/home/home_screen.dart';
import 'package:graduation_project/view/screen/on_boarding_screen.dart';
import 'package:graduation_project/view/screen/payment_screen.dart';
import 'package:graduation_project/view/screen/pricePrediction/price_prediction_screen.dart';
import 'package:graduation_project/view/screen/search/search_screen.dart';
import 'package:graduation_project/view/screen/settings/add_car_screen.dart';
import 'package:graduation_project/view/screen/settings/my_cars_screen.dart';
import 'package:graduation_project/view/screen/settings/settings_screen.dart';
import 'package:graduation_project/view/screen/search/filter_screen.dart';

import '../../view/screen/search/filter_results_screen.dart';
import '../middleware/my_middleware.dart';
import '../../view/screen/language_screen.dart';
import '../../view/screen/settings/account_settings_screen.dart';

List<GetPage> routes = [
  // GetPage(
  //   name: '/',
  //   page: () => const AddCarScreen(),
  // ),
  // Language
  GetPage(
    name: '/',
    page: () => const LanguageScreen(),
    middlewares: [
      MyMiddleware(),
    ],
  ),
  // OnBoarding
  GetPage(
    name: AppRoutes.onBoarding,
    page: () => const OnBoardingScreen(),
  ),
  // Authentication
  GetPage(
    name: AppRoutes.login,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: AppRoutes.register,
    page: () => const RegisterScreen(),
  ),
  GetPage(
    name: AppRoutes.forgetPassword,
    page: () => const ForgetPasswordScreen(),
  ),
  GetPage(
    name: AppRoutes.emailVerification,
    page: () => const EmailVerificationScreen(),
  ),
  GetPage(
    name: AppRoutes.resetPassword,
    page: () => const ResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoutes.successResetPassword,
    page: () => const SuccessResetPasswordScreen(),
  ),
  GetPage(
    name: AppRoutes.successRegister,
    page: () => const SuccessRegisterScreen(),
  ),
  GetPage(
    name: AppRoutes.registerCheckEmail,
    page: () => const RegisterCheckEmailScreen(),
  ),
  // Home
  GetPage(
    name: AppRoutes.home,
    page: () => const HomeScreen(),
  ),
  // Categories
  GetPage(
    name: AppRoutes.categories,
    page: () => const CategoriesScreen(),
  ),
  // Brands
  GetPage(
    name: AppRoutes.brands,
    page: () => const BrandsScreen(),
  ),
  // Car Details
  GetPage(
    name: AppRoutes.carDetails,
    page: () => const CarDetailsScreen(),
  ),
  // Favorite
  GetPage(
    name: AppRoutes.favorite,
    page: () => const FavoriteScreen(),
  ),
  // Settings
  GetPage(
    name: AppRoutes.settings,
    page: () => const SettingsScreen(),
  ),
  GetPage(
    name: AppRoutes.accountSettings,
    page: () => const AccountSettingsScreen(),
  ),
  GetPage(
    name: AppRoutes.myCars,
    page: () => const MyCarsScreen(),
  ),
  GetPage(
    name: AppRoutes.addCar,
    page: () => const AddCarScreen(),
  ),
  //Car Parts
  GetPage(
    name: AppRoutes.carPartsBrands,
    page: () => const CarPartsBrands(),
  ),
  GetPage(
    name: AppRoutes.carPartsCategories,
    page: () => const CarPartsCategories(),
  ),
  GetPage(
    name: AppRoutes.carPartsItems,
    page: () => const CarPartsProducts(),
  ),
  // Cart
  GetPage(
    name: AppRoutes.cart,
    page: () => const CartScreen(),
  ),
  // Price Prediction
  GetPage(
    name: AppRoutes.pricePrediction,
    page: () => const PricePredictionScreen(),
  ),
  // Payment
  GetPage(
    name: AppRoutes.payment,
    page: () => const PaymentScreen(),
  ),
  // Search & Filter
  GetPage(
    name: AppRoutes.search,
    page: () => const SearchScreen(),
  ),
  GetPage(
    name: AppRoutes.filter,
    page: () => const FilterScreen(),
  ),
  GetPage(
    name: AppRoutes.filterResult,
    page: () => const FilterResultsScreen(),
  ),
  // Chat
  GetPage(
    name: AppRoutes.chat,
    page: () => const ChatScreen(),
  ),
];
