package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public class btSair extends MovieClip
   {
       
      
      public function btSair()
      {
         super();
         addFrameScript(0,frame1,2,frame3);
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,clique);
         this.addEventListener(MouseEvent.MOUSE_OVER,sobre);
         this.addEventListener(MouseEvent.MOUSE_OUT,fora);
         if(dGlobal.idDuelo != 0)
         {
            this.buttonMode = false;
            this.gotoAndStop(3);
         }
      }
      
      private function clique(param1:MouseEvent) : void
      {
         if(dGlobal.idDuelo == 0)
         {
            ExternalInterface.call("opMusicas");
         }
      }
      
      private function sobre(param1:MouseEvent) : void
      {
         if(dGlobal.idDuelo == 0)
         {
            gotoAndStop(2);
         }
      }
      
      private function fora(param1:MouseEvent) : void
      {
         if(dGlobal.idDuelo == 0)
         {
            gotoAndStop(1);
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
