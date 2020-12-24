package
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.net.URLRequest;
   import flash.utils.clearInterval;
   import flash.utils.getTimer;
   import flash.utils.setInterval;
   
   public class musicaSOM extends Sprite
   {
       
      
      private var song:SoundChannel;
      
      private var liberou:Boolean = false;
      
      private var bytest:Number;
      
      private var bytesc:Number;
      
      private var per:Number;
      
      private var tempo:Number;
      
      private var carRate:Number;
      
      private var intervalo:Number;
      
      private var soundFactory:Sound;
      
      private var carMus:MovieClip;
      
      private var tempRest:Number = 0;
      
      private var tempCar:Number = 0;
      
      private var animaAlfa:Boolean = false;
      
      public function musicaSOM(param1:Number, param2:String, param3:String)
      {
         soundFactory = new Sound();
         carMus = new carMusica();
         super();
         var _loc4_:URLRequest = new URLRequest(param2 + "musica" + param1 + param3);
         soundFactory.addEventListener(Event.COMPLETE,carregarCompleto);
         soundFactory.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);
         soundFactory.addEventListener(ProgressEvent.PROGRESS,carregarProgresso);
         soundFactory.load(_loc4_);
         som.m1G = soundFactory;
         addChild(carMus);
         this["carMus"].x = 0;
         this["carMus"].y = 150;
         this["carMus"].alpha = 0;
         addEventListener(Event.ENTER_FRAME,atualizar);
      }
      
      private function atualizar(param1:Event) : *
      {
         if(dGlobal.somDura == 0)
         {
            this["carMus"].total.text = dGlobal.xmlTotal;
            this["carMus"].carregado.text = dGlobal.xmlCar;
            this["carMus"].carregar.gotoAndStop(dGlobal.xmlPer);
            if(this["carMus"].alpha < 1)
            {
               this["carMus"].alpha = this["carMus"].alpha + 0.1;
            }
         }
         else if(liberou == true)
         {
            dGlobal.carregado = true;
            if(animaAlfa == false)
            {
               if(this["carMus"].alpha > 0)
               {
                  this["carMus"].alpha = this["carMus"].alpha - 0.1;
               }
               else
               {
                  animaAlfa = true;
               }
            }
            else
            {
               if(this["carMus"].alpha < 1)
               {
                  this["carMus"].alpha = this["carMus"].alpha + 0.1;
               }
               if(this["carMus"].currentFrame != 3)
               {
                  this["carMus"].gotoAndStop(3);
                  root["animaPista"].visible = true;
                  root["animaPista"].gotoAndPlay(2);
               }
               if(jogo.teclou == true)
               {
                  dGlobal.xmlLib = 0;
                  removeChild(this["carMus"]);
                  removeEventListener(Event.ENTER_FRAME,atualizar);
                  root["contRgr"].visible = true;
                  root["contRgr"].gotoAndStop(2);
                  intervalo = setInterval(tempoRgr,800);
               }
            }
         }
         else if(this["carMus"].currentFrame == 1)
         {
            this["carMus"].gotoAndStop(2);
         }
         else
         {
            if(this["carMus"].alpha < 1)
            {
               this["carMus"].alpha = this["carMus"].alpha + 0.1;
            }
            this["carMus"].total.text = bytest + " KB";
            this["carMus"].carregado.text = bytesc + " KB";
            this["carMus"].carregar.gotoAndStop(per);
            tempo = int(getTimer() / 1000);
            tempRest = Number((bytest - bytesc) / carRate);
            tempCar = Number(dGlobal.somDura * (bytesc * 100 / bytest) / 100);
            if(tempCar != 0 && isNaN(tempRest) == false && isNaN(tempCar) == false && tempRest != Infinity)
            {
               if(tempRest < tempCar)
               {
                  if(dGlobal.duelo == false && dGlobal.idDuelo == 0)
                  {
                     if(dGlobal.erroCar == false)
                     {
                        liberou = true;
                     }
                  }
               }
            }
         }
      }
      
      function tempoRgr() : *
      {
         if(root["contRgr"].currentFrame != 4)
         {
            root["contRgr"].gotoAndStop(root["contRgr"].currentFrame + 1);
         }
         else
         {
            dGlobal.somLiberado = true;
            root["contRgr"].gotoAndStop(1);
            root["contRgr"].visible = false;
            clearInterval(intervalo);
         }
      }
      
      private function carregarCompleto(param1:Event) : void
      {
         liberou = true;
      }
      
      private function ioErrorHandler(param1:Event) : void
      {
      }
      
      private function carregarProgresso(param1:ProgressEvent) : void
      {
         bytest = Math.round(param1.bytesTotal / 1024 * 100) / 100;
         bytesc = Math.round(param1.bytesLoaded / 1024 * 100) / 100;
         per = int(bytesc / bytest * 100);
         carRate = int(bytesc / tempo * 100) / 100;
      }
   }
}
