package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class prop3 extends MovieClip
   {
       
      
      public function prop3()
      {
         super();
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,clique);
         this.addEventListener(MouseEvent.MOUSE_OVER,sobre);
         this.addEventListener(MouseEvent.MOUSE_OUT,fora);
      }
      
      private function clique(param1:MouseEvent) : void
      {
         navigateToURL(new URLRequest("http://www.orkut.com.br/Main#Application?appId=1065130086523"),"_blank");
      }
      
      private function sobre(param1:MouseEvent) : void
      {
      }
      
      private function fora(param1:MouseEvent) : void
      {
      }
   }
}
