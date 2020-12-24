package guitar_flash_fla
{
   import flash.display.MovieClip;
   
   public dynamic class fogo_28 extends MovieClip
   {
       
      
      public function fogo_28()
      {
         super();
         addFrameScript(0,frame1,6,frame7,12,frame13,13,frame14);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame7() : *
      {
         gotoAndStop(1);
      }
      
      function frame13() : *
      {
         gotoAndPlay("seq");
      }
      
      function frame14() : *
      {
         gotoAndPlay("seq");
      }
   }
}
