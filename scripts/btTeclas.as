package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   
   public class btTeclas extends MovieClip
   {
       
      
      private var valor:String = "";
      
      public function btTeclas()
      {
         super();
         addFrameScript(0,frame1);
         this.alpha = 0.8;
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,clique);
         this.addEventListener(MouseEvent.MOUSE_OVER,sobre);
         this.addEventListener(MouseEvent.MOUSE_OUT,fora);
      }
      
      private function clique(param1:MouseEvent) : void
      {
         var _loc2_:* = 1;
         while(_loc2_ < 17)
         {
            valor = valor + ("-" + dGlobal["ltt" + _loc2_]);
            _loc2_++;
         }
         ExternalInterface.call("jogarConfig","teclas",valor);
         root["teclas"].play();
      }
      
      private function sobre(param1:MouseEvent) : void
      {
         this.alpha = 1;
      }
      
      private function fora(param1:MouseEvent) : void
      {
         this.alpha = 0.8;
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
