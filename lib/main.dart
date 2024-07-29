

import 'package:com.classic.classicparts/Auth/new_password_screen.dart';
import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/Providers/language_provider.dart';
import 'package:com.classic.classicparts/Providers/methods_provider.dart';
import 'package:com.classic.classicparts/Providers/notification_provider.dart';
import 'package:com.classic.classicparts/Providers/order_provider.dart';
import 'package:com.classic.classicparts/Providers/theme_provider.dart';
import 'package:com.classic.classicparts/constants.dart';
import 'package:com.classic.classicparts/l10n/l10n.dart';
import 'package:com.classic.classicparts/payfast_section/payfast_method.dart';
import 'package:com.classic.classicparts/separateAppfiles/AddressSection/add_new_address.dart';
import 'package:com.classic.classicparts/separateAppfiles/AddressSection/all_address_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/CheckoutSection/place_order_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/FilterSection/filter_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/IslamSection/islamic_main_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/LoyalityPoints/loyality_point_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/MainBottomNavigationPage.dart';
import 'package:com.classic.classicparts/separateAppfiles/OrderSetion/order_tracking.dart';
import 'package:com.classic.classicparts/separateAppfiles/OrderSetion/ordertabs/order_tabs_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/OrderSetion/ordertabs/running_order_page.dart';
import 'package:com.classic.classicparts/separateAppfiles/QiblaFinder/prayer_calender.dart';
import 'package:com.classic.classicparts/separateAppfiles/QiblaFinder/qibla_finder.dart';
import 'package:com.classic.classicparts/separateAppfiles/SettingScreen.dart';
import 'package:com.classic.classicparts/separateAppfiles/SupportSection/contact_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/SupportSection/faq_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/TransactionScreens/cashtransfer_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/TransactionScreens/confirm_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/User/client_review_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/User/profile_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/WelcomeScreens/getstarted_page.dart';
import 'package:com.classic.classicparts/separateAppfiles/WelcomeScreens/registrationsuccess_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/cart_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/category_listing.dart';
import 'package:com.classic.classicparts/separateAppfiles/home_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/nework_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/notification_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/paymentscreen/paymentmethodscreen.dart';
import 'package:com.classic.classicparts/separateAppfiles/product_cash_listing.dart';
import 'package:com.classic.classicparts/separateAppfiles/product_detail_Screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/qr_scanner.dart';
import 'package:com.classic.classicparts/separateAppfiles/searchscreen.dart';
import 'package:com.classic.classicparts/separateAppfiles/test_page.dart';
import 'package:com.classic.classicparts/separateAppfiles/transaction_history_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/wishlist_screen.dart';
import 'package:com.classic.classicparts/startup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';

import 'Auth/forgot_password_screen.dart';
import 'Auth/login_screen.dart';
import 'Auth/otp_screen.dart';
import 'Auth/sign_up_Screen.dart';
import 'Auth/update_password_screen.dart';
import 'Providers/authrememberprovider.dart';
import 'Providers/cart_provider.dart';
import 'Providers/network_provider.dart';
import 'Providers/translation_provider.dart';
import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
ValueNotifier<BuildContext?> appContext = ValueNotifier<BuildContext?>(null);
 String? backgroundmsg;
void main() async {


  WidgetsFlutterBinding.ensureInitialized();

  /// Here, we initialize Firebase and pass in our generated
  /// Firebase option [DefaultFirebaseOptions.currentPlatform]
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  RemoteMessage? initialMessage =
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  ServiceLocator.setup();

  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider<RememberMeProvider>(create: (context) => RememberMeProvider(),),
        ChangeNotifierProvider<ApiProvider>(create: (context) => ApiProvider(),),
        ChangeNotifierProvider<LanguageProvider>(create: (context) => LanguageProvider(),),
        ChangeNotifierProvider<MethodsProvider>(create: (context) => MethodsProvider(context),),
        ChangeNotifierProvider<NotificationProvider>(create: (context) => NotificationProvider(),),
        ChangeNotifierProvider<CartProvider>(create: (context) => CartProvider()),
        ChangeNotifierProvider<NetworkProvider>(create: (context) => NetworkProvider()),
        ChangeNotifierProvider<AppNavigator>(create: (context) => AppNavigator()),
        ChangeNotifierProvider<OrderProvider>(create: (context) => OrderProvider()),
        ChangeNotifierProvider<TranslationProvider>(create: (context) => TranslationProvider()),
        ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider()),

      ],
      child: MyApp(initialMessage:initialMessage),

    ),
  );
}
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  RemoteMessage? initialMessage;
   MyApp({super.key,this.initialMessage});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   bool hasPermission = false;
@override
   Future getPermission() async {
     if (await Permission.location.serviceStatus.isEnabled) {
       var status = await Permission.location.status;
       if (status.isGranted) {
         hasPermission = true;
       } else {
         Permission.location.request().then((value) {
           setState(() {
             hasPermission = (value == PermissionStatus.granted);
           });
         });
       }
     }
   }
   @override
  void initState() {
     Provider.of<ThemeProvider>(context,listen: false).loadcolors();
     Provider.of<LanguageProvider>(context,listen: false).getlocal();

     //demo();
     //backgroundmsghandler(context);
     Provider.of<NotificationProvider>(context,listen: false).mainforgroundMethod(context);
     Provider.of<NotificationProvider>(context,listen: false).setupInteractedMessage(context);
    super.initState();
  }

  demo()
  async {
    try {
     await Provider.of<ApiProvider>(context, listen: false).getUserInfo(context);
    }catch(e)
    {

    }
  }
   void _exitApp() {
     Future.delayed(Duration.zero, () {
       SystemNavigator.pop();
     });
   }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    appContext.value = context;


    final remembermeprovider=Provider.of<RememberMeProvider>(context, listen: false);
    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        ///
        navigatorKey: Provider.of<AppNavigator>(context).navigatorKey,
        builder: (context, child) {
         // Provider.of<NotificationProvider>(context,listen: false).setupInteractedMessage();

          Provider.of<NetworkProvider>(context,listen: false).ConnectivityStatus();
          final appNavigator = Provider.of<AppNavigator>(context,listen: false);

          // Check network status and navigate accordingly
          if (!Provider.of<NetworkProvider>(context,listen: false).isConnected) {
            appNavigator.push(NetworkScreen());
            print("cccc${Provider.of<NetworkProvider>(context,listen: false).isConnected}");
          }

          return child!;

        },
        supportedLocales: L10n.all,
        locale : Provider.of<LanguageProvider>(context,listen: true).applocal,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

      home: //ProductCashListingScreen()// ScrollAnimationScreen()//LoginScreen()//UpdatePasswordScreen(token: "",)//NewPasswordScreen()//SignUpScreen()//MainBottomNavigationPage()//StartupPage()


      FutureBuilder<void>(
        future: remembermeprovider.loadRememberMe(),
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.done) {
            if(remembermeprovider.phoneNumber.isNotEmpty && remembermeprovider.authtoken.isNotEmpty )
              {
                print(" login${remembermeprovider.authtoken}phone${remembermeprovider.phoneNumber}username${remembermeprovider.userName}");


                return UpgradeAlert(
                   key: const Key("sc"),

                    child: MainBottomNavigationPage());  //FluidNavBarDemo();IslamicMainScreen();//

              }
            else{

              print("else login${remembermeprovider.authtoken}");

              return UpgradeAlert(
                  key: const Key("sc"),

                  child: LoginScreen());

            }
          }
          print("weweewdwew");



          // Show loading or splash screen while loading shared preferences
          return Scaffold(
            backgroundColor: CustomColor.WhiteColor,
            body: const Center(
              child: CircularProgressIndicator(),
            )
          ); // Implement your SplashScreen widget
        },
      )
    );

   ///FutureBuilder
      // FutureBuilder(
      //   builder: (context, snapshot) {
      //     if (hasPermission) {
      //       return   QiblahScreen();
      //     } else {
      //       return const Scaffold(
      //         backgroundColor: Color.fromARGB(255, 48, 48, 48),
      //       );
      //     }
      //   },
      //   future: getPermission(),
      // ));






     //PrayerTimesScreen()//OnRegisterationSuccess()//StartupPage()//QiblaDirectionFinderApp()//ContactUsScreen()//FAQScreen()//LoyalityPointScreen()//NotificationScreen()//CategoryScreen()//LoyalityPointScreen()//OrderTabScreen()//OrderTracking()//DeliveryAddressScreen()//SignUpScreen()//PlaceOrderScreen()//PaymentMethodScreen()//ClientReviewScreen()//CustomCard(userName: 'saa', ownerName: 'sdsads', phoneNumber: 'asdsad',)//CashTransactionScreen()//WishListScreen()//DashboardPage()//CategoryListingScreen()//CartScreen()//DashboardPage(),//ProductDetailBody()//SearchScreen()//RoundedContainerStack()//ForgotPasswordScreen()//SignUpScreen(),//LoginPage(),//CardBox()//ThirdPage(),//CardBox(),//FirstApiCall(),//const MyHomePage(title: 'Flutter Demo Home Page'),

  }
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
    'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: 'launch_background',
        ),
      ),
    );
  }
}


