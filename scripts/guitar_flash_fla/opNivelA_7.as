package guitar_flash_fla
{
   import flash.display.MovieClip;
   
   public dynamic class opNivelA_7 extends MovieClip
   {
       
      
      public var n1:btEscNivel;
      
      public var n2:btEscNivel;
      
      public var n3:btEscNivel;
      
      public var n4:btEscNivel;
      
      public function opNivelA_7()
      {
         super();
         addFrameScript(0,frame1,20,frame21,42,frame43);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame21() : *
      {
         stop();
      }
      
      function frame43() : *
      {
         stop();
         if(dGlobal.teclasReset == true)
         {
            root["teclas"].gotoAndPlay(2);
         }
         else
         {
            MovieClip(root).nextFrame();
         }
      }
   }
}
