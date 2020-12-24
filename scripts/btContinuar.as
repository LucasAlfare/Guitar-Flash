package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class btContinuar extends MovieClip
   {
       
      
      private var intervalo:Number;
      
      private var intervalo3:Number;
      
      public function btContinuar()
      {
         super();
         addFrameScript(0,frame1,2,frame3);
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,clique);
         this.addEventListener(MouseEvent.MOUSE_OVER,sobre);
         this.addEventListener(MouseEvent.MOUSE_OUT,fora);
      }
      
      private function clique(param1:MouseEvent) : void
      {
         if(dGlobal.mPause == true && dGlobal.travarPause2 == true)
         {
            intervalo = setInterval(tempo,3500);
            intervalo3 = setInterval(tempo3,10);
            root["mPause"].alpha = 1;
            dGlobal.mPause = false;
            this.buttonMode = false;
         }
      }
      
      private function sobre(param1:MouseEvent) : void
      {
         gotoAndStop(2);
      }
      
      private function fora(param1:MouseEvent) : void
      {
         gotoAndStop(1);
      }
      
      function tempo() : *
      {
         dGlobal.travarPause2 = false;
         clearInterval(intervalo);
      }
      
      function tempo3() : *
      {
         if(root["mPause"].alpha < 0.1)
         {
            root["mPause"].gotoAndStop(1);
            clearInterval(intervalo3);
         }
         else
         {
            root["mPause"].alpha = root["mPause"].alpha - 0.1;
         }
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame3() : *
      {
         stop();
      }
   }
}
