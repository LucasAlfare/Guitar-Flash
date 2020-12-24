package
{
   public class ltrEsp
   {
      
      public static var ltrT:String;
      
      public static var ltrV:Number;
       
      
      public function ltrEsp()
      {
         super();
      }
      
      public static function ltr(param1:Number) : String
      {
         return ltrVerif(param1);
      }
      
      public static function ltrVerif(param1:Number) : String
      {
         ltrV = param1;
         if(ltrV == 32)
         {
            ltrT = "Space";
         }
         else if(ltrV == 112)
         {
            ltrT = "F1";
         }
         else if(ltrV == 113)
         {
            ltrT = "F2";
         }
         else if(ltrV == 114)
         {
            ltrT = "F3";
         }
         else if(ltrV == 115)
         {
            ltrT = "F4";
         }
         else if(ltrV == 116)
         {
            ltrT = "F5";
         }
         else if(ltrV == 117)
         {
            ltrT = "F6";
         }
         else if(ltrV == 118)
         {
            ltrT = "F7";
         }
         else if(ltrV == 119)
         {
            ltrT = "F8";
         }
         else if(ltrV == 120)
         {
            ltrT = "F9";
         }
         else if(ltrV == 121)
         {
            ltrT = "F10";
         }
         else if(ltrV == 122)
         {
            ltrT = "F11";
         }
         else if(ltrV == 123)
         {
            ltrT = "F12";
         }
         else if(ltrV == 32)
         {
            ltrT = "SPACE";
         }
         else if(ltrV == 9)
         {
            ltrT = "TAB";
         }
         else if(ltrV == 16)
         {
            ltrT = "SHIFT";
         }
         else if(ltrV == 17)
         {
            ltrT = "CTRL";
         }
         else if(ltrV == 8)
         {
            ltrT = "BACKSPC";
         }
         else if(ltrV == 27)
         {
            ltrT = "ESC";
         }
         else if(ltrV == 33)
         {
            ltrT = "Pg UP";
         }
         else if(ltrV == 34)
         {
            ltrT = "Pg DOWN";
         }
         else if(ltrV == 35)
         {
            ltrT = "END";
         }
         else if(ltrV == 36)
         {
            ltrT = "HOME";
         }
         else if(ltrV == 37)
         {
            ltrT = "←";
         }
         else if(ltrV == 38)
         {
            ltrT = "↑";
         }
         else if(ltrV == 39)
         {
            ltrT = "→";
         }
         else if(ltrV == 40)
         {
            ltrT = "↓";
         }
         else if(ltrV == 45)
         {
            ltrT = "INSERT";
         }
         else if(ltrV == 46)
         {
            ltrT = "DELETE";
         }
         else if(ltrV == 144)
         {
            ltrT = "NUM LOCK";
         }
         else if(ltrV == 145)
         {
            ltrT = "SCR LOCK";
         }
         else if(ltrV == 13)
         {
            ltrT = "ENTER";
         }
         else
         {
            ltrT = String.fromCharCode(ltrV).toUpperCase();
         }
         return ltrT;
      }
   }
}
