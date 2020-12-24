package guitar_flash_fla
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class animaJogar_72 extends MovieClip
   {
       
      
      public var tc5:TextField;
      
      public var tc1:TextField;
      
      public var tc2:TextField;
      
      public var tc3:TextField;
      
      public var tc4:TextField;
      
      public function animaJogar_72()
      {
         super();
         addFrameScript(0,frame1,122,frame123,123,frame124,247,frame248);
      }
      
      function frame1() : *
      {
         if(dGlobal.palheta == true)
         {
            gotoAndPlay("paleta");
         }
         else
         {
            this["tc1"].text = ltrEsp.ltr(dGlobal.ltt10);
            this["tc2"].text = ltrEsp.ltr(dGlobal.ltt11);
            this["tc3"].text = ltrEsp.ltr(dGlobal.ltt12);
            this["tc4"].text = ltrEsp.ltr(dGlobal.ltt13);
            this["tc5"].text = ltrEsp.ltr(dGlobal.ltt14);
         }
      }
      
      function frame123() : *
      {
         gotoAndPlay(2);
      }
      
      function frame124() : *
      {
         this["tc1"].text = ltrEsp.ltr(dGlobal.ltt1);
         this["tc2"].text = ltrEsp.ltr(dGlobal.ltt2);
         this["tc3"].text = ltrEsp.ltr(dGlobal.ltt3);
         this["tc4"].text = ltrEsp.ltr(dGlobal.ltt4);
         this["tc5"].text = ltrEsp.ltr(dGlobal.ltt5);
      }
      
      function frame248() : *
      {
         gotoAndPlay("paleta");
      }
   }
}
