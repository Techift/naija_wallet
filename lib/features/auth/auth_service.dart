class AuthService{
 static bool isLoggedIn = false;

 static void login(){
   isLoggedIn = true;
 }

  static void register(){
    isLoggedIn = true;
  }

 static void logOut(){
   isLoggedIn = false;
 }
}
