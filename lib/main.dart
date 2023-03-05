import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackaton_msb/core/bottom_nav_bar.dart';
import 'package:hackaton_msb/features/auth/presentation/widgets/login_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hackaton_msb/features/dashboard_feature/presentation/bloc/dashboard_bloc/dashboard_bloc.dart';

import 'features/dashboard_feature/presentation/widgets/dashboard_widget.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(375, 812), scaleByHeight: true, minTextAdapt: true);

    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => di.sl<DashboardBloc>())],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: BottomNavBar()));
  }
}
