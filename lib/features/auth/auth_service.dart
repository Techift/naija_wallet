class AuthService{
 static bool isLoggedIn = false;

 static void login(){
   isLoggedIn = true;
 }

 static void LogOut(){
   isLoggedIn = false;
 }
}