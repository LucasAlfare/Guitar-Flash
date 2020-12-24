package
{
   import flash.display.MovieClip;
   import flash.text.TextField;
   
   public dynamic class carMusica extends MovieClip
   {
       
      
      public var carregado:TextField;
      
      public var total:TextField;
      
      public var carregar:MovieClip;
      
      public var anima:MovieClip;
      
      public var dica:TextField;
      
      public function carMusica()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
