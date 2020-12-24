package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class btEscNivel extends MovieClip
   {
       
      
      public function btEscNivel()
      {
         super();
         addFrameScript(0,frame1);
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,clique);
         this.addEventListener(MouseEvent.MOUSE_OVER,sobre);
         this.addEventListener(MouseEvent.MOUSE_OUT,fora);
      }
      
      private function clique(param1:MouseEvent) : void
      {
         if(this.name == "n1")
         {
            dGlobal.nivel = "a";
         }
         else if(this.name == "n2")
         {
            dGlobal.nivel = "b";
         }
         else if(this.name == "n3")
         {
            dGlobal.nivel = "c";
         }
         else if(this.name == "n4")
         {
            dGlobal.nivel = "d";
         }
         if(dGlobal.debugb == false)
         {
         }
         root["nivel"].play();
         this.removeEventListener(MouseEvent.MOUSE_OVER,sobre);
         this.removeEventListener(MouseEvent.MOUSE_OUT,fora);
         this.removeEventListener(MouseEvent.CLICK,clique);
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
   }
}
