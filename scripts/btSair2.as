package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public class btSair2 extends MovieClip
   {
       
      
      public function btSair2()
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
         ExternalInterface.call("opMusicas");
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
