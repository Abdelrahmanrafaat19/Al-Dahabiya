// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `buttonTitle`
  String get button_title {
    return Intl.message(
      'buttonTitle',
      name: 'button_title',
      desc: '',
      args: [],
    );
  }

  /// `Lets Sign You in`
  String get loginTitle {
    return Intl.message(
      'Lets Sign You in',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back, you have been missed!`
  String get loginSubTitle {
    return Intl.message(
      'Welcome back, you have been missed!',
      name: 'loginSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Phone Numher`
  String get phone {
    return Intl.message(
      'Phone Numher',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forget`
  String get forget {
    return Intl.message(
      'Forget',
      name: 'forget',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signin {
    return Intl.message(
      'Sign In',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message(
      'Sign Up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get signinQ {
    return Intl.message(
      'Don`t have an account?',
      name: 'signinQ',
      desc: '',
      args: [],
    );
  }

  /// `Getting Start`
  String get signuptitle {
    return Intl.message(
      'Getting Start',
      name: 'signuptitle',
      desc: '',
      args: [],
    );
  }

  /// `create an account to continued`
  String get signupsubtitle {
    return Intl.message(
      'create an account to continued',
      name: 'signupsubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get userName {
    return Intl.message(
      'Username',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get email {
    return Intl.message(
      'E-mail',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Governmet:`
  String get government {
    return Intl.message(
      'Governmet:',
      name: 'government',
      desc: '',
      args: [],
    );
  }

  /// `City:`
  String get city {
    return Intl.message(
      'City:',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Zone:`
  String get zone {
    return Intl.message(
      'Zone:',
      name: 'zone',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Select Your Location`
  String get selectLocation {
    return Intl.message(
      'Select Your Location',
      name: 'selectLocation',
      desc: '',
      args: [],
    );
  }

  /// `Are you have acount?`
  String get signUpQ {
    return Intl.message(
      'Are you have acount?',
      name: 'signUpQ',
      desc: '',
      args: [],
    );
  }

  /// `Enter your mobile phone`
  String get phoneHint {
    return Intl.message(
      'Enter your mobile phone',
      name: 'phoneHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your E-mail`
  String get emailHint {
    return Intl.message(
      'Enter your E-mail',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Username`
  String get usernameHint {
    return Intl.message(
      'Enter your Username',
      name: 'usernameHint',
      desc: '',
      args: [],
    );
  }

  /// `Choose`
  String get choose {
    return Intl.message(
      'Choose',
      name: 'choose',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Address`
  String get addressHint {
    return Intl.message(
      'Enter Your Address',
      name: 'addressHint',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter your password`
  String get passworderrorfield {
    return Intl.message(
      'Please Enter your password',
      name: 'passworderrorfield',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter your Phone Number`
  String get phonenumbererrorfield {
    return Intl.message(
      'Please Enter your Phone Number',
      name: 'phonenumbererrorfield',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter your User Name`
  String get usernameerrorfield {
    return Intl.message(
      'Please Enter your User Name',
      name: 'usernameerrorfield',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter your E-mail`
  String get emailerrorfield {
    return Intl.message(
      'Please Enter your E-mail',
      name: 'emailerrorfield',
      desc: '',
      args: [],
    );
  }

  /// `Please Choose Your Government`
  String get governmenterrorfield {
    return Intl.message(
      'Please Choose Your Government',
      name: 'governmenterrorfield',
      desc: '',
      args: [],
    );
  }

  /// `Please Choose Your city`
  String get cityerrorfield {
    return Intl.message(
      'Please Choose Your city',
      name: 'cityerrorfield',
      desc: '',
      args: [],
    );
  }

  /// `Please Choose Your Zone`
  String get zoneerrorfield {
    return Intl.message(
      'Please Choose Your Zone',
      name: 'zoneerrorfield',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Address`
  String get addresserrorfield {
    return Intl.message(
      'Please Enter Your Address',
      name: 'addresserrorfield',
      desc: '',
      args: [],
    );
  }

  /// `Location is Selected`
  String get selectlocationcomplete {
    return Intl.message(
      'Location is Selected',
      name: 'selectlocationcomplete',
      desc: '',
      args: [],
    );
  }

  /// `The Registration is Completed`
  String get signupsuccessatate {
    return Intl.message(
      'The Registration is Completed',
      name: 'signupsuccessatate',
      desc: '',
      args: [],
    );
  }

  /// `This Data Already Existing`
  String get signupfailurestate {
    return Intl.message(
      'This Data Already Existing',
      name: 'signupfailurestate',
      desc: '',
      args: [],
    );
  }

  /// `Must Be Select Your Location From Select Location's Button`
  String get selectlocationerror {
    return Intl.message(
      'Must Be Select Your Location From Select Location`s Button',
      name: 'selectlocationerror',
      desc: '',
      args: [],
    );
  }

  /// `The E-mail or Password is Error`
  String get loginfailurestate {
    return Intl.message(
      'The E-mail or Password is Error',
      name: 'loginfailurestate',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetpassword {
    return Intl.message(
      'Reset Password',
      name: 'resetpassword',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get order {
    return Intl.message(
      'Orders',
      name: 'order',
      desc: '',
      args: [],
    );
  }

  /// `Shopping`
  String get shopping {
    return Intl.message(
      'Shopping',
      name: 'shopping',
      desc: '',
      args: [],
    );
  }

  /// `My Points Balance`
  String get points {
    return Intl.message(
      'My Points Balance',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `Change The Password`
  String get changepassword {
    return Intl.message(
      'Change The Password',
      name: 'changepassword',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changelanguage {
    return Intl.message(
      'Change Language',
      name: 'changelanguage',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactus {
    return Intl.message(
      'Contact Us',
      name: 'contactus',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signout {
    return Intl.message(
      'Sign Out',
      name: 'signout',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get mycart {
    return Intl.message(
      'My Cart',
      name: 'mycart',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Productes`
  String get product {
    return Intl.message(
      'Productes',
      name: 'product',
      desc: '',
      args: [],
    );
  }

  /// `Totle`
  String get totle {
    return Intl.message(
      'Totle',
      name: 'totle',
      desc: '',
      args: [],
    );
  }

  /// `E.G`
  String get EG {
    return Intl.message(
      'E.G',
      name: 'EG',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editprofile {
    return Intl.message(
      'Edit Profile',
      name: 'editprofile',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstname {
    return Intl.message(
      'First Name',
      name: 'firstname',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastname {
    return Intl.message(
      'Last Name',
      name: 'lastname',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Today's Offer`
  String get offer {
    return Intl.message(
      'Today`s Offer',
      name: 'offer',
      desc: '',
      args: [],
    );
  }

  /// `Campanies and Brands`
  String get brand {
    return Intl.message(
      'Campanies and Brands',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `Sections`
  String get section {
    return Intl.message(
      'Sections',
      name: 'section',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get addtocart {
    return Intl.message(
      'Add To Cart',
      name: 'addtocart',
      desc: '',
      args: [],
    );
  }

  /// `All Offers`
  String get alloffers {
    return Intl.message(
      'All Offers',
      name: 'alloffers',
      desc: '',
      args: [],
    );
  }

  /// `Login Again`
  String get loginagain {
    return Intl.message(
      'Login Again',
      name: 'loginagain',
      desc: '',
      args: [],
    );
  }

  /// `The phone number field is required`
  String get phoneerror1 {
    return Intl.message(
      'The phone number field is required',
      name: 'phoneerror1',
      desc: '',
      args: [],
    );
  }

  /// `The phone number has already been taken`
  String get phoneerror2 {
    return Intl.message(
      'The phone number has already been taken',
      name: 'phoneerror2',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Message`
  String get messagehint {
    return Intl.message(
      'Enter Your Message',
      name: 'messagehint',
      desc: '',
      args: [],
    );
  }

  /// `Must Enter Your Message`
  String get messagefielderror {
    return Intl.message(
      'Must Enter Your Message',
      name: 'messagefielderror',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Arrange`
  String get arrange {
    return Intl.message(
      'Arrange',
      name: 'arrange',
      desc: '',
      args: [],
    );
  }

  /// `Highest Price`
  String get highprice {
    return Intl.message(
      'Highest Price',
      name: 'highprice',
      desc: '',
      args: [],
    );
  }

  /// `All Company`
  String get company {
    return Intl.message(
      'All Company',
      name: 'company',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message(
      'Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Order Number`
  String get ordernumber {
    return Intl.message(
      'Order Number',
      name: 'ordernumber',
      desc: '',
      args: [],
    );
  }

  /// `Order Status`
  String get orderstatus {
    return Intl.message(
      'Order Status',
      name: 'orderstatus',
      desc: '',
      args: [],
    );
  }

  /// `Order Detials`
  String get orderditals {
    return Intl.message(
      'Order Detials',
      name: 'orderditals',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Charges`
  String get shippingcharengs {
    return Intl.message(
      'Shipping Charges',
      name: 'shippingcharengs',
      desc: '',
      args: [],
    );
  }

  /// `Order Price`
  String get orderprice {
    return Intl.message(
      'Order Price',
      name: 'orderprice',
      desc: '',
      args: [],
    );
  }

  /// `Unit Price`
  String get unitprice {
    return Intl.message(
      'Unit Price',
      name: 'unitprice',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Order`
  String get cancelorder {
    return Intl.message(
      'Cancel Order',
      name: 'cancelorder',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentmethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentmethod',
      desc: '',
      args: [],
    );
  }

  /// `Payment when receiving`
  String get whenpayment {
    return Intl.message(
      'Payment when receiving',
      name: 'whenpayment',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Time`
  String get deliverytime {
    return Intl.message(
      'Delivery Time',
      name: 'deliverytime',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Promo Code`
  String get promocode {
    return Intl.message(
      'Promo Code',
      name: 'promocode',
      desc: '',
      args: [],
    );
  }

  /// `Order Now`
  String get ordernow {
    return Intl.message(
      'Order Now',
      name: 'ordernow',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
