package
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.external.ExternalInterface;
   import flash.geom.ColorTransform;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.system.Capabilities;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class som extends Sprite
   {
      
      public static var m1G:Sound;
      
      public static var mB1:Boolean = true;
      
      public static var eB1:Boolean = false;
      
      public static var exB1:Boolean = false;
       
      
      private var posicaoN:Number = 0;
      
      private var pontos:Number = 0;
      
      private var voceBest:Number = 0;
      
      private var voceDuelo:Number = 0;
      
      private var tpDuelo:Number = 0;
      
      private var e1G:Sound;
      
      private var ex1G:Sound;
      
      private var musicaT:Sprite;
      
      private var rock:MovieClip;
      
      private var contador:Number = 0;
      
      private var porcento:Number = 0;
      
      private var mC1:SoundChannel;
      
      private var eC1:SoundChannel;
      
      private var exC1:SoundChannel;
      
      private var local:String = "";
      
      private var ext:String = "";
      
      private var versionString:String;
      
      private var pattern:RegExp;
      
      private var resulta:Object;
      
      private var versao:Number;
      
      private var intervalo:Number;
      
      private var intervalo2:Number;
      
      private var intervalo2a:Number;
      
      private var intervalo2b:Number;
      
      private var intervalo3:Number;
      
      private var intervalo4:Number;
      
      private var intervalo5:Number;
      
      private var intervalo6:Number;
      
      private var intervalo7:Number;
      
      private var bloqueado:Boolean = false;
      
      private var conquistas:String = "";
      
      private var conqObt:Array;
      
      private var conqObtS:String = "";
      
      private var i:int = 0;
      
      private var seg:Number = 0;
      
      private var estNivel1:Number = 0;
      
      private var estNivel2:Number = 0;
      
      private var estNivel3:Number = 0;
      
      private var estNivel:Number = 0;
      
      private var estNivelP:Number = 0;
      
      private var estNivelC:Number = 0;
      
      private var fc:Boolean = false;
      
      private var now:Date;
      
      private var tempoR1:Number = 0;
      
      private var tmpMilSeg:Number = 0;
      
      private var tmpMilSegAtual:Number = 0;
      
      private var tmpMilSegIni:Number = 0;
      
      private var tmpMilSegTrans:Number = 0;
      
      private var tmpMilSegTransV:Number = 0;
      
      private var tmpMilSegTransT:Number = 0;
      
      private var tmpSegTrans:Number = 0;
      
      private var tempoPos:Number = 0;
      
      private var tempoPos2:Number = 0;
      
      private var tempoPosArred:Number = 0;
      
      private var tempoPosArredD:Number = 0;
      
      private var tempoPosDiv:Number = 0;
      
      private var tmpPosCtrl:Number = 0;
      
      public function som()
      {
         e1G = new erro();
         ex1G = new explosao();
         musicaT = new Sprite();
         rock = new MovieClip();
         conqObt = new Array(7);
         now = new Date();
         super();
         addEventListener(Event.ENTER_FRAME,loop);
         versionString = Capabilities.version;
         pattern = /^(\w*) (\d*),(\d*),(\d*),(\d*)$/;
         resulta = pattern.exec(versionString);
         if(resulta != null)
         {
            versao = Number(resulta[2]);
            if(versao < 10)
            {
               root["flash9"].y = 0;
            }
            else
            {
               root["flash9"].visible = false;
            }
         }
         else
         {
            versao = 9;
         }
      }
      
      private function loop(param1:Event) : *
      {
         var tempo2:Function = null;
         var event:Event = param1;
         now = new Date();
         tmpMilSeg = now.getMilliseconds();
         if(tmpMilSegIni == 0)
         {
            tmpMilSegIni = tmpMilSeg;
         }
         else if(tmpMilSegIni == -1)
         {
            tmpMilSegIni = tmpMilSeg;
         }
         if(tmpMilSeg < tmpMilSegIni)
         {
            tmpMilSegTrans = 1000 - tmpMilSegIni + tmpMilSeg;
         }
         else
         {
            tmpMilSegTrans = tmpMilSeg - tmpMilSegIni;
         }
         if(tmpMilSegAtual > tmpMilSegTrans)
         {
            tmpMilSegTransV = tmpMilSegTrans + 1000 - tmpMilSegAtual;
         }
         else
         {
            tmpMilSegTransV = tmpMilSegTrans - tmpMilSegAtual;
         }
         if(dGlobal.musicaTocar == true)
         {
            if(dGlobal.debugb == false)
            {
               if(dGlobal.serv != "")
               {
                  local = dGlobal.serv;
               }
               else if(dGlobal.qmusica < 8)
               {
                  local = "http://67.23.231.84/guitar-flash/dados/";
               }
               else if(dGlobal.qmusica < 14)
               {
                  local = "http://66.7.217.35/gamesx3/";
               }
               else
               {
                  local = "http://www.gamesx.com.br/jogos/orkut/guitar-flash/dados/";
               }
            }
            else
            {
               local = "dados/";
            }
            ext = ".swf";
            ext = ".mp3";
            if(dGlobal.erroCar == true)
            {
               ext = ".swf?op=1";
            }
            local = "dados/";
            musicaT = new musicaSOM(dGlobal.qmusica,local,ext);
            musicaT.name = "musicaT";
            this.addChild(musicaT);
            dGlobal.musicaTocar = false;
         }
         if(dGlobal.somLiberado == true)
         {
            var tempo:Function = function():*
            {
               dGlobal.pontos = 0;
               dGlobal.pontos2 = 0;
               dGlobal.pontosG = 0;
               clearInterval(intervalo);
            };
            var tempo2b:Function = function():*
            {
               root["paleta1"].visible = false;
               root["paleta2"].visible = false;
               root["paleta3"].visible = false;
               root["paleta4"].visible = false;
               root["paleta5"].visible = false;
               root["pista"].visible = false;
               root["rockAcertos"].visible = false;
               root["rockEspecial"].visible = false;
               root["pontosGraf"].visible = false;
               root["pontosMarq"].visible = false;
               root["pontosMarq2"].visible = false;
               root["animaPista"].visible = true;
               root["animaPista"].play();
               if(Number(root["vcEstatisticas"].estComboM.text) > Number(root["vcEstatisticas"].estCombo.text))
               {
                  root["vcEstatisticas"].estCombo.text = Number(root["vcEstatisticas"].estComboM.text);
                  root["vcEstatisticas"].estComboM.text = 0;
               }
               root["vcEstatisticas"].estPontos.text = pontos;
               root["vcEstatisticas"].estEspecial.text = dGlobal.espP + " / " + dGlobal.espT;
               root["vcEstatisticas"].estPorcentagem.text = Math.floor(Number(root["vcEstatisticas"].estAcertadas.text) * 100 / (Number(root["vcEstatisticas"].estAcertadas.text) + Number(root["vcEstatisticas"].estPerdidas.text)));
               porcento = Number(root["vcEstatisticas"].estPorcentagem.text);
               root["vcEstatisticas"].estPorcentagem.text = root["vcEstatisticas"].estPorcentagem.text + " %";
               if(dGlobal.debugb == false && dGlobal.idVoce != 0)
               {
                  if(dGlobal.quantNotas + 2 > Number(root["vcEstatisticas"].estAcertadas.text) + Number(root["vcEstatisticas"].estPerdidas.text))
                  {
                  }
               }
               else if(dGlobal.idVoce == 0)
               {
                  intervalo7 = setInterval(jogAnonima,1000);
               }
               clearInterval(intervalo2b);
            };
            var tempo2a:Function = function():*
            {
               intervalo2 = setInterval(tempo2,5);
               root["vcEstatisticas"].alpha = 0;
               root["vcEstatisticas"].y = -10;
               dGlobal.somLiberado = false;
               root["paleta1"].gotoAndStop(1);
               root["paleta2"].gotoAndStop(1);
               root["paleta3"].gotoAndStop(1);
               root["paleta4"].gotoAndStop(1);
               root["paleta5"].gotoAndStop(1);
               intervalo5 = setInterval(animaXP,40);
               clearInterval(intervalo2a);
            };
            tempo2 = function():*
            {
               if(root["vcEstatisticas"].alpha > 0.9)
               {
                  clearInterval(intervalo2);
               }
               else
               {
                  root["vcEstatisticas"].alpha = root["vcEstatisticas"].alpha + 0.1;
               }
            };
            var tempo4:Function = function():*
            {
               if(root["mPause"].alpha > 0.9)
               {
                  clearInterval(intervalo4);
               }
               else
               {
                  root["mPause"].alpha = root["mPause"].alpha + 0.1;
               }
            };
            var tempo3:Function = function():*
            {
               if(dGlobal.reiniciar == true)
               {
                  dGlobal.posicao = 0;
                  tmpSegTrans = 0;
                  tmpMilSegTransT = 0;
               }
               if(root["contRgr"].currentFrame != 4)
               {
                  root["contRgr"].gotoAndStop(root["contRgr"].currentFrame + 1);
               }
               else
               {
                  bloqueado = false;
                  dGlobal.mEPause = false;
                  SOM2();
                  root["contRgr"].gotoAndStop(1);
                  root["contRgr"].visible = false;
                  dGlobal.reiniciar = false;
                  clearInterval(intervalo3);
               }
            };
            if(dGlobal.mPause == false)
            {
               if(contador > 1)
               {
                  if(bloqueado == false)
                  {
                     if(root["contRgr"].currentFrame == 1)
                     {
                        dGlobal.posicao = (mC1.position + posicaoN) / 1000;
                        root["vcEstatisticas"].visible = false;
                     }
                     if(dGlobal.posicao > tmpPosCtrl)
                     {
                        if(dGlobal.posicaoLib == false)
                        {
                           dGlobal.posicaoLib = true;
                        }
                        tmpMilSegTransT = tmpMilSegTransT + tmpMilSegTransV;
                        if(tmpMilSegTransT > 999)
                        {
                           tmpSegTrans++;
                           tmpMilSegTransT = tmpMilSegTransT - 1000;
                        }
                        if(tmpMilSegTransT < 100)
                        {
                           tempoPos = Number(tmpSegTrans + ".0" + tmpMilSegTransT);
                        }
                        else
                        {
                           tempoPos = Number(tmpSegTrans + "." + tmpMilSegTransT);
                        }
                        tempoPos2 = tempoPos;
                        tempoPos = tempoPos / 0.04166666;
                        if(tempoPosArred == Math.round(tempoPos) && Math.round(tempoPos) > 1)
                        {
                           if(tempoPos - tempoPosDiv > 0.5)
                           {
                              tempoPosArredD = Math.round(tempoPos) + 1;
                           }
                           else
                           {
                              tempoPosArredD = Math.round(tempoPos);
                           }
                        }
                        else
                        {
                           tempoPosArredD = Math.round(tempoPos);
                        }
                        tempoPosDiv = tempoPos;
                        tempoPosArred = Math.round(tempoPos);
                        tempoPos = tempoPosArredD;
                        tempoPos = tempoPos * 0.04166666;
                        tempoPos = tempoPos + 0.01;
                        dGlobal.posicaoRel = tempoPos;
                     }
                  }
               }
               else
               {
                  contador = 2;
                  root["fogo1"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                  root["fogo2"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                  root["fogo3"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                  root["fogo4"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                  root["fogo5"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
               }
               if(dGlobal.mDPause == true)
               {
                  if(dGlobal.reiniciar == true)
                  {
                     contador = 0;
                     dGlobal.mEPause = false;
                     dGlobal.travarPause2 = false;
                     mC1.stop();
                     root["rockAcertos"].gotoAndStop(30);
                     root["pontosGraf"].gotoAndStop(1);
                     dGlobal.aCEmulti = 104;
                     dGlobal.aCEsp = 208;
                     dGlobal.especialP = 0;
                     dGlobal.pontos = 0;
                     dGlobal.pontos2 = 0;
                     dGlobal.pontosG = 0;
                     root["pontosMarq"].pontos1.text = "";
                     root["pontosMarq"].pontos2.text = "";
                     root["pontosMarq"].pontos3.text = "";
                     root["pontosMarq"].pontos4.text = "";
                     root["pontosMarq"].pontos5.text = "";
                     root["pontosMarq"].pontos6.text = "";
                     root["fogo1"].gotoAndStop(1);
                     root["fogo2"].gotoAndStop(1);
                     root["fogo3"].gotoAndStop(1);
                     root["fogo4"].gotoAndStop(1);
                     root["fogo5"].gotoAndStop(1);
                     dGlobal.posicao = 0;
                     dGlobal.posicaoRel = 0;
                     tmpPosCtrl = 0;
                     root["fogo1"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                     root["fogo2"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                     root["fogo3"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                     root["fogo4"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                     root["fogo5"].transform.colorTransform = new ColorTransform(1,1,1,1,0,0,0,0);
                     tmpSegTrans = 0;
                     tmpMilSegTransT = 0;
                  }
                  root["contRgr"].visible = true;
                  root["contRgr"].gotoAndStop(2);
                  intervalo3 = setInterval(tempo3,800);
                  dGlobal.mDPause = false;
               }
            }
            else if(dGlobal.mDPause == false)
            {
               mC1.stop();
               tmpPosCtrl = dGlobal.posicao;
               dGlobal.posicaoLib = false;
               dGlobal.mDPause = true;
            }
            if(eB1 == true)
            {
               if(dGlobal.posicao > 1.5)
               {
                  ERRO();
               }
               eB1 = false;
            }
            if(exB1 == true)
            {
               EXPLOSAO();
               exB1 = false;
            }
            if(mB1 == true)
            {
               SOM1();
               mB1 = false;
            }
            if(dGlobal.controle == true)
            {
               if(dGlobal.semGuitarra == 1)
               {
                  dGlobal.semGuitarra = 0;
               }
               else
               {
                  dGlobal.semGuitarra = 1;
               }
               semGuitar();
               dGlobal.controle = false;
            }
            if(dGlobal.vol == true)
            {
               if(dGlobal.volGuitarra == 1)
               {
                  dGlobal.volGuitarra = 0.8;
               }
               else
               {
                  dGlobal.volGuitarra = 1;
               }
               volumeMus();
               dGlobal.vol = false;
            }
            if(root["rockAcertos"].currentFrame == 1)
            {
               contador = 0;
               bloqueado = true;
               posicaoN = 0;
               dGlobal.travarPause = true;
               if(dGlobal.erroCar == true)
               {
                  root["mPause"].gotoAndStop(5);
               }
               else
               {
                  root["mPause"].gotoAndStop(3);
               }
               root["mPause"].alpha = 0;
               dGlobal.mPause = false;
               if(dGlobal.idDuelo != 0 && isNaN(dGlobal.idDuelo) == false)
               {
                  intervalo5 = setInterval(falhaDuelo,1000);
               }
               dGlobal.pontos = 0;
               dGlobal.pontos2 = 0;
               dGlobal.pontosG = 0;
               root["rockAcertos"].gotoAndPlay(62);
               mC1.stop();
               intervalo4 = setInterval(tempo4,50);
            }
            if(dGlobal.rockVF == true)
            {
               rock = new vcRock();
               rock.name = "rock";
               root["vcEstatisticas"].visible = true;
               contador = 0;
               bloqueado = true;
               posicaoN = 0;
               if(Math.round(dGlobal.pontos + dGlobal.pontos2) - Math.round(dGlobal.pontosG) > 1 || Math.round(dGlobal.pontosG) - Math.round(dGlobal.pontos + dGlobal.pontos2) > 1)
               {
                  pontos = 0;
               }
               else
               {
                  pontos = Math.floor(dGlobal.pontos + dGlobal.pontos2);
               }
               addChild(rock);
               rock.x = 155;
               rock.y = 200;
               if(Math.floor(Number(root["vcEstatisticas"].estAcertadas.text) * 100 / (Number(root["vcEstatisticas"].estAcertadas.text) + Number(root["vcEstatisticas"].estPerdidas.text))) == 100 && Number(root["vcEstatisticas"].estErradas.text) == 0)
               {
                  this["rock"].classi.gotoAndStop(2);
               }
               dGlobal.rockVF = false;
               dGlobal.travarPause = true;
               root["rockAcertos"].gotoAndPlay(62);
               root["mPause"].gotoAndStop(1);
               dGlobal.mPause = false;
               if(dGlobal.idDuelo != 0 && isNaN(dGlobal.idDuelo) == false)
               {
                  root["vcEstatisticas"].duelo.estDnome1.text = dGlobal.nomeVoce;
                  root["vcEstatisticas"].duelo.estDpontos1.text = pontos;
                  root["vcEstatisticas"].duelo.estDnome2.text = dGlobal.nomeAmigo;
                  if(dGlobal.duelo == false)
                  {
                     root["vcEstatisticas"].duelo.estDpontos2.text = dGlobal.ptsAmigo;
                     if(pontos > dGlobal.ptsAmigo)
                     {
                        root["vcEstatisticas"].duelo.estDfrase.text = dGlobal.nomeVoce + " venceu o duelo!";
                     }
                     else if(pontos < dGlobal.ptsAmigo)
                     {
                        root["vcEstatisticas"].duelo.estDfrase.text = dGlobal.nomeAmigo + " venceu o duelo!";
                     }
                     else if(pontos == dGlobal.ptsAmigo)
                     {
                        root["vcEstatisticas"].duelo.estDfrase.text = "Duelo empatado!";
                     }
                  }
                  else
                  {
                     root["vcEstatisticas"].duelo.estDpontos2.text = "???";
                     root["vcEstatisticas"].duelo.estDfrase.text = "Desafio enviado para " + dGlobal.nomeAmigo + "!";
                  }
               }
               else
               {
                  root["vcEstatisticas"].duelo.gotoAndStop(1);
               }
               root["vcEstatisticas"].estPmusica.text = dGlobal.pNomeMus;
               intervalo2b = setInterval(tempo2b,4000);
               intervalo2a = setInterval(tempo2a,5000);
            }
         }
         tmpMilSegAtual = tmpMilSegTrans;
      }
      
      private function SOM1() : *
      {
         mC1 = m1G.play(0);
         dGlobal.travarPause = false;
         root["rockAcertos"].gotoAndStop(30);
         var _loc1_:SoundTransform = mC1.soundTransform;
         _loc1_.pan = dGlobal.semGuitarra;
         _loc1_.volume = 0.8;
         mC1.soundTransform = _loc1_;
         _loc1_.rightToLeft = 1;
         mC1.soundTransform = _loc1_;
      }
      
      private function SOM2() : *
      {
         if(dGlobal.posicao == 0)
         {
            root["rockAcertos"].gotoAndStop(30);
            root["rockAcertos"].gotoAndStop(30);
            root["pontosGraf"].gotoAndStop(1);
            dGlobal.aCEmulti = 104;
            dGlobal.aCEsp = 208;
            dGlobal.especialP = 0;
            dGlobal.pontos = 0;
            dGlobal.pontos2 = 0;
            dGlobal.pontosG = 0;
            root["pontosMarq"].pontos1.text = "";
            root["pontosMarq"].pontos2.text = "";
            root["pontosMarq"].pontos3.text = "";
            root["pontosMarq"].pontos4.text = "";
            root["pontosMarq"].pontos5.text = "";
            root["pontosMarq"].pontos6.text = "";
            root["fogo1"].gotoAndStop(1);
            root["fogo2"].gotoAndStop(1);
            root["fogo3"].gotoAndStop(1);
            root["fogo4"].gotoAndStop(1);
            root["fogo5"].gotoAndStop(1);
         }
         posicaoN = 0;
         mC1 = m1G.play(dGlobal.posicao * 1000);
         var _loc1_:SoundTransform = mC1.soundTransform;
         _loc1_.pan = dGlobal.semGuitarra;
         mC1.soundTransform = _loc1_;
         if(dGlobal.semGuitarra == 1)
         {
            _loc1_.rightToLeft = 1;
            mC1.soundTransform = _loc1_;
         }
         else
         {
            _loc1_.rightToLeft = 1;
            mC1.soundTransform = _loc1_;
            _loc1_.leftToRight = 1;
            mC1.soundTransform = _loc1_;
         }
      }
      
      private function ERRO() : *
      {
         eC1 = e1G.play();
      }
      
      private function EXPLOSAO() : *
      {
         exC1 = ex1G.play();
      }
      
      private function semGuitar() : *
      {
         var _loc1_:SoundTransform = mC1.soundTransform;
         _loc1_.pan = dGlobal.semGuitarra;
         mC1.soundTransform = _loc1_;
         if(dGlobal.semGuitarra == 1)
         {
            _loc1_.rightToLeft = 1;
            mC1.soundTransform = _loc1_;
         }
         else
         {
            _loc1_.rightToLeft = 1;
            mC1.soundTransform = _loc1_;
            _loc1_.leftToRight = 1;
            mC1.soundTransform = _loc1_;
         }
      }
      
      private function pontosGeraA(param1:*) : *
      {
         var num:* = param1;
         var urlA:String = "";
         if(dGlobal.local == 0)
         {
            urlA = "http://67.23.231.84/guitar-flash/ptsGeraA.asp";
         }
         else if(dGlobal.local == 1)
         {
            urlA = "http://www.guitarflash.com.br/ptsGeraA.asp";
         }
         else if(dGlobal.local == 2)
         {
            urlA = "http://www.guitarflash.com.br/social/facebook/asp/ptsGeraA.asp";
         }
         var request:URLRequest = new URLRequest(urlA);
         var variavelA:URLVariables = new URLVariables();
         variavelA.mus = num;
         request.data = variavelA;
         request.method = URLRequestMethod.POST;
         var loaderA:URLLoader = new URLLoader();
         try
         {
            loaderA.load(request);
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
      
      private function pontosGeraF(param1:*, param2:*) : *
      {
         var num:* = param1;
         var pontosF:* = param2;
         var urlD:String = "";
         if(dGlobal.local == 0)
         {
            urlD = "http://67.23.231.84/guitar-flash/ptsGeraF.asp";
         }
         else if(dGlobal.local == 1)
         {
            urlD = "http://www.guitarflash.com.br/ptsGeraF.asp";
         }
         else if(dGlobal.local == 2)
         {
            urlD = "http://www.guitarflash.com.br/social/facebook/asp/ptsGeraF.asp";
         }
         seg = Math.round(Math.random() * 1000);
         dGlobal.ptsGeraVar[0] = "1";
         dGlobal.ptsGeraVar[1] = urlD;
         dGlobal.ptsGeraVar[2] = num;
         dGlobal.ptsGeraVar[3] = seg;
         dGlobal.ptsGeraVar[4] = pontosF;
         dGlobal.ptsGeraVar[5] = dGlobal.idDuelo;
         dGlobal.ptsGeraVar[6] = dGlobal.idVoce;
         dGlobal.ptsGeraVar[7] = dGlobal.idAmigo;
         dGlobal.ptsGeraVar[8] = dGlobal.nivel;
         if(dGlobal.duelo == false)
         {
            dGlobal.ptsGeraVar[9] = "0";
         }
         else
         {
            dGlobal.ptsGeraVar[9] = "1";
         }
         if(dGlobal.palheta == true)
         {
            dGlobal.ptsGeraVar[10] = "1";
            dGlobal.ptsGeraVar[11] = md5.encrypt(String(pontosF) + "ab" + String(num) + "ed" + String(dGlobal.idVoce) + "1" + dGlobal.nivel + String(dGlobal.idDuelo) + "s" + seg);
         }
         else
         {
            dGlobal.ptsGeraVar[10] = "0";
            dGlobal.ptsGeraVar[11] = md5.encrypt(String(pontosF) + "ab" + String(num) + "ed" + String(dGlobal.idVoce) + "0" + dGlobal.nivel + String(dGlobal.idDuelo) + "s" + seg);
         }
         var request:URLRequest = new URLRequest(urlD);
         var variavelD:URLVariables = new URLVariables();
         variavelD.mus = num;
         variavelD.vl = seg;
         variavelD.pts = pontosF;
         variavelD.idDuelo = dGlobal.idDuelo;
         variavelD.idVoce = dGlobal.idVoce;
         variavelD.idAmigo = dGlobal.idAmigo;
         variavelD.dificuldade = dGlobal.nivel;
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
            return;
         }
         catch(error:SecurityError)
         {
            return;
         }
      }
      
      private function pontosGera(param1:*) : *
      {
         var num:* = param1;
         if(dGlobal.duelo == true)
         {
            tpDuelo = 2;
         }
         if(Number(dGlobal.idAmigo) != 0)
         {
            voceDuelo = pontos;
            if(dGlobal.duelo == false)
            {
               tpDuelo = 1;
            }
         }
         i = 0;
         while(i < 9)
         {
            conqObt[i] = 0;
            i++;
         }
         estNivel1 = Math.floor((-50 + Math.sqrt(2500 - 200 * -dGlobal.pontosXP)) / 100);
         estNivel2 = ((estNivel1 + 1 - 1) * 0.5 + 1) * ((estNivel1 + 1) * 100);
         estNivel3 = dGlobal.pontosXP;
         estNivel = ((estNivel1 - 1) * 0.5 + 1) * (estNivel1 * 100);
         estNivelP = Math.floor((estNivel3 - estNivel) * 100 / (estNivel2 - estNivel));
         root["vcEstatisticas"].estNivel3.text = estNivel3;
         root["vcEstatisticas"].estNivel1.text = estNivel1;
         root["vcEstatisticas"].estNivel2.text = estNivel2;
         root["vcEstatisticas"].estNivel.gotoAndStop(estNivelP);
         if(dGlobal.palheta == true)
         {
            if(tpDuelo == 0)
            {
               dGlobal.pontosXP = dGlobal.pontosXP + Math.round(pontos / 1000 * 6);
            }
            else
            {
               dGlobal.pontosXP = dGlobal.pontosXP + Math.round(pontos / 1000 * 6);
            }
         }
         else if(tpDuelo == 0)
         {
            dGlobal.pontosXP = dGlobal.pontosXP + Math.round(pontos / 1000 * 4);
         }
         else
         {
            dGlobal.pontosXP = dGlobal.pontosXP + Math.round(pontos / 1000 * 4);
         }
         estNivelC = Math.floor((-50 + Math.sqrt(2500 - 200 * -dGlobal.pontosXP)) / 100);
         if(dGlobal.conquistas != null)
         {
            if(dGlobal.conquistas[0] != "s" && Number(root["vcEstatisticas"].estCombo.text) > 49)
            {
               dGlobal.conquistas[0] = "s";
               conqObt[0] = 1;
            }
            if(dGlobal.conquistas[1] != "s" && Number(root["vcEstatisticas"].estCombo.text) > 99)
            {
               dGlobal.conquistas[1] = "s";
               conqObt[0] = 2;
            }
            if(dGlobal.conquistas[2] != "s" && Number(root["vcEstatisticas"].estCombo.text) > 249)
            {
               dGlobal.conquistas[2] = "s";
               conqObt[0] = 3;
            }
            if(dGlobal.conquistas[3] != "s" && Number(root["vcEstatisticas"].estCombo.text) > 499)
            {
               dGlobal.conquistas[3] = "s";
               conqObt[0] = 4;
            }
            if(dGlobal.conquistas[4] != "s" && Number(root["vcEstatisticas"].estCombo.text) > 999)
            {
               dGlobal.conquistas[4] = "s";
               conqObt[0] = 5;
            }
            if(dGlobal.conquistas[5] != "s" && Number(root["vcEstatisticas"].estCombo.text) > 1999)
            {
               dGlobal.conquistas[5] = "s";
               conqObt[0] = 6;
            }
            if(porcento == 100 && Number(root["vcEstatisticas"].estPerdidas.text) == 0 && Number(root["vcEstatisticas"].estErradas.text) == 0 && Number(root["vcEstatisticas"].estCombo.text) == Number(root["vcEstatisticas"].estAcertadas.text) && dGlobal.jogStrMus != 6)
            {
               fc = true;
               if(dGlobal.palheta == false)
               {
                  if(dGlobal.conquistas[6] != "s" && dGlobal.nivel == "a")
                  {
                     dGlobal.conquistas[6] = "s";
                     conqObt[1] = 7;
                  }
                  if(dGlobal.conquistas[7] != "s" && dGlobal.nivel == "b")
                  {
                     if(dGlobal.conquistas[7] > 0)
                     {
                        dGlobal.conquistas[6] = "s";
                        dGlobal.conquistas[7] = "s";
                        conqObt[1] = 8;
                     }
                     else
                     {
                        dGlobal.conquistas[7] = Number(dGlobal.conquistas[7]) + 1;
                     }
                  }
                  if(dGlobal.conquistas[8] != "s" && dGlobal.nivel == "c")
                  {
                     if(dGlobal.conquistas[8] > 1)
                     {
                        dGlobal.conquistas[6] = "s";
                        dGlobal.conquistas[7] = "s";
                        dGlobal.conquistas[8] = "s";
                        conqObt[1] = 9;
                     }
                     else
                     {
                        dGlobal.conquistas[8] = Number(dGlobal.conquistas[8]) + 1;
                     }
                  }
                  if(dGlobal.conquistas[9] != "s" && dGlobal.nivel == "d")
                  {
                     if(dGlobal.conquistas[10] > 3)
                     {
                        dGlobal.conquistas[6] = "s";
                        dGlobal.conquistas[7] = "s";
                        dGlobal.conquistas[8] = "s";
                        dGlobal.conquistas[9] = "s";
                        conqObt[1] = 10;
                     }
                     else
                     {
                        dGlobal.conquistas[10] = Number(dGlobal.conquistas[10]) + 1;
                     }
                  }
                  if(dGlobal.conquistas[10] != "s" && dGlobal.nivel == "d")
                  {
                     if(dGlobal.conquistas[10] > 8)
                     {
                        dGlobal.conquistas[6] = "s";
                        dGlobal.conquistas[7] = "s";
                        dGlobal.conquistas[8] = "s";
                        dGlobal.conquistas[9] = "s";
                        dGlobal.conquistas[10] = "s";
                        conqObt[1] = 11;
                     }
                     else
                     {
                        dGlobal.conquistas[10] = Number(dGlobal.conquistas[10]) + 1;
                     }
                  }
               }
               if(dGlobal.palheta == true)
               {
                  if(dGlobal.conquistas[11] != "s" && dGlobal.nivel == "a")
                  {
                     dGlobal.conquistas[11] = "s";
                     conqObt[1] = 12;
                  }
                  if(dGlobal.conquistas[12] != "s" && dGlobal.nivel == "b")
                  {
                     if(Number(dGlobal.conquistas[12]) > 0)
                     {
                        dGlobal.conquistas[11] = "s";
                        dGlobal.conquistas[12] = "s";
                        conqObt[1] = 13;
                     }
                     else
                     {
                        dGlobal.conquistas[12] = Number(dGlobal.conquistas[12]) + 1;
                     }
                  }
                  if(dGlobal.conquistas[13] != "s" && dGlobal.nivel == "c")
                  {
                     if(Number(dGlobal.conquistas[13]) > 1)
                     {
                        dGlobal.conquistas[11] = "s";
                        dGlobal.conquistas[12] = "s";
                        dGlobal.conquistas[13] = "s";
                        conqObt[1] = 14;
                     }
                     else
                     {
                        dGlobal.conquistas[13] = Number(dGlobal.conquistas[13]) + 1;
                     }
                  }
                  if(dGlobal.conquistas[14] != "s" && dGlobal.nivel == "d")
                  {
                     if(Number(dGlobal.conquistas[15]) > 3)
                     {
                        dGlobal.conquistas[11] = "s";
                        dGlobal.conquistas[12] = "s";
                        dGlobal.conquistas[13] = "s";
                        dGlobal.conquistas[14] = "s";
                        conqObt[1] = 15;
                     }
                     else
                     {
                        dGlobal.conquistas[15] = Number(dGlobal.conquistas[15]) + 1;
                     }
                  }
                  if(dGlobal.conquistas[15] != "s" && dGlobal.nivel == "d")
                  {
                     if(Number(dGlobal.conquistas[15]) > 8)
                     {
                        dGlobal.conquistas[11] = "s";
                        dGlobal.conquistas[12] = "s";
                        dGlobal.conquistas[13] = "s";
                        dGlobal.conquistas[14] = "s";
                        dGlobal.conquistas[15] = "s";
                        conqObt[1] = 16;
                     }
                     else
                     {
                        dGlobal.conquistas[15] = Number(dGlobal.conquistas[15]) + 1;
                     }
                  }
               }
               dGlobal.jogStrMus = 6;
            }
            if(dGlobal.conquistas[16] != "s" && pontos > 4999)
            {
               dGlobal.conquistas[16] = "s";
               conqObt[2] = 17;
            }
            if(dGlobal.conquistas[17] != "s" && pontos > 9999)
            {
               dGlobal.conquistas[17] = "s";
               conqObt[2] = 18;
            }
            if(dGlobal.conquistas[18] != "s" && pontos > 24999)
            {
               dGlobal.conquistas[18] = "s";
               conqObt[2] = 19;
            }
            if(dGlobal.conquistas[19] != "s" && pontos > 49999)
            {
               dGlobal.conquistas[19] = "s";
               conqObt[2] = 20;
            }
            if(dGlobal.conquistas[20] != "s" && pontos > 59999)
            {
               dGlobal.conquistas[20] = "s";
               conqObt[2] = 21;
            }
            if(dGlobal.conquistas[21] != "s" && pontos > 69999)
            {
               dGlobal.conquistas[21] = "s";
               conqObt[2] = 22;
            }
            if(pontos > dGlobal.jogPtsMus)
            {
               if(dGlobal.conquistas[27] != "s")
               {
                  dGlobal.conquistas[27] = Number(dGlobal.conquistas[27]) + (pontos - dGlobal.jogPtsMus);
                  if(dGlobal.conquistas[22] != "s" && Number(dGlobal.conquistas[27]) > 99999)
                  {
                     dGlobal.conquistas[22] = "s";
                     conqObt[3] = 23;
                  }
                  if(dGlobal.conquistas[23] != "s" && Number(dGlobal.conquistas[27]) > 499999)
                  {
                     dGlobal.conquistas[23] = "s";
                     conqObt[3] = 24;
                  }
                  if(dGlobal.conquistas[24] != "s" && Number(dGlobal.conquistas[27]) > 999999)
                  {
                     dGlobal.conquistas[24] = "s";
                     conqObt[3] = 25;
                  }
                  if(dGlobal.conquistas[25] != "s" && Number(dGlobal.conquistas[27]) > 2499999)
                  {
                     dGlobal.conquistas[25] = "s";
                     conqObt[3] = 26;
                  }
                  if(dGlobal.conquistas[26] != "s" && Number(dGlobal.conquistas[27]) > 4999999)
                  {
                     dGlobal.conquistas[26] = "s";
                     conqObt[3] = 27;
                  }
                  if(Number(dGlobal.conquistas[27]) > 9999999)
                  {
                     dGlobal.conquistas[27] = "s";
                     conqObt[3] = 28;
                  }
               }
            }
            if(dGlobal.jogPtsMus == 0)
            {
               if(dGlobal.conquistas[28] != "s")
               {
                  dGlobal.conquistas[28] = "s";
                  conqObt[4] = 29;
               }
               if(dGlobal.palheta == false)
               {
                  if(dGlobal.conquistas[29] != "s" && dGlobal.nivel == "a")
                  {
                     if(Number(dGlobal.conquistas[29]) > 3)
                     {
                        dGlobal.conquistas[29] = "s";
                        conqObt[4] = 30;
                     }
                     else
                     {
                        dGlobal.conquistas[29] = Number(dGlobal.conquistas[29]) + 1;
                     }
                  }
                  if(dGlobal.conquistas[30] != "s" && dGlobal.nivel == "b")
                  {
                     if(Number(dGlobal.conquistas[30]) > 8)
                     {
                        dGlobal.conquistas[30] = "s";
                        conqObt[4] = 31;
                     }
                     else
                     {
                        dGlobal.conquistas[30] = Number(dGlobal.conquistas[30]) + 1;
                     }
                  }
                  if(dGlobal.conquistas[31] != "s" && dGlobal.nivel == "c")
                  {
                     if(Number(dGlobal.conquistas[31]) > 13)
                     {
                        dGlobal.conquistas[31] = "s";
                        conqObt[4] = 32;
                     }
                     else
                     {
                        dGlobal.conquistas[31] = Number(dGlobal.conquistas[31]) + 1;
                     }
                  }
                  if(dGlobal.conquistas[32] != "s" && dGlobal.nivel == "d")
                  {
                     if(Number(dGlobal.conquistas[32]) > 18)
                     {
                        dGlobal.conquistas[32] = "s";
                        conqObt[4] = 33;
                     }
                     else
                     {
                        dGlobal.conquistas[32] = Number(dGlobal.conquistas[32]) + 1;
                     }
                  }
               }
               if(dGlobal.palheta == true)
               {
                  if(dGlobal.conquistas[33] != "s" && dGlobal.nivel == "a")
                  {
                     if(Number(dGlobal.conquistas[33]) > 3)
                     {
                        dGlobal.conquistas[33] = "s";
                        conqObt[4] = 34;
                     }
                     else
                     {
                        dGlobal.conquistas[33] = Number(dGlobal.conquistas[33]) + 1;
                     }
                  }
                  if(dGlobal.conquistas[34] != "s" && dGlobal.nivel == "b")
                  {
                     if(Number(dGlobal.conquistas[34]) > 8)
                     {
                        dGlobal.conquistas[34] = "s";
                        conqObt[4] = 35;
                     }
                     else
                     {
                        dGlobal.conquistas[34] = Number(dGlobal.conquistas[34]) + 1;
                     }
                  }
                  if(dGlobal.conquistas[35] != "s" && dGlobal.nivel == "c")
                  {
                     if(Number(dGlobal.conquistas[35]) > 13)
                     {
                        dGlobal.conquistas[35] = "s";
                        conqObt[4] = 36;
                     }
                     else
                     {
                        dGlobal.conquistas[35] = Number(dGlobal.conquistas[35]) + 1;
                     }
                  }
                  if(dGlobal.conquistas[36] != "s" && dGlobal.nivel == "d")
                  {
                     if(Number(dGlobal.conquistas[36]) > 18)
                     {
                        dGlobal.conquistas[36] = "s";
                        conqObt[4] = 37;
                     }
                     else
                     {
                        dGlobal.conquistas[36] = Number(dGlobal.conquistas[36]) + 1;
                     }
                  }
               }
            }
            if(dGlobal.conquistas[43] != "s")
            {
               if(dGlobal.conquistas[37] != "s")
               {
                  if(Number(dGlobal.conquistas[43]) > 23)
                  {
                     dGlobal.conquistas[37] = "s";
                     conqObt[5] = 38;
                  }
               }
               if(dGlobal.conquistas[38] != "s")
               {
                  if(Number(dGlobal.conquistas[43]) > 48)
                  {
                     dGlobal.conquistas[38] = "s";
                     conqObt[5] = 39;
                  }
               }
               if(dGlobal.conquistas[39] != "s")
               {
                  if(Number(dGlobal.conquistas[43]) > 98)
                  {
                     dGlobal.conquistas[39] = "s";
                     conqObt[5] = 40;
                  }
               }
               if(dGlobal.conquistas[40] != "s")
               {
                  if(Number(dGlobal.conquistas[43]) > 248)
                  {
                     dGlobal.conquistas[40] = "s";
                     conqObt[5] = 41;
                  }
               }
               if(dGlobal.conquistas[41] != "s")
               {
                  if(Number(dGlobal.conquistas[43]) > 498)
                  {
                     dGlobal.conquistas[41] = "s";
                     conqObt[5] = 42;
                  }
               }
               if(dGlobal.conquistas[42] != "s")
               {
                  if(Number(dGlobal.conquistas[43]) > 748)
                  {
                     dGlobal.conquistas[42] = "s";
                     conqObt[5] = 43;
                  }
               }
               if(Number(dGlobal.conquistas[43]) > 998)
               {
                  dGlobal.conquistas[43] = "s";
                  conqObt[5] = 44;
               }
               else
               {
                  dGlobal.conquistas[43] = Number(dGlobal.conquistas[43]) + 1;
               }
            }
            if(dGlobal.conquistas[55] != "s")
            {
               if(dGlobal.conquistas[44] != "s" && estNivelC > 0)
               {
                  dGlobal.conquistas[44] = "s";
                  conqObt[6] = 45;
               }
               if(dGlobal.conquistas[45] != "s" && estNivelC > 4)
               {
                  dGlobal.conquistas[45] = "s";
                  conqObt[6] = 46;
               }
               if(dGlobal.conquistas[46] != "s" && estNivelC > 9)
               {
                  dGlobal.conquistas[46] = "s";
                  conqObt[6] = 47;
               }
               if(dGlobal.conquistas[47] != "s" && estNivelC > 19)
               {
                  dGlobal.conquistas[47] = "s";
                  conqObt[6] = 48;
               }
               if(dGlobal.conquistas[48] != "s" && estNivelC > 29)
               {
                  dGlobal.conquistas[48] = "s";
                  conqObt[6] = 49;
               }
               if(dGlobal.conquistas[49] != "s" && estNivelC > 39)
               {
                  dGlobal.conquistas[49] = "s";
                  conqObt[6] = 50;
               }
               if(dGlobal.conquistas[50] != "s" && estNivelC > 49)
               {
                  dGlobal.conquistas[50] = "s";
                  conqObt[6] = 51;
               }
               if(dGlobal.conquistas[51] != "s" && estNivelC > 59)
               {
                  dGlobal.conquistas[51] = "s";
                  conqObt[6] = 52;
               }
               if(dGlobal.conquistas[52] != "s" && estNivelC > 69)
               {
                  dGlobal.conquistas[52] = "s";
                  conqObt[6] = 53;
               }
               if(dGlobal.conquistas[53] != "s" && estNivelC > 79)
               {
                  dGlobal.conquistas[53] = "s";
                  conqObt[6] = 54;
               }
               if(dGlobal.conquistas[54] != "s" && estNivelC > 89)
               {
                  dGlobal.conquistas[54] = "s";
                  conqObt[6] = 55;
               }
               if(estNivelC > 99)
               {
                  dGlobal.conquistas[55] = "s";
                  conqObt[6] = 56;
               }
            }
            if(tpDuelo == 1)
            {
               if(dGlobal.palheta == false)
               {
                  if(dGlobal.conquistas[60] != "s")
                  {
                     if(dGlobal.conquistas[56] != "s")
                     {
                        dGlobal.conquistas[56] = "s";
                        conqObt[7] = 57;
                     }
                     if(dGlobal.conquistas[57] != "s" && Number(dGlobal.conquistas[60]) > 3)
                     {
                        dGlobal.conquistas[57] = "s";
                        conqObt[7] = 58;
                     }
                     if(dGlobal.conquistas[58] != "s" && Number(dGlobal.conquistas[60]) > 8)
                     {
                        dGlobal.conquistas[58] = "s";
                        conqObt[7] = 59;
                     }
                     if(dGlobal.conquistas[59] != "s" && Number(dGlobal.conquistas[60]) > 23)
                     {
                        dGlobal.conquistas[59] = "s";
                        conqObt[7] = 60;
                     }
                     if(Number(dGlobal.conquistas[60]) > 48)
                     {
                        dGlobal.conquistas[60] = "s";
                        conqObt[7] = 61;
                     }
                     else
                     {
                        dGlobal.conquistas[60] = Number(dGlobal.conquistas[60]) + 1;
                     }
                  }
               }
               if(dGlobal.palheta == true)
               {
                  if(dGlobal.conquistas[64] != "s")
                  {
                     if(dGlobal.conquistas[56] != "s")
                     {
                        dGlobal.conquistas[56] = "s";
                        conqObt[7] = 57;
                     }
                     if(dGlobal.conquistas[61] != "s" && Number(dGlobal.conquistas[64]) > 3)
                     {
                        dGlobal.conquistas[61] = "s";
                        conqObt[7] = 62;
                     }
                     if(dGlobal.conquistas[62] != "s" && Number(dGlobal.conquistas[64]) > 8)
                     {
                        dGlobal.conquistas[62] = "s";
                        conqObt[7] = 63;
                     }
                     if(dGlobal.conquistas[63] != "s" && Number(dGlobal.conquistas[64]) > 23)
                     {
                        dGlobal.conquistas[63] = "s";
                        conqObt[7] = 64;
                     }
                     if(Number(dGlobal.conquistas[64]) > 48)
                     {
                        dGlobal.conquistas[64] = "s";
                        conqObt[7] = 65;
                     }
                     else
                     {
                        dGlobal.conquistas[64] = Number(dGlobal.conquistas[64]) + 1;
                     }
                  }
               }
            }
            if(tpDuelo == 1 && pontos > dGlobal.ptsAmigo)
            {
               if(dGlobal.palheta == false)
               {
                  if(dGlobal.conquistas[69] != "s")
                  {
                     if(dGlobal.conquistas[65] != "s")
                     {
                        dGlobal.conquistas[65] = "s";
                        conqObt[8] = 66;
                     }
                     if(dGlobal.conquistas[66] != "s" && Number(dGlobal.conquistas[69]) > 3)
                     {
                        dGlobal.conquistas[66] = "s";
                        conqObt[8] = 67;
                     }
                     if(dGlobal.conquistas[67] != "s" && Number(dGlobal.conquistas[69]) > 8)
                     {
                        dGlobal.conquistas[67] = "s";
                        conqObt[8] = 68;
                     }
                     if(dGlobal.conquistas[68] != "s" && Number(dGlobal.conquistas[69]) > 23)
                     {
                        dGlobal.conquistas[68] = "s";
                        conqObt[8] = 69;
                     }
                     if(Number(dGlobal.conquistas[69]) > 48)
                     {
                        dGlobal.conquistas[69] = "s";
                        conqObt[8] = 70;
                     }
                     else
                     {
                        dGlobal.conquistas[69] = Number(dGlobal.conquistas[69]) + 1;
                     }
                  }
               }
               if(dGlobal.palheta == true)
               {
                  if(dGlobal.conquistas[73] != "s")
                  {
                     if(dGlobal.conquistas[65] != "s")
                     {
                        dGlobal.conquistas[65] = "s";
                        conqObt[8] = 66;
                     }
                     if(dGlobal.conquistas[70] != "s" && Number(dGlobal.conquistas[73]) > 3)
                     {
                        dGlobal.conquistas[70] = "s";
                        conqObt[8] = 71;
                     }
                     if(dGlobal.conquistas[71] != "s" && Number(dGlobal.conquistas[73]) > 8)
                     {
                        dGlobal.conquistas[71] = "s";
                        conqObt[8] = 72;
                     }
                     if(dGlobal.conquistas[72] != "s" && Number(dGlobal.conquistas[73]) > 23)
                     {
                        dGlobal.conquistas[72] = "s";
                        conqObt[8] = 73;
                     }
                     if(Number(dGlobal.conquistas[73]) > 48)
                     {
                        dGlobal.conquistas[73] = "s";
                        conqObt[8] = 74;
                     }
                     else
                     {
                        dGlobal.conquistas[73] = Number(dGlobal.conquistas[73]) + 1;
                     }
                  }
               }
            }
            i = 0;
            while(i < 9)
            {
               if(conqObt[i] != 0)
               {
                  if(conqObtS != "")
                  {
                     conqObtS = conqObtS + ",";
                  }
                  conqObtS = conqObtS + (Number(conqObt[i]) - 1);
               }
               i++;
            }
            conquistas = "";
            i = 0;
            while(i < 74)
            {
               conquistas = conquistas + dGlobal.conquistas[i];
               if(i != 73)
               {
                  conquistas = conquistas + ",";
               }
               i++;
            }
         }
         root["gravaPts"].visible = true;
         root["gravaPts"].gotoAndPlay(2);
         var url:String = "";
         if(dGlobal.local == 0)
         {
            url = "http://67.23.231.84/guitar-flash/ptsGera.asp";
         }
         else if(dGlobal.local == 1)
         {
            url = "http://www.guitarflash.com.br/ptsGera.asp";
         }
         else if(dGlobal.local == 2)
         {
            url = "http://www.guitarflash.com.br/social/facebook/asp/ptsGera.asp";
         }
         seg = Math.round(Math.random() * 1000);
         dGlobal.ptsGeraVar[0] = "2";
         dGlobal.ptsGeraVar[1] = url;
         dGlobal.ptsGeraVar[2] = num;
         dGlobal.ptsGeraVar[3] = seg;
         dGlobal.ptsGeraVar[4] = pontos;
         dGlobal.ptsGeraVar[5] = dGlobal.pontosXP;
         if(dGlobal.palheta == true)
         {
            dGlobal.ptsGeraVar[6] = "1";
            dGlobal.ptsGeraVar[7] = md5.encrypt(String(pontos) + "ab" + String(num) + "ed" + String(dGlobal.idVoce) + "1" + dGlobal.nivel + String(dGlobal.idDuelo) + "s" + seg);
         }
         else
         {
            dGlobal.ptsGeraVar[6] = "0";
            dGlobal.ptsGeraVar[7] = md5.encrypt(String(pontos) + "ab" + String(num) + "ed" + String(dGlobal.idVoce) + "0" + dGlobal.nivel + String(dGlobal.idDuelo) + "s" + seg);
         }
         dGlobal.ptsGeraVar[8] = Number(root["vcEstatisticas"].estAcertadas.text);
         dGlobal.ptsGeraVar[9] = Number(root["vcEstatisticas"].estPerdidas.text);
         dGlobal.ptsGeraVar[10] = Number(root["vcEstatisticas"].estErradas.text);
         dGlobal.ptsGeraVar[11] = Number(root["vcEstatisticas"].estCombo.text);
         dGlobal.ptsGeraVar[12] = Number(root["vcEstatisticas"].estAcertadasSP.text);
         dGlobal.ptsGeraVar[13] = dGlobal.espP;
         dGlobal.ptsGeraVar[14] = dGlobal.idDuelo;
         dGlobal.ptsGeraVar[15] = dGlobal.idVoce;
         dGlobal.ptsGeraVar[16] = dGlobal.idAmigo;
         dGlobal.ptsGeraVar[17] = dGlobal.nivel;
         if(dGlobal.rastros > dGlobal.rastroCont)
         {
            dGlobal.ptsGeraVar[18] = "r/" + dGlobal.botTec + "/s" + dGlobal.contErSP + "/f" + dGlobal.frameErMus + "/" + dGlobal.notasSP;
         }
         else
         {
            dGlobal.ptsGeraVar[18] = dGlobal.botTec + "/s" + dGlobal.contErSP + "/f" + dGlobal.frameErMus + "/" + dGlobal.notasSP;
         }
         dGlobal.ptsGeraVar[19] = dGlobal.rastros;
         if(dGlobal.duelo == false)
         {
            dGlobal.ptsGeraVar[20] = "0";
         }
         else
         {
            dGlobal.ptsGeraVar[20] = "1";
         }
         if(dGlobal.ptsBest == 999000 && pontos != 0)
         {
            dGlobal.ptsGeraVar[21] = "1";
            voceBest = pontos;
            dGlobal.ptsBest = pontos + 1;
         }
         else
         {
            dGlobal.ptsGeraVar[21] = "0";
         }
         dGlobal.ptsGeraVar[22] = porcento;
         dGlobal.ptsGeraVar[23] = voceBest;
         dGlobal.ptsGeraVar[24] = tpDuelo;
         dGlobal.ptsGeraVar[25] = voceDuelo;
         dGlobal.ptsGeraVar[26] = estNivelC;
         dGlobal.ptsGeraVar[27] = conqObtS;
         dGlobal.ptsGeraVar[28] = conquistas;
         var request:URLRequest = new URLRequest(url);
         var variavel:URLVariables = new URLVariables();
         variavel.mus = num;
         variavel.vl = seg;
         variavel.pts = pontos;
         variavel.ptsXP = dGlobal.pontosXP;
         variavel.modo = dGlobal.ptsGeraVar[6];
         variavel.cripto = dGlobal.ptsGeraVar[7];
         variavel.acertadas = Number(root["vcEstatisticas"].estAcertadas.text);
         variavel.perdidas = Number(root["vcEstatisticas"].estPerdidas.text);
         variavel.erradas = Number(root["vcEstatisticas"].estErradas.text);
         variavel.combo = Number(root["vcEstatisticas"].estCombo.text);
         variavel.acertadasSPa = Number(root["vcEstatisticas"].estAcertadasSP.text);
         variavel.acertadasSP = dGlobal.espP;
         variavel.idDuelo = dGlobal.idDuelo;
         variavel.idVoce = dGlobal.idVoce;
         variavel.idAmigo = dGlobal.idAmigo;
         variavel.dificuldade = dGlobal.nivel;
         variavel.spUsado = dGlobal.ptsGeraVar[18];
         variavel.rastros = dGlobal.rastros;
         variavel.dueloQ = dGlobal.ptsGeraVar[20];
         variavel.best = dGlobal.ptsGeraVar[21];
         variavel.porcentagem = porcento;
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
            if(pontos > dGlobal.jogPtsMus)
            {
               dGlobal.jogPtsMus = pontos;
               ExternalInterface.call("finalMus","5",voceBest,tpDuelo,voceDuelo,pontos,Math.round(dGlobal.pontosXP),estNivelC,conqObtS,conquistas,fc);
            }
            else
            {
               ExternalInterface.call("finalMus","4",voceBest,tpDuelo,voceDuelo,pontos,Math.round(dGlobal.pontosXP),estNivelC,conqObtS,conquistas,fc);
            }
            tpDuelo = 0;
         }
         conqObtS = "";
         i = 0;
         while(i < 9)
         {
            conqObt[i] = 0;
            i++;
         }
      }
      
      private function ioErrorHandler(param1:IOErrorEvent) : void
      {
         ptsGeraErro();
      }
      
      private function securityErrorHandler(param1:SecurityErrorEvent) : void
      {
         ptsGeraErro();
      }
      
      private function ptsGeraErro() : *
      {
         root["gravaPts"].visible = false;
         root["gravaPts"].gotoAndPlay(1);
         root["mPause"].gotoAndStop(4);
         root["vcEstatisticas"].visible = false;
         root["mPause"].alpha = 1;
         tpDuelo = 0;
         conqObtS = "";
         i = 0;
         while(i < 9)
         {
            conqObt[i] = 0;
            i++;
         }
      }
      
      function animaXP() : *
      {
         if(estNivel3 == dGlobal.pontosXP || estNivel3 > dGlobal.pontosXP)
         {
            root["vcEstatisticas"].estNivel3.text = dGlobal.pontosXP;
            clearInterval(intervalo5);
         }
         else
         {
            estNivel3 = estNivel3 + 1;
            estNivel1 = Math.floor((-50 + Math.sqrt(2500 - 200 * -estNivel3)) / 100);
            estNivel2 = ((estNivel1 + 1 - 1) * 0.5 + 1) * ((estNivel1 + 1) * 100);
            estNivel = ((estNivel1 - 1) * 0.5 + 1) * (estNivel1 * 100);
            estNivelP = Math.floor((estNivel3 - estNivel) * 100 / (estNivel2 - estNivel));
            root["vcEstatisticas"].estNivel3.text = estNivel3;
            root["vcEstatisticas"].estNivel1.text = estNivel1;
            root["vcEstatisticas"].estNivel2.text = estNivel2;
            root["vcEstatisticas"].estNivel.gotoAndStop(estNivelP);
         }
      }
      
      private function volumeMus() : *
      {
         var _loc1_:SoundTransform = mC1.soundTransform;
         _loc1_.volume = dGlobal.volGuitarra;
         mC1.soundTransform = _loc1_;
      }
      
      function falhaDuelo() : *
      {
         if(dGlobal.duelo == true)
         {
            tpDuelo = 2;
         }
         if(Number(dGlobal.idAmigo) != 0)
         {
            voceDuelo = dGlobal.pontosG;
            if(dGlobal.duelo == false)
            {
               tpDuelo = 1;
            }
         }
         ExternalInterface.call("falhaMus",tpDuelo,voceDuelo,pontos);
         clearInterval(intervalo5);
      }
      
      function jogAnonima() : *
      {
         ExternalInterface.call("jogAnonima",pontos);
         clearInterval(intervalo7);
      }
   }
}
