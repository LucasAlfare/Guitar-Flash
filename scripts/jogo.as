package
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.external.ExternalInterface;
   import flash.geom.ColorTransform;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.getTimer;
   
   public class jogo extends Sprite
   {
      
      public static var teclou:Boolean = false;
      
      public static var multi:Number = 1;
      
      public static var vel:Number = 0;
      
      public static var mais:Number = 0;
       
      
      private var tirarSom:Boolean = false;
      
      private var tecla1:Boolean = false;
      
      private var tecla2:Boolean = false;
      
      private var tecla3:Boolean = false;
      
      private var tecla4:Boolean = false;
      
      private var tecla5:Boolean = false;
      
      private var tecla6:Boolean = false;
      
      private var tecla7:Boolean = false;
      
      private var qualidade:Boolean = false;
      
      private var musica:Sprite;
      
      private var musicaSom:Sprite;
      
      private var config:Boolean = false;
      
      private var tempo:Number = 0;
      
      private var tempoGuardar:Number = 0;
      
      private var tempoGuardarSP:Number = 0;
      
      private var contador:Number = 0;
      
      private var totalMus:Number = 3;
      
      private var contSeguro:Number = 0;
      
      private var contSeguro1:Number = 0;
      
      private var contSeguro2:Number = 0;
      
      private var contSeguro3:Number = 0;
      
      private var contSeguro4:Number = 0;
      
      private var contSeguro5:Number = 0;
      
      private var contSeguro6:Number = 0;
      
      private var paletou1:Boolean = false;
      
      private var paletou2:Boolean = false;
      
      private var inicio:Boolean = true;
      
      private var num:uint = 0;
      
      private var local:String = "";
      
      private var pontos:String = "0";
      
      private var i:int;
      
      private var j:int;
      
      private var tmp:Number = 0;
      
      private var tmp2:Number = 0;
      
      private var tempo2:Number = 0;
      
      private var tempoGuardar2:Number = 0;
      
      private var tempoGuardarSP2:Number = 0;
      
      private var contador2:Number = 0;
      
      private var musDuelo:Number = 0;
      
      public function jogo()
      {
         super();
         stage.addEventListener(KeyboardEvent.KEY_DOWN,tcEntra);
         stage.addEventListener(KeyboardEvent.KEY_UP,tcSai);
         addEventListener(Event.ENTER_FRAME,tcVerif);
         stage.showDefaultContextMenu = false;
      }
      
      private function tcEntra(param1:KeyboardEvent) : void
      {
         if(dGlobal.mPause == false && dGlobal.mEPause == false && dGlobal.travarPause == false && root["contRgr"].visible == false)
         {
            i = 1;
            while(i < 8)
            {
               if(param1.keyCode == dGlobal["lta" + i])
               {
                  if(root["paleta" + i].currentFrame > 1)
                  {
                     if(this["tecla" + i] == false)
                     {
                        if(i == 6 || i == 7)
                        {
                           if(dGlobal.palheta == true)
                           {
                              root["paleta" + i].gotoAndPlay(3);
                           }
                        }
                        else if(dGlobal.palheta == true)
                        {
                           root["paleta" + i].gotoAndStop(2);
                        }
                        else
                        {
                           root["paleta" + i].gotoAndPlay(3);
                        }
                     }
                  }
                  else if(i == 6 || i == 7)
                  {
                     if(dGlobal.palheta == true)
                     {
                        root["paleta" + i].gotoAndPlay(3);
                     }
                  }
                  else if(dGlobal.palheta == true)
                  {
                     dGlobal["fret" + i] = true;
                     root["paleta" + i].gotoAndStop(2);
                  }
                  else
                  {
                     root["paleta" + i].gotoAndPlay(3);
                  }
                  this["tecla" + i] = true;
               }
               i++;
            }
         }
         teclou = true;
      }
      
      private function tcSai(param1:KeyboardEvent) : void
      {
         contSeguro++;
         if(contSeguro > 40)
         {
            if(dGlobal.mPause == false && dGlobal.mEPause == false && dGlobal.travarPause == false && root["contRgr"].visible == false)
            {
               root["pontosGraf"].gotoAndStop(1);
               dGlobal.aCEmulti = 104;
               tirarSom = true;
            }
         }
         var _loc2_:* = 1;
         while(_loc2_ < 6)
         {
            if(this["contSeguro" + _loc2_] > 9 && root["fogo" + _loc2_].currentFrame == 1)
            {
               if(dGlobal.mPause == false && dGlobal.mEPause == false && dGlobal.travarPause == false && root["contRgr"].visible == false)
               {
                  root["pontosGraf"].gotoAndStop(1);
                  dGlobal.aCEmulti = 104;
                  tirarSom = true;
               }
            }
            _loc2_++;
         }
         if(dGlobal.especial == false && dGlobal.mEPause == false && dGlobal.travarPause == false)
         {
            if(param1.keyCode == dGlobal.lta9 && root["rockEspecial"].currentFrame != 1 && dGlobal.especialP > 19)
            {
               if(dGlobal.especialP < 21 && dGlobal.aCEsp == 188)
               {
                  dGlobal.aCEsp = 160;
                  root["rockEspecial"].gotoAndStop(48);
               }
               else if(dGlobal.especialP > 20 && dGlobal.especialP < 31 && dGlobal.aCEsp == 178)
               {
                  dGlobal.aCEsp = 164;
                  root["rockEspecial"].gotoAndStop(44);
               }
               else if(dGlobal.especialP > 30 && dGlobal.especialP < 41 && dGlobal.aCEsp == 168)
               {
                  dGlobal.aCEsp = 168;
                  root["rockEspecial"].gotoAndStop(40);
               }
               tmp = getTimer() / 1000;
               tmp2 = dGlobal.posicao;
               if(root["rockEspecial"].currentFrame > 39 && dGlobal.aCEsp < 169)
               {
                  if(root["trovao1"].currentFrame < 8)
                  {
                     root["especial"].gotoAndStop(2);
                  }
                  if(root["pontosGraf"].currentFrame < 32)
                  {
                     root["pontosGraf"].gotoAndStop(root["pontosGraf"].currentFrame + 31);
                     dGlobal.aCEmulti = dGlobal.aCEmulti - 31;
                  }
                  if(dGlobal.volGuitarra == 0.8)
                  {
                     dGlobal.vol = true;
                  }
                  dGlobal.contSP = 0;
                  dGlobal.especial = true;
                  root["fogo1"].transform.colorTransform = new ColorTransform(1,1,1,1,-255,-10,255,0);
                  root["fogo2"].transform.colorTransform = new ColorTransform(1,1,1,1,-255,-10,255,0);
                  root["fogo3"].transform.colorTransform = new ColorTransform(1,1,1,1,-255,-10,255,0);
                  root["fogo4"].transform.colorTransform = new ColorTransform(1,1,1,1,-255,-10,255,0);
                  root["fogo5"].transform.colorTransform = new ColorTransform(1,1,1,1,-255,-10,255,0);
               }
            }
         }
         if(dGlobal.travarPause == false)
         {
            _loc2_ = 1;
            while(_loc2_ < 8)
            {
               if(param1.keyCode == dGlobal["lta" + _loc2_])
               {
                  if(_loc2_ == 6 || _loc2_ == 7)
                  {
                     if(root["paleta" + _loc2_].currentFrame == 6)
                     {
                        this["tecla" + _loc2_] = false;
                        root["paleta" + _loc2_].gotoAndStop(1);
                     }
                  }
                  else
                  {
                     if(root["paleta" + _loc2_].currentFrame == 2 || root["paleta" + _loc2_].currentFrame == 6)
                     {
                        root["paleta" + _loc2_].gotoAndStop(1);
                     }
                     this["tecla" + _loc2_] = false;
                     this["contSeguro" + _loc2_]++;
                  }
               }
               _loc2_++;
            }
         }
         teclou = false;
      }
      
      private function tcVerif(param1:Event) : *
      {
         var _loc2_:* = undefined;
         if(dGlobal.palheta == true)
         {
            i = 1;
            while(i < 6)
            {
               if(root["paleta6"].currentFrame != 1 && root["paleta6"].currentFrame != 6)
               {
                  if(root["paleta" + i].currentFrame == 2 || root["paleta" + i].currentFrame == 6)
                  {
                     root["paleta" + i].gotoAndPlay(3);
                     paletou1 = true;
                  }
               }
               if(paletou1 == false)
               {
                  if(root["paleta7"].currentFrame != 1 && root["paleta7"].currentFrame != 6)
                  {
                     if(root["paleta" + i].currentFrame == 2 || root["paleta" + i].currentFrame == 6)
                     {
                        root["paleta" + i].gotoAndPlay(3);
                        paletou2 = true;
                     }
                  }
               }
               i++;
            }
            if(paletou1 == true)
            {
               if(dGlobal.palheta == true)
               {
                  root["paleta6"].gotoAndStop(6);
               }
               paletou1 = false;
            }
            if(paletou2 == true)
            {
               if(dGlobal.palheta == true)
               {
                  root["paleta7"].gotoAndStop(6);
               }
               paletou2 = false;
            }
         }
         if(dGlobal.travarPause == false)
         {
            i = 1;
            while(i < 7)
            {
               if(this["tecla" + i] == false && root["paleta" + i].currentFrame == 6)
               {
                  root["paleta" + i].gotoAndStop(1);
               }
               i++;
            }
         }
         tempo = getTimer() / 1000;
         if(dGlobal.especial == true)
         {
            if(tempo > tempoGuardarSP)
            {
               if(dGlobal.mPause == false)
               {
                  dGlobal.aCEsp--;
                  root["rockEspecial"].gotoAndStop(root["rockEspecial"].currentFrame + 1);
                  if(root["rockEspecial"].currentFrame == 56 || dGlobal.aCEsp == 152)
                  {
                     if(dGlobal.volGuitarra == 1)
                     {
                        dGlobal.vol = true;
                     }
                     dGlobal.especialP = 0;
                     dGlobal.aCEsp = 208;
                     root["rockEspecial"].gotoAndStop(1);
                     root["especial"].gotoAndStop(1);
                     dGlobal.especial = false;
                     tmp = 0;
                     root["fogo1"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                     root["fogo2"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                     root["fogo3"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                     root["fogo4"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                     root["fogo5"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                  }
               }
               tempoGuardarSP = getTimer() / 1000 + 1;
            }
            if(tempoGuardarSP - tempo > 2)
            {
               tempoGuardarSP = getTimer() / 1000 + 1;
            }
         }
         else
         {
            tempoGuardarSP = 0;
         }
         if(dGlobal.mPause == false && dGlobal.mEPause == false && dGlobal.travarPause == false && root["contRgr"].visible == false)
         {
            tempo2 = dGlobal.posicao;
            if(tempo2 != 0)
            {
               if(tempo2 < tempoGuardar2)
               {
                  contador2++;
               }
               else
               {
                  if(dGlobal.frameMus > 25 && contador2 > 25)
                  {
                     dGlobal.frameMusBloq = true;
                  }
                  else if(dGlobal.frameMusBloq == true)
                  {
                     dGlobal.frameMusBloq = false;
                  }
                  dGlobal.frameMus = contador2;
                  contador2 = 0;
                  tempoGuardar2 = dGlobal.posicao + 1;
               }
            }
            else
            {
               tempoGuardar2 = 0;
            }
         }
         if(tempo < tempoGuardar)
         {
            contador++;
         }
         else
         {
            contSeguro = 0;
            contSeguro1 = 0;
            contSeguro2 = 0;
            contSeguro3 = 0;
            contSeguro4 = 0;
            contSeguro5 = 0;
            if(contador > 24)
            {
               contador = 24;
            }
            contador = 0;
            tempoGuardar = getTimer() / 1000 + 1;
         }
         if(config == false)
         {
            stage.quality = "LOW";
            vel = 0;
            if(dGlobal.palheta == true)
            {
               dGlobal.lta1 = dGlobal.ltt1;
               dGlobal.lta2 = dGlobal.ltt2;
               dGlobal.lta3 = dGlobal.ltt3;
               dGlobal.lta4 = dGlobal.ltt4;
               dGlobal.lta5 = dGlobal.ltt5;
               dGlobal.lta6 = dGlobal.ltt6;
               dGlobal.lta7 = dGlobal.ltt7;
               dGlobal.lta8 = dGlobal.ltt8;
               dGlobal.lta9 = dGlobal.ltt9;
            }
            else
            {
               dGlobal.lta1 = dGlobal.ltt10;
               dGlobal.lta2 = dGlobal.ltt11;
               dGlobal.lta3 = dGlobal.ltt12;
               dGlobal.lta4 = dGlobal.ltt13;
               dGlobal.lta5 = dGlobal.ltt14;
               dGlobal.lta8 = dGlobal.ltt15;
               dGlobal.lta9 = dGlobal.ltt16;
            }
            config = true;
         }
         if(inicio == true && dGlobal.carregado == true)
         {
            if(dGlobal.duelo == true)
            {
               gerarDuelo(1);
            }
            else if(dGlobal.idDuelo != 0)
            {
               gerarDuelo(2);
            }
            inicio = false;
         }
         if(dGlobal.posicao > 0.1)
         {
            root["pontosMarq"].cm.text = root["vcEstatisticas"].estComboM.text;
         }
         pontos = dGlobal.pontosG.toString();
         if(dGlobal.pontosG < 10)
         {
            root["pontosMarq"].pontos1.text = pontos.slice(0,1);
         }
         else if(dGlobal.pontosG < 100)
         {
            root["pontosMarq"].pontos2.text = pontos.slice(0,1);
            root["pontosMarq"].pontos1.text = pontos.slice(1,2);
         }
         else if(dGlobal.pontosG < 1000)
         {
            root["pontosMarq"].pontos3.text = pontos.slice(0,1);
            root["pontosMarq"].pontos2.text = pontos.slice(1,2);
            root["pontosMarq"].pontos1.text = pontos.slice(2,3);
         }
         else if(dGlobal.pontosG < 10000)
         {
            root["pontosMarq"].pontos4.text = pontos.slice(0,1);
            root["pontosMarq"].pontos3.text = pontos.slice(1,2);
            root["pontosMarq"].pontos2.text = pontos.slice(2,3);
            root["pontosMarq"].pontos1.text = pontos.slice(3,4);
         }
         else if(dGlobal.pontosG < 100000)
         {
            root["pontosMarq"].pontos5.text = pontos.slice(0,1);
            root["pontosMarq"].pontos4.text = pontos.slice(1,2);
            root["pontosMarq"].pontos3.text = pontos.slice(2,3);
            root["pontosMarq"].pontos2.text = pontos.slice(3,4);
            root["pontosMarq"].pontos1.text = pontos.slice(4,5);
         }
         else
         {
            root["pontosMarq"].pontos1.text = pontos.slice(0,1);
            root["pontosMarq"].pontos2.text = pontos.slice(1,2);
            root["pontosMarq"].pontos3.text = pontos.slice(2,3);
            root["pontosMarq"].pontos4.text = pontos.slice(3,4);
            root["pontosMarq"].pontos5.text = pontos.slice(4,5);
            root["pontosMarq"].pontos6.text = pontos.slice(5,6);
         }
         if(root["rockAcertos"].currentFrame < 61)
         {
            _loc2_ = 1;
            while(_loc2_ < 6)
            {
               if(this["tecla" + _loc2_] == true && root["paleta" + _loc2_].currentFrame == 6)
               {
                  root["paleta" + _loc2_].gotoAndStop(6);
               }
               _loc2_++;
            }
         }
         if(dGlobal.musicaNum != 0)
         {
            dGlobal.qmusica = dGlobal.musicaNum;
            dGlobal.musicaTocar = true;
            if(dGlobal.debugb == false)
            {
               local = "http://www.gamesx.com.br/jogos/orkut/guitar-flash/";
            }
            else
            {
               local = "dadosS/";
            }
            dGlobal.pontos = 0;
            dGlobal.pontos2 = 0;
            dGlobal.pontosG = 0;
            if(dGlobal.nivel == "d")
            {
               dGlobal.atrasoT = 1.625;
               dGlobal.atrasoTR = 1.65;
               vel = 0.36;
            }
            else if(dGlobal.nivel == "c")
            {
               dGlobal.atrasoT = 1.625;
               dGlobal.atrasoTR = 1.65;
               vel = 0.36;
            }
            else if(dGlobal.nivel == "b")
            {
               dGlobal.atrasoT = 1.9375;
               dGlobal.atrasoTR = 1.95;
               vel = 0.26;
            }
            else if(dGlobal.nivel == "a")
            {
               dGlobal.atrasoT = 2.25;
               dGlobal.atrasoTR = 2.25;
               vel = 0.2;
            }
            musica = new musicaXML(dGlobal.qmusica,dGlobal.nivel,local);
            musica.name = "musica";
            addChild(musica);
            musDuelo = dGlobal.musicaNum;
            dGlobal.musicaNum = 0;
         }
         _loc2_ = 1;
         while(_loc2_ < 6)
         {
            if(root["paleta" + _loc2_].currentFrame == 5 && root["fogo" + _loc2_].currentFrame == 1)
            {
               if(dGlobal.mPause == false && dGlobal.mEPause == false && dGlobal.travarPause == false && root["contRgr"].visible == false)
               {
                  tirarSom = true;
                  if(root["rockAcertos"].currentFrame > 2)
                  {
                     root["rockAcertos"].gotoAndStop(root["rockAcertos"].currentFrame - 1);
                  }
                  _loc2_ = 6;
               }
            }
            _loc2_++;
         }
         if(root["paleta6"].currentFrame == 7)
         {
            if(dGlobal.mPause == false && dGlobal.mEPause == false && dGlobal.travarPause == false && root["contRgr"].visible == false)
            {
               tirarSom = true;
            }
         }
         if(root["paleta7"].currentFrame == 7)
         {
            if(dGlobal.mPause == false && dGlobal.mEPause == false && dGlobal.travarPause == false && root["contRgr"].visible == false)
            {
               tirarSom = true;
            }
         }
         if(tirarSom == true)
         {
            if(dGlobal.semGuitarra == 0)
            {
               dGlobal.controle = true;
            }
            som.eB1 = true;
            root["pontosGraf"].gotoAndStop(1);
            dGlobal.aCEmulti = 104;
            if(dGlobal.posicao > 1.5)
            {
               root["vcEstatisticas"].estErradas.text = Number(root["vcEstatisticas"].estErradas.text) + 1;
               root["rockAcertos"].gotoAndStop(root["rockAcertos"].currentFrame - 1);
               if(Number(root["vcEstatisticas"].estComboM.text) > Number(root["vcEstatisticas"].estCombo.text))
               {
                  root["vcEstatisticas"].estCombo.text = Number(root["vcEstatisticas"].estComboM.text);
               }
               root["vcEstatisticas"].estComboM.text = 0;
            }
            tirarSom = false;
         }
      }
      
      function tempoSP() : *
      {
         dGlobal.especialP = 0;
         dGlobal.aCEsp = 208;
         root["rockEspecial"].gotoAndStop(1);
         root["especial"].gotoAndStop(1);
         dGlobal.especial = false;
         root["fogo1"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
         root["fogo2"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
         root["fogo3"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
         root["fogo4"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
         root["fogo5"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
      }
      
      private function gerarDuelo(param1:Number) : void
      {
         var url:String = null;
         var valor:Number = param1;
         if(valor == 1)
         {
            if(dGlobal.local == 0)
            {
               url = "http://67.23.231.84/guitar-flash/gerarDuelo.asp";
            }
            else if(dGlobal.local == 1)
            {
               url = "http://www.guitarflash.com.br/gerarDuelo.asp";
            }
            else if(dGlobal.local == 2)
            {
               url = "http://www.guitarflash.com.br/social/facebook/asp/gerarDuelo.asp";
            }
         }
         else if(valor == 2)
         {
            if(dGlobal.local == 0)
            {
               url = "http://67.23.231.84/guitar-flash/duelos.asp";
            }
            else if(dGlobal.local == 1)
            {
               url = "http://www.guitarflash.com.br/duelos.asp";
            }
            else if(dGlobal.local == 2)
            {
               url = "http://www.guitarflash.com.br/social/facebook/asp/duelos.asp";
            }
         }
         var request:URLRequest = new URLRequest(url);
         var variavel:URLVariables = new URLVariables();
         if(valor == 1)
         {
            variavel.funcao = "1";
            variavel.idAmigo = dGlobal.idAmigo;
            variavel.idVoce = dGlobal.idVoce;
            variavel.mus = musDuelo;
            variavel.dif = dGlobal.nivel;
         }
         else if(valor == 2)
         {
            variavel.funcao = "11";
            variavel.idDuelo = dGlobal.idDuelo;
            variavel.idDesaf = dGlobal.idVoce;
            variavel.mus = musDuelo;
            variavel.dif = dGlobal.nivel;
         }
         if(dGlobal.palheta == true)
         {
            variavel.modo = "1";
         }
         else
         {
            variavel.modo = "0";
         }
         request.data = variavel;
         request.method = URLRequestMethod.POST;
         var loader:URLLoader = new URLLoader();
         if(valor == 1)
         {
            addListeners(loader);
         }
         try
         {
            loader.load(request);
            return;
         }
         catch(error:ArgumentError)
         {
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
         var _loc2_:URLLoader = URLLoader(param1.target);
         var _loc3_:URLVariables = new URLVariables(_loc2_.data);
         dGlobal.idDuelo = _loc3_.idDuelo;
         ExternalInterface.call("dueloIniciado");
      }
   }
}
