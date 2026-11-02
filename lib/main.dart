
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/helper/bloc_observer.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/login_page.dart';
import 'package:scholar_chat/pages/resgister_page.dart';


import 'bloc/bloc_auth/auth_bloc.dart';
import 'cubits/cubit_chat/chat_cubit.dart';
import 'firebase_options.dart';

void main() async  {

  WidgetsFlutterBinding.ensureInitialized();

  try {

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {

    if (e.toString().contains('duplicate-app')) {
      print('Firebase already initialized safely. Continuing boot sequence...');
    } else {

      rethrow;
    }
  }

 Bloc.observer=Observe();

       runApp(const ScholarChat());



}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
         BlocProvider(create: (context)=> AuthBloc()),

         BlocProvider(create: (context)=> ChatCubit()..getMessages()),
       ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
         LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id : (context) => ChatPage()
        },
        initialRoute: LoginPage.id,
      ),
    );
  }
}
