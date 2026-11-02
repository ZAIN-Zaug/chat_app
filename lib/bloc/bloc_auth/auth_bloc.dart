import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/bloc/bloc_auth/auth_event.dart';
import 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  AuthBloc() : super(AuthDefault()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());

        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.email, password: event.password);

          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFailure(message: 'No user found for that email.'));
          } else if (e.code == 'wrong-password') {
            emit(LoginFailure(
                message: 'Wrong password provided for that user.'));
          } else {
            // IMPORTANT: Handle the code you are getting in the console!
            emit(LoginFailure(message: "Authentication failed"));
          }
        } catch (e) {
          emit(LoginFailure(message: "something went wrong"));
        }
      } else if (event is RegisterEvent) {
        emit(RegisterLoading());

        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: event.email, password: event.password);

          emit(RegisterSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            emit(RegisterFailure('The password provided is too weak.'));
          } else if (e.code == 'email-already-in-use') {
            emit(RegisterFailure('The account already exists for that email.'));
          } else {
            emit(LoginFailure(message: "Authentication failed"));
          }
        } catch (e) {
          emit(RegisterFailure(e.toString()));
        }
      }
    });
  }

}

