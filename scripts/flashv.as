package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class flashv extends MovieClip
   {
       
      
      private var ligado:Boolean = true;
      
      public function flashv()
      {
         super();
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,clique);
         this.addEventListener(MouseEvent.MOUSE_OVER,sobre);
         this.addEventListener(MouseEvent.MOUSE_OUT,fora);
      }
      
      private function clique(param1:MouseEvent) : void
      {
         visible = false;
         navigateToURL(new URLRequest("http://www.adobe.com/go/getflashplayer_br"),"_blank");
      }
      
      private function sobre(param1:MouseEvent) : void
      {
         gotoAndStop(2);
      }
      
      private function fora(param1:MouseEvent) : void
      {
         gotoAndStop(1);
      }
   }
}
