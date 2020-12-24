package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public class btPMjogar extends MovieClip
   {
       
      
      public function btPMjogar()
      {
         super();
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,clique);
         this.addEventListener(MouseEvent.MOUSE_OVER,sobre);
         this.addEventListener(MouseEvent.MOUSE_OUT,fora);
      }
      
      private function clique(param1:MouseEvent) : void
      {
         ExternalInterface.call("jogarCmd","mus",dGlobal.pNumMus);
         this.removeEventListener(MouseEvent.MOUSE_OVER,sobre);
         this.removeEventListener(MouseEvent.MOUSE_OUT,fora);
         this.removeEventListener(MouseEvent.CLICK,clique);
      }
      
      private function sobre(param1:MouseEvent) : void
      {
         this.alpha = 1;
      }
      
      private function fora(param1:MouseEvent) : void
      {
         this.alpha = 0.8;
      }
   }
}
