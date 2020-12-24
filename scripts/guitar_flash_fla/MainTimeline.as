package guitar_flash_fla
{
   import flash.display.LoaderInfo;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import flash.system.Security;
   import flash.text.TextField;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public dynamic class MainTimeline extends MovieClip
   {
       
      
      public var mPause:btPause;
      
      public var trovao5:MovieClip;
      
      public var paleta1:MovieClip;
      
      public var paleta2:MovieClip;
      
      public var gravaPts:MovieClip;
      
      public var paleta3:MovieClip;
      
      public var contRgr:MovieClip;
      
      public var paleta4:MovieClip;
      
      public var paleta5:MovieClip;
      
      public var pista:MovieClip;
      
      public var rockAcertos:MovieClip;
      
      public var pontosGraf:MovieClip;
      
      public var paleta6:MovieClip;
      
      public var mensagem:MovieClip;
      
      public var paleta7:MovieClip;
      
      public var foco:MovieClip;
      
      public var fogo1:MovieClip;
      
      public var fogo2:MovieClip;
      
      public var rockEspecial:MovieClip;
      
      public var teclas:MovieClip;
      
      public var qld:TextField;
      
      public var fogo3:MovieClip;
      
      public var fogo4:MovieClip;
      
      public var valor1:TextField;
      
      public var especial:MovieClip;
      
      public var trovao1:MovieClip;
      
      public var fogo5:MovieClip;
      
      public var animaPista:MovieClip;
      
      public var flash9:flashv;
      
      public var vcEstatisticas:MovieClip;
      
      public var trovao2:MovieClip;
      
      public var pontosMarq:MovieClip;
      
      public var nivel:MovieClip;
      
      public var trovao3:MovieClip;
      
      public var pontosMarq2:MovieClip;
      
      public var palhetada:MovieClip;
      
      public var trovao4:MovieClip;
      
      public var varName:String;
      
      public var palhetaReset:Boolean;
      
      public var nivelReset:Boolean;
      
      public var teclasReset:Boolean;
      
      public var paramObj:Object;
      
      public var teclasT:Array;
      
      public var i:int;
      
      public var intervalo:Number;
      
      public function MainTimeline()
      {
         super();
         addFrameScript(0,frame1,1,frame2,2,frame3,4,frame5);
      }
      
      public function completo(param1:Event) : void
      {
         this.root.loaderInfo.removeEventListener(Event.COMPLETE,completo);
         if(dGlobal.urlPath.indexOf("moisesgames") > 0)
         {
            gotoAndStop(5);
         }
         else
         {
            gotoAndStop(2);
         }
      }
      
      public function janelaEncontrada(param1:Event) : void
      {
         root["foco"].gotoAndStop(1);
      }
      
      public function janelaPerdida(param1:Event) : void
      {
         root["foco"].gotoAndPlay(2);
      }
      
      public function liberado(param1:Number, param2:Number, param3:Number) : void
      {
         if(this.currentFrame == 1)
         {
            dGlobal.ptsBest = Number(param1);
         }
         else if(this.currentFrame == 2)
         {
            dGlobal.ptsBest = Number(param1);
            if(dGlobal.ptsMax != 0)
            {
               root["pontosMarq2"].melhor.y = 314.6 - 324 * (dGlobal.ptsBest * 100 / dGlobal.ptsMax) / 100;
            }
         }
         dGlobal.jogPtsMus = param2;
         dGlobal.jogStrMus = param3;
      }
      
      public function tempo() : *
      {
         if(palhetaReset == true)
         {
            root["palhetada"].gotoAndPlay(2);
         }
         else if(nivelReset == true)
         {
            root["nivel"].gotoAndPlay(2);
         }
         else if(teclasReset == true)
         {
            root["teclas"].gotoAndPlay(2);
         }
         else
         {
            nextFrame();
         }
         clearInterval(intervalo);
      }
      
      function frame1() : *
      {
         stop();
         this.root.loaderInfo.addEventListener(Event.COMPLETE,completo);
         Security.allowDomain("*");
         stage.addEventListener(Event.DEACTIVATE,janelaPerdida);
         stage.addEventListener(Event.ACTIVATE,janelaEncontrada);
         stage.showDefaultContextMenu = false;
         if(dGlobal.debugb == false)
         {
            dGlobal.urlPath = ExternalInterface.call("window.location.href.toString");
            if(dGlobal.urlPath == null)
            {
               dGlobal.urlPath = "av";
            }
            ExternalInterface.addCallback("enviar",liberado);
         }
      }
      
      function frame2() : *
      {
         stop();
         palhetaReset = true;
         nivelReset = true;
         teclasReset = false;
         paramObj = LoaderInfo(this.root.loaderInfo).parameters;
         for(varName in paramObj)
         {
            if(paramObj[varName] != "")
            {
               if(varName == "bg")
               {
                  dGlobal.fundo = "http://www.gamesx.com.br/jogos/orkut/guitar-flash/" + paramObj[varName];
                  addChild(new fundo1());
                  this.setChildIndex(this.getChildAt(this.numChildren - 1),0);
               }
               if(varName == "mus")
               {
                  dGlobal.musicaNum = paramObj[varName];
               }
               if(varName == "idVoce")
               {
                  dGlobal.idVoce = paramObj[varName];
               }
               if(varName == "ptsBest")
               {
                  dGlobal.ptsBest = paramObj[varName];
               }
               if(varName == "ptsAmigo")
               {
                  dGlobal.ptsAmigo = paramObj[varName];
               }
               if(varName == "duelo")
               {
                  if(paramObj[varName] == "false")
                  {
                     dGlobal.duelo = false;
                  }
                  else if(paramObj[varName] == "true")
                  {
                     dGlobal.duelo = true;
                  }
               }
               if(varName == "idDuelo")
               {
                  dGlobal.idDuelo = paramObj[varName];
               }
               if(varName == "idAmigo")
               {
                  dGlobal.idAmigo = paramObj[varName];
               }
               if(varName == "nomeVoce")
               {
                  dGlobal.nomeVoce = paramObj[varName];
               }
               if(varName == "nomeAmigo")
               {
                  dGlobal.nomeAmigo = paramObj[varName];
               }
               if(varName == "pNomeMus")
               {
                  dGlobal.pNomeMus = paramObj[varName];
               }
               if(varName == "pNumMus")
               {
                  dGlobal.pNumMus = paramObj[varName];
               }
               if(varName == "conq")
               {
                  if(paramObj[varName] != "" && paramObj[varName] != null)
                  {
                     dGlobal.conquistas = paramObj[varName].split(",");
                  }
               }
               if(varName == "jogPtsMus")
               {
                  dGlobal.jogPtsMus = paramObj[varName];
               }
               if(varName == "jogStrMus")
               {
                  dGlobal.jogStrMus = paramObj[varName];
               }
               if(varName == "palheta")
               {
                  if(paramObj[varName] == "reset")
                  {
                     palhetaReset = true;
                  }
                  else if(paramObj[varName] == "false")
                  {
                     dGlobal.palheta = false;
                     palhetaReset = false;
                  }
                  else if(paramObj[varName] == "true")
                  {
                     dGlobal.palheta = true;
                     palhetaReset = false;
                  }
               }
               if(varName == "nivel")
               {
                  if(paramObj[varName] == "reset")
                  {
                     nivelReset = true;
                  }
                  else
                  {
                     dGlobal.nivel = paramObj[varName];
                     nivelReset = false;
                  }
               }
               if(varName == "serv")
               {
                  if(paramObj[varName] != "" && paramObj[varName] != "undefined")
                  {
                     dGlobal.serv = paramObj[varName];
                  }
               }
               if(varName == "pontosXP")
               {
                  dGlobal.pontosXP = paramObj[varName];
               }
               if(varName == "erroCar")
               {
                  if(paramObj[varName] == "false")
                  {
                     dGlobal.erroCar = false;
                  }
                  else if(paramObj[varName] == "true")
                  {
                     dGlobal.erroCar = true;
                  }
               }
               if(varName == "teclas")
               {
                  teclasT = paramObj[varName].split("-");
                  i = 0;
                  while(i < 17)
                  {
                     if(i == 0)
                     {
                        if(teclasT[0] == "reset")
                        {
                           dGlobal.teclasReset = true;
                           teclasReset = true;
                        }
                        if(teclasT.length != 17)
                        {
                           i = 17;
                        }
                     }
                     else
                     {
                        dGlobal["ltt" + i] = teclasT[i];
                     }
                     i++;
                  }
                  continue;
               }
               continue;
            }
         }
         intervalo = setInterval(tempo,1000);
      }
      
      function frame3() : *
      {
         stop();
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
         root["animaPista"].visible = false;
         root["pontosMarq2"].visible = false;
         root["contRgr"].visible = false;
         removeChild(root["palhetada"]);
         removeChild(root["nivel"]);
         removeChild(root["teclas"]);
         root["palhetada"] = null;
         root["nivel"] = null;
         root["teclas"] = null;
      }
      
      function frame5() : *
      {
         stop();
      }
   }
}
