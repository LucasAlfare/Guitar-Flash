package guitar_flash_fla
{
   import flash.display.MovieClip;
   
   public dynamic class opPalhetarA_4 extends MovieClip
   {
       
      
      public var op1:btEscModo;
      
      public var opt2:MovieClip;
      
      public var op2:btEscModo;
      
      public var opt1:MovieClip;
      
      public function opPalhetarA_4()
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
         root["nivel"].play();
      }
   }
}
