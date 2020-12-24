package guitar_flash_fla
{
   import flash.display.MovieClip;
   
   public dynamic class mensagem_31 extends MovieClip
   {
       
      
      public var mensagem:MovieClip;
      
      public function mensagem_31()
      {
         super();
         addFrameScript(0,frame1,64,frame65);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame65() : *
      {
         gotoAndStop(1);
      }
   }
}
