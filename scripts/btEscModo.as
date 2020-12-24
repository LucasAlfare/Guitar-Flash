package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class btEscModo extends MovieClip
   {
       
      
      public function btEscModo()
      {
         super();
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,clique);
         this.addEventListener(MouseEvent.MOUSE_OVER,sobre);
         this.addEventListener(MouseEvent.MOUSE_OUT,fora);
      }
      
      private function clique(param1:MouseEvent) : void
      {
         if(this.name == "op1")
         {
            dGlobal.palheta = false;
         }
         else if(this.name == "op2")
         {
            dGlobal.palheta = true;
         }
         if(dGlobal.debugb == false)
         {
         }
         this.buttonMode = false;
         root["palhetada"].play();
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
