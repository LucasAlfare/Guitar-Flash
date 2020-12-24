package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class btErro extends MovieClip
   {
       
      
      private var intervalo:Number;
      
      public function btErro()
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
         intervalo = setInterval(tempo,1500);
         root["gravaPts"].visible = true;
         root["gravaPts"].gotoAndPlay(2);
         root["mPause"].alpha = 0;
         root["mPause"].gotoAndStop(1);
         root["vcEstatisticas"].visible = true;
      }
      
      private function sobre(param1:MouseEvent) : void
      {
         gotoAndStop(2);
      }
      
      private function fora(param1:MouseEvent) : void
      {
         gotoAndStop(1);
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         ptsGeraErro();
      }
      
      private function securityErrorHandler(param1:SecurityErrorEvent) : void
      {
         ptsGeraErro();
      }
      
      function tempo() : *
      {
         if(dGlobal.ptsGeraVar[0] == "2")
         {
            pontosGera();
         }
         else if(dGlobal.ptsGeraVar[0] == "1")
         {
            pontosGeraF();
         }
         clearInterval(intervalo);
      }
      
      private function ptsGeraErro() : *
      {
         root["gravaPts"].visible = false;
         root["gravaPts"].gotoAndPlay(1);
         root["mPause"].gotoAndStop(4);
         root["vcEstatisticas"].visible = false;
         root["mPause"].alpha = 1;
      }
      
      private function pontosGera() : *
      {
         var url:String = dGlobal.ptsGeraVar[1];
         var request:URLRequest = new URLRequest(url);
         var variavel:URLVariables = new URLVariables();
         variavel.mus = dGlobal.ptsGeraVar[2];
         variavel.vl = dGlobal.ptsGeraVar[3];
         variavel.pts = dGlobal.ptsGeraVar[4];
         variavel.ptsXP = dGlobal.ptsGeraVar[5];
         variavel.modo = dGlobal.ptsGeraVar[6];
         variavel.cripto = dGlobal.ptsGeraVar[7];
         variavel.acertadas = dGlobal.ptsGeraVar[8];
         variavel.perdidas = dGlobal.ptsGeraVar[9];
         variavel.erradas = dGlobal.ptsGeraVar[10];
         variavel.combo = dGlobal.ptsGeraVar[11];
         variavel.acertadasSPa = dGlobal.ptsGeraVar[12];
         variavel.acertadasSP = dGlobal.ptsGeraVar[13];
         variavel.idDuelo = dGlobal.ptsGeraVar[14];
         variavel.idVoce = dGlobal.ptsGeraVar[15];
         variavel.idAmigo = dGlobal.ptsGeraVar[16];
         variavel.dificuldade = dGlobal.ptsGeraVar[17];
         variavel.spUsado = dGlobal.ptsGeraVar[18];
         variavel.rastros = dGlobal.ptsGeraVar[19];
         variavel.dueloQ = dGlobal.ptsGeraVar[20];
         variavel.best = dGlobal.ptsGeraVar[21];
         variavel.porcentagem = dGlobal.ptsGeraVar[22];
         request.data = variavel;
         request.method = URLRequestMethod.POST;
         var loader:URLLoader = new URLLoader();
         addListeners(loader);
         try
         {
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorHandler);
            loader.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
            loader.load(request);
            return;
         }
         catch(error:ArgumentError)
         {
            ptsGeraErro();
            return;
         }
         catch(error:SecurityError)
         {
            ptsGeraErro();
            return;
         }
         catch(error:TypeError)
         {
            ptsGeraErro();
            return;
         }
      }
      
      private function pontosGeraF() : *
      {
         var urlD:String = dGlobal.ptsGeraVar[1];
         var request:URLRequest = new URLRequest(urlD);
         var variavelD:URLVariables = new URLVariables();
         variavelD.mus = dGlobal.ptsGeraVar[2];
         variavelD.vl = dGlobal.ptsGeraVar[3];
         variavelD.pts = dGlobal.ptsGeraVar[4];
         variavelD.idDuelo = dGlobal.ptsGeraVar[5];
         variavelD.idVoce = dGlobal.ptsGeraVar[6];
         variavelD.idAmigo = dGlobal.ptsGeraVar[7];
         variavelD.dificuldade = dGlobal.ptsGeraVar[8];
         variavelD.dueloQ = dGlobal.ptsGeraVar[9];
         variavelD.modo = dGlobal.ptsGeraVar[10];
         variavelD.cripto = dGlobal.ptsGeraVar[11];
         request.data = variavelD;
         request.method = URLRequestMethod.POST;
         var loaderD:URLLoader = new URLLoader();
         try
         {
            loaderD.load(request);
            return;
         }
         catch(error:ArgumentError)
         {
            root["mPause"].gotoAndStop(4);
            root["vcEstatisticas"].visible = false;
            return;
         }
         catch(error:SecurityError)
         {
            return;
         }
      }
      
      private function addListeners(param1:IEventDispatcher) : void
      {
         param1.addEventListener(Event.COMPLETE,completo);
      }
      
      private function completo(param1:Event) : void
      {
         root["gravaPts"].visible = false;
         root["gravaPts"].gotoAndPlay(1);
         if(dGlobal.debugb == false)
         {
            if(Number(dGlobal.ptsGeraVar[4]) > dGlobal.jogPtsMus)
            {
               dGlobal.jogPtsMus = Number(dGlobal.ptsGeraVar[4]);
               ExternalInterface.call("finalMus","5",dGlobal.ptsGeraVar[23],dGlobal.ptsGeraVar[24],dGlobal.ptsGeraVar[25],Number(dGlobal.ptsGeraVar[4]),Math.round(dGlobal.pontosXP),dGlobal.ptsGeraVar[26],dGlobal.ptsGeraVar[27],dGlobal.ptsGeraVar[28]);
            }
            else
            {
               ExternalInterface.call("finalMus","4",dGlobal.ptsGeraVar[23],dGlobal.ptsGeraVar[24],dGlobal.ptsGeraVar[25],Number(dGlobal.ptsGeraVar[4]),Math.round(dGlobal.pontosXP),dGlobal.ptsGeraVar[26],dGlobal.ptsGeraVar[27],dGlobal.ptsGeraVar[28]);
            }
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
