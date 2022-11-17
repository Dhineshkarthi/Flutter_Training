import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'title': 'Welcome back!',
          'subtitle': 'Sign in to continue',
          'mobile_number': 'Mobile Number',
          'pass_word': 'Password',
          'change_password': 'Change Password ?',
          'button': 'Login',
          'account': "Don't have an account ?",
          'register': "Register here"
        },
        'ar': {
          'title': 'مرحبًا بعودتك!',
          'subtitle': 'تسجيل الدخول للمتابعة',
          'mobile_number': 'رقم الهاتف المحمول',
          'pass_word': 'كلمه السر',
          'change_password': 'غير كلمة السر ؟',
          'button': 'تسجيل الدخول',
          'account': "ليس لديك حساب؟",
          'register': "سجل هنا"
        }
      };
}
