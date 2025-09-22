import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ar': {
          // ========================== Language Screen ===========================
          'lang title': 'اختر اللغة',
          'lang name ar': 'العربية',
          'lang name en': 'الإنجليزية',

          // ========================== OnBoarding Screens ============================
          'onBoarding_one_title': 'شراء وبيع',
          'onBoarding_one_subtitle':
              'احصل على سيارة أحلامك\nأو بع سيارتك القديمة.',
          'onBoarding_one_description':
              'استكشف مجموعتنا الواسعة من السيارات\nالمعروضة للبيع أو قم بإدراج سيارتك\nبكل سهولة.',
          'Features:': 'الخصائص:',
          'onBoarding_one_features_one': 'البحث عن السيارات',
          'onBoarding_one_features_two':
              'التصفية حسب العلامة التجارية،\n      الطراز، نطاق السعر،\n      إلخ.',
          'onBoarding_one_features_three': 'إدراج سيارة للبيع',
          'onBoarding_one_features_four': 'عرض القوائم',

          'onBoarding_two_title': 'تأجير',
          'onBoarding_two_subtitle': 'استأجر سيارة تناسب\nاحتياجاتك.',
          'onBoarding_two_description':
              'استأجر سيارة تناسب\nاحتياجاتك - سواء ليوم واحد أو شهر.',
          'onBoarding_two_features_one': 'البحث عن سيارات للإيجار',
          'onBoarding_two_features_two':
              'التصفية حسب العلامة التجارية،\n      الطراز، نطاق السعر،\n      إلخ.',
          'onBoarding_two_features_three': 'احجز سيارة للإيجار',

          'onBoarding_three_title': 'العناية',
          'onBoarding_three_subtitle':
              'دع سيارتك تحصل على\nالعناية التي تحتاجها',
          'onBoarding_three_description':
              'من التنظيف إلى الصيانة،\nاعتنِ بسيارتك مع خدماتنا.',
          'onBoarding_three_features_one': 'خدمات تنظيف السيارات',
          'onBoarding_three_features_two': 'خيارات الصيانة\n      والإصلاح',
          'onBoarding_three_features_three': 'احجز موعداً',

          'Get Started': 'ابدأ الآن',

          // ============================= Authintication Screens ===========================
          // Login
          'welocme_back': 'مرحباً بعودتك',
          'email': 'البريد الإلكتروني',
          'password': 'كلمة المرور',
          'Forget password ?': 'هل نسيت كلمة المرور؟',
          'Sign in': 'تسجيل الدخول',
          'dont have an account ?': '  ليس لديك حساب؟',
          'sign up': 'إنشاء حساب',

          // Register
          'Create Account': 'إنشاء حساب',
          'user name': 'اسم المستخدم',
          'confirm password': 'تأكيد كلمة المرور',
          'Register': 'تسجيل',
          'Already have an account?': 'لديك حساب بالفعل؟',
          'login': 'تسجيل الدخول',

          // Register Check Email
          'Email Verification': 'التحقق من البريد الإلكتروني',
          'Verify Email': 'تحقق من البريد الإلكتروني',
          'Please enter the digit code sent to': 'يرجى إدخال الرمز المرسل إلى',

          // Success Register
          'Congratulations': 'تهانينا',
          'Successfully registered': 'تم التسجيل بنجاح',
          'Go back to sing in': 'العودة إلى تسجيل الدخول',

          // Forget Password
          'Forget Password ?': 'نسيت كلمة المرور؟',
          'Please enter your Email to recive a verification code':
              'يرجى إدخال بريدك الإلكتروني لاستلام رمز التحقق',
          'Send Verfication Code': 'إرسال رمز التحقق',

          // Reset Password
          'Reset Password': 'إعادة تعيين كلمة المرور',
          'New Password': 'كلمة مرور جديدة',
          'Please enter your new password': 'يرجى إدخال كلمة المرور الجديدة',

          // Success Reset Password
          'Done !': 'تم!',
          'Your password is changed': 'تم تغيير كلمة المرور الخاصة بك',
        },
        'en': {
          // ========================== App Exit Alert ===========================
          'Alert': 'Alert',
          'Are you sure you want to close the app ?':
              'Are you sure you want to close the app?',
          'Yes': 'Yes',
          'Cancel': 'Cancel',
          // ========================== Language Screen ===========================
          'lang title': 'Choose Language',
          'lang name ar': 'Arabic',
          'lang name en': 'English',
          // ========================== OnBoarding Screens ============================
          'onBoarding_one_title': 'Buy & Sell',
          'onBoarding_one_subtitle':
              'Get Your Dream Car Or\nSell Your Old Car.',
          'onBoarding_one_description':
              'Explore our wide rangeof cars\nfor sale orlist your car\nfor sale with ease.',
          'Features:': 'Features:',
          'onBoarding_one_features_one': 'Search for cars',
          'onBoarding_one_features_two':
              'Filter by make,\n      model, price range,\n      etc.',
          'onBoarding_one_features_three': 'List a car for sale',
          'onBoarding_one_features_four': 'View listings',
          'onBoarding_two_title': 'Rent',
          'onBoarding_two_subtitle': 'Rent a car that meets\nyour needs.',
          'onBoarding_two_description':
              'Rent a car for your\nneeds - whether it is for\na day or a month.',

          'onBoarding_two_features_one': 'Search for rental cars',
          'onBoarding_two_features_two':
              'Filter by make,\n      model, price range,\n      etc.',
          'onBoarding_two_features_three': 'Book a rental',
          'onBoarding_three_title': 'Care',
          'onBoarding_three_subtitle': 'Let your car get the\ncare it needs',
          'onBoarding_three_description':
              'From cleaning to maintenance,\ntake care of your car with\nour services.',
          'onBoarding_three_features_one': 'Car cleaning services',
          'onBoarding_three_features_two':
              'Maintenance and\n      repair options',
          'onBoarding_three_features_three': 'Book appointments',
          'Get Started': 'Get Started',
          // ============================= Authintication Screens ===========================
          // Login
          'welocme_back': 'Welcome Back',
          'email': 'Email',
          'password': 'Password',
          'Forget password ?': 'Forget Password?',
          'Sign in': 'Sign In',
          'dont have an account ?': 'Don\'t have an account? ',
          'sign up': 'Sign Up',
          // Register
          'Create Account': 'Create Account',
          'user name': 'User Name',
          'confirm password': 'Confirm Password',
          'Register': 'Register',
          'Already have an account?': 'Already have an account? ',
          'login': 'Login',
          // Register Check Email
          'Email Verification': 'Email Verification',
          'Verify Email': 'Verify Email',
          'Please enter the digit code sent to':
              'Please enter the digit code sent to',
          // Success Register
          'Congratulations': 'Congratulations',
          'Successfully registered': 'Successfully registered',
          'Go back to sing in': 'Go back to sign in',
          // Forget Password
          'Forget Password ?': 'Forget Password ?',
          'Please enter your Email to recive a verification code':
              'Please enter your Email to receive a verification code',
          'Send Verfication Code': 'Send Verification Code',
          // Reset Password
          'Reset Password': 'Reset Password',
          'New Password': 'New Password',
          'Please enter your new password': 'Please enter your new password',
          // Success Reset Password
          'Done !': 'Done !',
          'Your password is changed': 'Your password is changed',
          // Auth Fail Alert
          'Warning': 'Warning',
          'Retry': 'Retry',
          // Bottom Navigation Bar
          'Home': 'Home',
          'Parts': 'Parts',
          'Search': 'Search',
          'Chat': 'Chat',
          // Drawer
          'Favorite': 'Favorite',
          'Notifications': 'Notifications',
          'Settings': 'Settings',
          'Invite Friends': 'Invite Friends',
          'Logout': 'Logout',
          // Home
          'Hello, ': 'Hello, ',
          'Today\'s Special': 'Today\'s Special',
          'Categories': 'Categories',
          'Brands': 'Brands',
          'Recommended For You': 'Recommended For You',
          'See Details': 'See Details',
          // Car Parts Items
          'Car Parts': 'Car Parts',
          'Choose Brand': 'Choose Brand',
          'Continue': 'Continue',
          // Car Parts Categories
          'Choose Category': 'Choose Category',
          // Car Parts Products
          'Price': 'Price:  ',
          'Part number:': 'Part number: ',
          'Category name:': 'Category name: ',
          'Fits:': 'Fits: ',
          'Year:': 'Year: ',
          // Search
          'Find your car ...': 'Find your car ...',
          'No results found': 'No results found',
          // Filtration
          'Buy': 'Buy',
          'Rent': 'Rent',
          'Car Brand': 'Car Brand',
          'Car Name': 'Car Name',
          'Transmission Type': 'Transmission Type',
          'Vehicle Style': 'Vehicle Style',
          'Capacity': 'Capacity',
          'Passengers': 'Passengers',
          'or more Passengers': 'or more Passengers',
          'Cylinders': 'Cylinders',
          'Reset': 'Reset',
        },
      };
}
