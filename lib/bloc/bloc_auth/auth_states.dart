  class AuthStates {}
class AuthDefault extends AuthStates{}

class LoginLoading extends AuthStates{}
class LoginSuccess extends AuthStates{}

class LoginFailure extends AuthStates{
  String ? message ;
  LoginFailure({required this.message});
}




class RegisterLoading extends AuthStates{}
class RegisterSuccess extends AuthStates{}
class RegisterFailure extends AuthStates{
  String ? message ;
  RegisterFailure(this.message);
}

