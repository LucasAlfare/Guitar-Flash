package guitar_flash_fla
{
   import flash.display.MovieClip;
   
   public dynamic class melhor_40 extends MovieClip
   {
       
      
      public function melhor_40()
      {
         super();
         addFrameScript(0,frame1,44,frame45);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame45() : *
      {
         this.visible = false;
         gotoAndStop(1);
      }
   }
}
