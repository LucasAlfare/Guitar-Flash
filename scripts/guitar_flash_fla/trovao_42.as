package guitar_flash_fla
{
   import flash.display.MovieClip;
   
   public dynamic class trovao_42 extends MovieClip
   {
       
      
      public function trovao_42()
      {
         super();
         addFrameScript(0,frame1,7,frame8,8,frame9,10,frame11);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame8() : *
      {
         gotoAndStop(1);
      }
      
      function frame9() : *
      {
         stop();
      }
      
      function frame11() : *
      {
         gotoAndStop("parado");
      }
   }
}
