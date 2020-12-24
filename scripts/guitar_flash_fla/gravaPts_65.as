package guitar_flash_fla
{
   import flash.display.MovieClip;
   
   public dynamic class gravaPts_65 extends MovieClip
   {
       
      
      public function gravaPts_65()
      {
         super();
         addFrameScript(0,frame1,6,frame7);
      }
      
      function frame1() : *
      {
         stop();
         this.visible = false;
      }
      
      function frame7() : *
      {
         gotoAndPlay(2);
      }
   }
}
