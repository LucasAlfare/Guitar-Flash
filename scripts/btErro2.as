package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public class btErro2 extends MovieClip
   {
       
      
      private var intervalo:Number;
      
      public function btErro2()
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
         ExternalInterface.call("erroCar");
         root["mPause"].alpha = 0;
         root["mPause"].gotoAndStop(1);
         root["vcEstatisticas"].visible = true;
      }
      
      private function sobre(param1:MouseEvent) : void
      {
         gotoAndStop(2);
      }
      
      private function fora(param1:MouseEvent) : void
      {
         gotoAndStop(1);
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
