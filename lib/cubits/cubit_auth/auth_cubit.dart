// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// import 'auth_states.dart';
//
// class AuthCubit extends Cubit<AuthStates>{
//
//
//   AuthCubit() : super(AuthDefault());
//
//   Future<void> loginUser({required String email, required String password}) async {
//     emit(LoginLoading());
//
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//
//       emit(LoginSuccess());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         emit(LoginFailure('No user found for that email.'));
//       } else if (e.code == 'wrong-password') {
//         emit(LoginFailure('Wrong password provided for that user.'));
//       }
//     }catch (e){
//       emit(LoginFailure(e.toString()));
//     }
//   }
//
//
//
//   Future<void> registerUser({required String email, required String password}) async {
//     emit(RegisterLoading());
//
//     try {
//
//
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//
//
//       emit(RegisterSuccess());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         emit(RegisterFailure('The password provided is too weak.'));
//       } else if (e.code == 'email-already-in-use') {
//         emit(RegisterFailure('The account already exists for that email.'));
//       }
//     } catch (e) {
//       emit(RegisterFailure(e.toString()));
//     }
//
//   }
//
//
//
// }