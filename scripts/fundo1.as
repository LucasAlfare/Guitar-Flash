package
{
   import flash.display.Loader;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   
   public class fundo1 extends Sprite
   {
       
      
      private var requisita:URLRequest;
      
      private var loader:Loader;
      
      private var requisita2:URLRequest;
      
      private var loader2:Loader;
      
      private var requisita3:URLRequest;
      
      private var loader3:Loader;
      
      private var requisita4:URLRequest;
      
      private var loader4:Loader;
      
      private var numero:uint = 9;
      
      private var jogo:Boolean = false;
      
      private var bastao:Shape;
      
      private var bastao2:Shape;
      
      public function fundo1()
      {
         loader = new Loader();
         loader2 = new Loader();
         loader3 = new Loader();
         loader4 = new Loader();
         bastao = new Shape();
         bastao2 = new Shape();
         super();
         requisita = new URLRequest(dGlobal.fundo);
         loader.load(requisita);
         loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
         loader.name = "fundo";
         addChild(loader);
         this.x = -61;
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
      }
   }
}
