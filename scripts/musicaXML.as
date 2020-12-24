package
{
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.geom.ColorTransform;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class musicaXML extends Sprite
   {
       
      
      private var contador:uint = 0;
      
      private var rock:Boolean = false;
      
      private var atraso:Number = 2.25;
      
      private var loader:Loader;
      
      private var xml:XML;
      
      private var xmlArquivo:URLLoader;
      
      private var xmlNotas:XMLList;
      
      private var xmlTempo:XMLList;
      
      private var xmlRastro:XMLList;
      
      private var xmlEspecial:XMLList;
      
      private var xmlHOPO:XMLList;
      
      private var xmlTotal:XMLList;
      
      private var xmlTitulo:XMLList;
      
      private var xmlArtista:XMLList;
      
      private var bytest:Number;
      
      private var bytesc:Number;
      
      private var metralhada:Boolean = false;
      
      private var velocidade:Number;
      
      private var mc:Array;
      
      private var i:Number = 0;
      
      private var j:Number = 0;
      
      private var contDel:Number = 0;
      
      private var escala:Number = 0.868;
      
      private var posXd:Number;
      
      private var teclas:Array;
      
      private var acertou:Boolean = false;
      
      private var igual:Boolean = false;
      
      private var posiAnt:Number;
      
      private var tirarSP:Boolean = false;
      
      private var spAtivo:Boolean = false;
      
      private var notasDel:Number = 0;
      
      private var apagou:Boolean = false;
      
      private var antiCE:uint = 1;
      
      private var aCEmultiB:Boolean = false;
      
      private var quantNotas:Number = 0;
      
      private var ultNotaA:Boolean = false;
      
      private var priNotaSP:Number = 0;
      
      private var ultNotaSP:Number = 0;
      
      private var notasBloq:Boolean = false;
      
      private var especialP:Number = 0;
      
      private var especialT:Boolean = false;
      
      private var especialT2:Boolean = false;
      
      private var atrasou:Boolean = false;
      
      private var atrasouNA:Boolean = false;
      
      private var contRastros:Number = 0;
      
      private var mem:String = "";
      
      private var rastrosTeste:Number = 0;
      
      public function musicaXML(param1:Number, param2:String, param3:String)
      {
         loader = new Loader();
         xml = new XML();
         xmlArquivo = new URLLoader();
         velocidade = jogo.vel;
         mc = new Array();
         teclas = new Array();
         super();
         addEventListener(Event.ENTER_FRAME,loop);
         xmlArquivo.load(new URLRequest("dados/mus" + param1 + param2 + ".xml"));
         xmlArquivo.addEventListener(Event.COMPLETE,monta);
         xmlArquivo.addEventListener(ProgressEvent.PROGRESS,carregarProgresso);
      }
      
      function monta(param1:Event) : *
      {
         teclas[0] = false;
         teclas[1] = false;
         teclas[2] = false;
         teclas[3] = false;
         teclas[4] = false;
         teclas[5] = false;
         xml = new XML(param1.target.data);
         xmlNotas = xml.Data.Note.attribute("track");
         xmlTempo = xml.Data.Note.attribute("time");
         xmlRastro = xml.Data.Note.attribute("duration");
         xmlEspecial = xml.Data.Note.attribute("special");
         xmlHOPO = xml.Data.Note.attribute("hopo");
         xmlTitulo = xml.Properties.Title;
         xmlArtista = xml.Properties.Artist;
         xmlTotal = xml.Properties.Length;
         dGlobal.somDura = Number(xmlTotal);
         dGlobal.ptsMax = xmlNotas.length() * 30;
         root["pontosMarq2"].barraAmigo.jogador.text = dGlobal.nomeAmigo;
         root["pontosMarq2"].barraVoce.jogador.text = dGlobal.nomeVoce;
         if(dGlobal.ptsBest != 0)
         {
            if(dGlobal.ptsAmigo == 0)
            {
               root["pontosMarq2"].barraAmigo.visible = false;
            }
            root["pontosMarq2"].melhor.y = 314.6 - 324 * (dGlobal.ptsBest * 100 / dGlobal.ptsMax) / 100;
            root["pontosMarq2"].melhor.visible = true;
         }
         if(dGlobal.ptsBest == 0 && dGlobal.ptsAmigo == 0)
         {
            root["pontosMarq2"].barraAmigo.visible = false;
         }
         dGlobal.quantNotas = xmlNotas.length();
         atraso = dGlobal.atrasoT;
         xmlArquivo.removeEventListener(Event.ENTER_FRAME,monta);
         xmlArquivo = null;
      }
      
      private function carregarProgresso(param1:ProgressEvent) : void
      {
         bytest = Math.round(param1.bytesTotal / 1024 * 100) / 100;
         bytesc = Math.round(param1.bytesLoaded / 1024 * 100) / 100;
      }
      
      private function loop(param1:Event) : *
      {
         if(rastrosTeste != dGlobal.rastros)
         {
            rastrosTeste = dGlobal.rastros;
         }
         root["valor1"].text = mem;
         dGlobal.xmlTotal = bytest + " KB";
         dGlobal.xmlCar = bytesc + " KB";
         dGlobal.xmlPer = String(bytesc / bytest * 100);
         antiCE = Math.ceil(Math.random() * 2);
         if(dGlobal.posicao == 0)
         {
            ultNotaA = false;
            dGlobal.notasSP = "";
            dGlobal.rastros = 0;
            dGlobal.rastroLib = 0;
            dGlobal.rastroCont = 0;
            contador = 0;
            rock = false;
            notasDel = 0;
            dGlobal.aCEmulti = 104;
            root["rockEspecial"].gotoAndStop(1);
            dGlobal.especial = false;
            root["especial"].gotoAndStop(1);
            root["vcEstatisticas"].estAcertadasSP.text = 0;
            root["vcEstatisticas"].estAcertadas.text = 0;
            root["vcEstatisticas"].estPerdidas.text = 0;
            root["vcEstatisticas"].estErradas.text = 0;
            root["vcEstatisticas"].estCombo.text = 0;
            root["vcEstatisticas"].estComboM.text = 0;
            dGlobal.pontos = 0;
            dGlobal.pontos2 = 0;
            dGlobal.pontosG = 0;
         }
         if(contador == 4 || contador == 5 || contador == 6)
         {
            dGlobal.jogadaTotal = false;
            root["vcEstatisticas"].estNome.estNome.text = xmlTitulo;
            root["vcEstatisticas"].estNome.estBanda.text = xmlArtista;
         }
         if(dGlobal.somLiberado == true && dGlobal.mPause == false && dGlobal.mEPause == false)
         {
            atraso = dGlobal.atrasoT;
            if(contador + 5 > xmlNotas.length() && dGlobal.jogadaTotal == false)
            {
               dGlobal.jogadaTotal = true;
            }
            if(contador < xmlNotas.length() && rock == false && dGlobal.reiniciar == false)
            {
               if((dGlobal.aCEmulti - 105) * -1 != Number(root["pontosGraf"].currentFrame))
               {
                  aCEmultiB = true;
               }
               if(dGlobal.posicaoRel > xmlTempo[contador] - atraso)
               {
                  i = 1;
                  while(i < 6)
                  {
                     if(xmlTempo[contador] == xmlTempo[contador + 1])
                     {
                        if(dGlobal.posicaoRel - (xmlTempo[contador] - atraso) > 0.1)
                        {
                           atrasou = true;
                        }
                        else
                        {
                           atrasou = false;
                        }
                        criarNota(Number(xmlNotas[contador]) + 1,contador,xmlRastro[contador],xmlEspecial[contador],xmlHOPO[contador],atrasou);
                        contador++;
                     }
                     else
                     {
                        if(dGlobal.posicaoRel - (xmlTempo[contador] - atraso) > 0.1)
                        {
                           atrasou = true;
                        }
                        else
                        {
                           atrasou = false;
                        }
                        criarNota(Number(xmlNotas[contador]) + 1,contador,xmlRastro[contador],xmlEspecial[contador],xmlHOPO[contador],atrasou);
                        contador++;
                        i = 6;
                     }
                     if(contador != 0)
                     {
                        if(xmlEspecial[contador] == "1" && xmlEspecial[contador - 1] == "0")
                        {
                           dGlobal.espT = Number(dGlobal.espT) + 1;
                        }
                     }
                     i++;
                  }
               }
            }
            i = 0;
            while(i < mc.length)
            {
               if(dGlobal.posicaoLib == true)
               {
                  if(mc[i][0].y > 350)
                  {
                     if(mc[i][0].currentFrame != 2)
                     {
                        if(mc[i][6] == 1)
                        {
                           tirarSP = true;
                        }
                     }
                     if(mc[i][8] == 0)
                     {
                        deletarNota(i);
                        apagou = true;
                        i = i - 1;
                        if(root["rockAcertos"].currentFrame < 61)
                        {
                           root["rockAcertos"].gotoAndStop(root["rockAcertos"].currentFrame - 2);
                           root["vcEstatisticas"].estPerdidas.text = Number(root["vcEstatisticas"].estPerdidas.text) + 1;
                           if(Number(root["vcEstatisticas"].estComboM.text) > Number(root["vcEstatisticas"].estCombo.text))
                           {
                              root["vcEstatisticas"].estCombo.text = Number(root["vcEstatisticas"].estComboM.text);
                           }
                           root["vcEstatisticas"].estComboM.text = 0;
                        }
                        root["pontosGraf"].gotoAndStop(1);
                        dGlobal.aCEmulti = 104;
                        if(dGlobal.semGuitarra == 0)
                        {
                           dGlobal.controle = true;
                        }
                     }
                     else
                     {
                        if(mc[i][0].currentFrame != 2)
                        {
                           mc[i][9].mascaraA.transform.colorTransform = new ColorTransform(0,0,0,1,51,51,51,0);
                           mc[i][0].gotoAndStop(2);
                           if(root["rockAcertos"].currentFrame < 61)
                           {
                              root["rockAcertos"].gotoAndStop(root["rockAcertos"].currentFrame - 2);
                              root["vcEstatisticas"].estPerdidas.text = Number(root["vcEstatisticas"].estPerdidas.text) + 1;
                              if(Number(root["vcEstatisticas"].estComboM.text) > Number(root["vcEstatisticas"].estCombo.text))
                              {
                                 root["vcEstatisticas"].estCombo.text = Number(root["vcEstatisticas"].estComboM.text);
                              }
                              root["vcEstatisticas"].estComboM.text = 0;
                           }
                           root["pontosGraf"].gotoAndStop(1);
                           dGlobal.aCEmulti = 104;
                           if(dGlobal.semGuitarra == 0)
                           {
                              dGlobal.controle = true;
                           }
                        }
                        if(root["fogo" + mc[i][4]].currentFrame != 1 && root["paleta" + mc[i][4]].currentFrame == 1)
                        {
                           root["fogo" + mc[i][4]].gotoAndStop(1);
                           mc[i][9].mascaraA.transform.colorTransform = new ColorTransform(0,0,0,1,51,51,51,0);
                        }
                        else if(root["fogo" + mc[i][4]].currentFrame != 1)
                        {
                           if(mc[i][8] != 0)
                           {
                              if(mc[i][12] > 0)
                              {
                                 mc[i][12]--;
                                 if(dGlobal.frameMusBloq == false)
                                 {
                                    if(aCEmultiB == false)
                                    {
                                       if(dGlobal.rastroLib == 0)
                                       {
                                          if(root["pontosGraf"].currentFrame < 11)
                                          {
                                             if(antiCE == 1)
                                             {
                                                dGlobal.pontos = dGlobal.pontos + 0.1017;
                                             }
                                             else
                                             {
                                                dGlobal.pontos2 = dGlobal.pontos2 + 0.1017;
                                             }
                                             dGlobal.pontosG = dGlobal.pontosG + 0.102;
                                             dGlobal.rastros = dGlobal.rastros + 0.102;
                                          }
                                          else if(root["pontosGraf"].currentFrame < 21)
                                          {
                                             if(antiCE == 1)
                                             {
                                                dGlobal.pontos = dGlobal.pontos + 0.1217;
                                             }
                                             else
                                             {
                                                dGlobal.pontos2 = dGlobal.pontos2 + 0.1217;
                                             }
                                             dGlobal.pontosG = dGlobal.pontosG + 0.1217;
                                             dGlobal.rastros = dGlobal.rastros + 0.1217;
                                          }
                                          else if(root["pontosGraf"].currentFrame < 31)
                                          {
                                             if(antiCE == 1)
                                             {
                                                dGlobal.pontos = dGlobal.pontos + 0.1317;
                                             }
                                             else
                                             {
                                                dGlobal.pontos2 = dGlobal.pontos2 + 0.1317;
                                             }
                                             dGlobal.pontosG = dGlobal.pontosG + 0.1317;
                                             dGlobal.rastros = dGlobal.rastros + 0.1317;
                                          }
                                          else if(root["pontosGraf"].currentFrame == 31)
                                          {
                                             if(antiCE == 1)
                                             {
                                                dGlobal.pontos = dGlobal.pontos + 0.1217;
                                             }
                                             else
                                             {
                                                dGlobal.pontos2 = dGlobal.pontos2 + 0.1217;
                                             }
                                             dGlobal.pontosG = dGlobal.pontosG + 0.1217;
                                             dGlobal.rastros = dGlobal.rastros + 0.1217;
                                          }
                                          else if(root["pontosGraf"].currentFrame < 42)
                                          {
                                             if(antiCE == 1)
                                             {
                                                dGlobal.pontos = dGlobal.pontos + 0.1217;
                                             }
                                             else
                                             {
                                                dGlobal.pontos2 = dGlobal.pontos2 + 0.1217;
                                             }
                                             dGlobal.pontosG = dGlobal.pontosG + 0.1217;
                                             dGlobal.rastros = dGlobal.rastros + 0.1217;
                                          }
                                          else if(root["pontosGraf"].currentFrame < 52)
                                          {
                                             if(antiCE == 1)
                                             {
                                                dGlobal.pontos = dGlobal.pontos + 0.1417;
                                             }
                                             else
                                             {
                                                dGlobal.pontos2 = dGlobal.pontos2 + 0.1417;
                                             }
                                             dGlobal.pontosG = dGlobal.pontosG + 0.1417;
                                             dGlobal.rastros = dGlobal.rastros + 0.1417;
                                          }
                                          else if(root["pontosGraf"].currentFrame < 62)
                                          {
                                             if(antiCE == 1)
                                             {
                                                dGlobal.pontos = dGlobal.pontos + 0.1617;
                                             }
                                             else
                                             {
                                                dGlobal.pontos2 = dGlobal.pontos2 + 0.1617;
                                             }
                                             dGlobal.pontosG = dGlobal.pontosG + 0.1617;
                                             dGlobal.rastros = dGlobal.rastros + 0.1617;
                                          }
                                          else if(root["pontosGraf"].currentFrame == 62)
                                          {
                                             if(antiCE == 1)
                                             {
                                                dGlobal.pontos = dGlobal.pontos + 0.1817;
                                             }
                                             else
                                             {
                                                dGlobal.pontos2 = dGlobal.pontos2 + 0.1817;
                                             }
                                             dGlobal.pontosG = dGlobal.pontosG + 0.1817;
                                             dGlobal.rastros = dGlobal.rastros + 0.1817;
                                          }
                                       }
                                       else
                                       {
                                          dGlobal.rastroLib--;
                                       }
                                    }
                                    if(dGlobal.especial == false)
                                    {
                                       if(mc[i][4] == 1)
                                       {
                                          mc[i][9].mascaraA.transform.colorTransform = new ColorTransform(0,0,0,1,0,255,0,0);
                                       }
                                       else if(mc[i][4] == 2)
                                       {
                                          mc[i][9].mascaraA.transform.colorTransform = new ColorTransform(0,0,0,1,204,0,0,0);
                                       }
                                       else if(mc[i][4] == 3)
                                       {
                                          mc[i][9].mascaraA.transform.colorTransform = new ColorTransform(0,0,0,1,255,255,0,0);
                                       }
                                       else if(mc[i][4] == 4)
                                       {
                                          mc[i][9].mascaraA.transform.colorTransform = new ColorTransform(0,0,0,1,51,153,204,0);
                                       }
                                       else if(mc[i][4] == 5)
                                       {
                                          mc[i][9].mascaraA.transform.colorTransform = new ColorTransform(0,0,0,1,255,102,0,0);
                                       }
                                    }
                                 }
                              }
                           }
                        }
                        if(dGlobal.posicaoRel > mc[i][8])
                        {
                           mc[i][10] = mc[i][10] + velocidade;
                           if(mc[i][10] < mc[i][9].mascaraA.height)
                           {
                              mc[i][9].mascaraA.height = mc[i][9].mascaraA.height - mc[i][10];
                           }
                           else
                           {
                              root["fogo" + mc[i][4]].gotoAndStop(1);
                              deletarNota(i);
                              apagou = true;
                              i = i - 1;
                           }
                        }
                     }
                  }
                  else
                  {
                     mc[i][3] = mc[i][3] + velocidade;
                     mc[i][0].x = Number(mc[i][0].y) * 100 / 370 * Number(mc[i][1]) / 100 * -1 + Number(mc[i][2]);
                     mc[i][0].scaleX = 0.15 + Number(mc[i][0].y) * 100 / 370 * escala / 100;
                     mc[i][0].scaleY = 0.15 + Number(mc[i][0].y) * 100 / 370 * escala / 100;
                     mc[i][0].y = mc[i][0].y + Number(mc[i][3]);
                     if(mc[i][8] != 0)
                     {
                        if(dGlobal.posicaoRel > mc[i][8])
                        {
                           mc[i][10] = mc[i][10] + velocidade;
                           mc[i][9].mascaraA.height = mc[i][9].mascaraA.height + mc[i][3];
                           mc[i][9].mascaraA.height = mc[i][9].mascaraA.height - mc[i][10];
                        }
                        else if(mc[i][9].mascaraA.height < 350)
                        {
                           mc[i][9].mascaraA.height = mc[i][9].mascaraA.height + mc[i][3];
                        }
                        mc[i][9].mascaraA.y = mc[i][0].y - 60;
                     }
                     if(dGlobal.especial == true)
                     {
                        if(mc[i][0].currentFrame == 1 || mc[i][0].currentFrame == 3)
                        {
                           mc[i][0].gotoAndStop(4);
                        }
                        else if(mc[i][0].currentFrame == 5 || mc[i][0].currentFrame == 6)
                        {
                           mc[i][0].gotoAndStop(7);
                        }
                        if(mc[i][8] != 0)
                        {
                           mc[i][9].mascaraA.transform.colorTransform = new ColorTransform(0,0,0,1,0,204,255,0);
                        }
                     }
                     else
                     {
                        if(mc[i][0].currentFrame == 4 || mc[i][0].currentFrame == 7)
                        {
                           if(mc[i][6] == 1 && tirarSP == false)
                           {
                              if(mc[i][7] == 0)
                              {
                                 mc[i][0].gotoAndStop(3);
                              }
                              else
                              {
                                 mc[i][0].gotoAndStop(6);
                              }
                           }
                           else if(mc[i][7] == 0)
                           {
                              mc[i][0].gotoAndStop(1);
                           }
                           else
                           {
                              mc[i][0].gotoAndStop(5);
                           }
                        }
                        if(mc[i][8] != 0)
                        {
                           if(mc[i][4] == 1)
                           {
                              mc[i][9].mascaraA.transform.colorTransform = new ColorTransform(0,0,0,1,0,255,0,0);
                           }
                           else if(mc[i][4] == 2)
                           {
                              mc[i][9].mascaraA.transform.colorTransform = new ColorTransform(0,0,0,1,204,0,0,0);
                           }
                           else if(mc[i][4] == 3)
                           {
                              mc[i][9].mascaraA.transform.colorTransform = new ColorTransform(0,0,0,1,255,255,0,0);
                           }
                           else if(mc[i][4] == 4)
                           {
                              mc[i][9].mascaraA.transform.colorTransform = new ColorTransform(0,0,0,1,51,153,204,0);
                           }
                           else if(mc[i][4] == 5)
                           {
                              mc[i][9].mascaraA.transform.colorTransform = new ColorTransform(0,0,0,1,255,102,0,0);
                           }
                        }
                     }
                     if(tirarSP == true && (mc[i][0].currentFrame == 3 || mc[i][0].currentFrame == 6))
                     {
                        mc[i][0].gotoAndStop(1);
                     }
                     if(mc[i][6] == 0 && dGlobal.especial == 0)
                     {
                        tirarSP = false;
                     }
                     if(mc[i][0].y > 270)
                     {
                        if(xmlTempo[mc[i][5]] < xmlNotas.length())
                        {
                           if(Number(xmlTempo[mc[i][5]]) == Number(xmlTempo[Number(mc[i][5]) + 1]))
                           {
                              igual = true;
                           }
                        }
                        if(xmlTempo[mc[i][5]] > 0)
                        {
                           if(Number(xmlTempo[mc[i][5]]) == Number(xmlTempo[Number(mc[i][5]) - 1]))
                           {
                              igual = true;
                           }
                        }
                        if((root["paleta" + mc[i][4]].currentFrame == 3 || root["paleta" + mc[i][4]].currentFrame == 4 || dGlobal["fret" + mc[i][4]] == true && mc[i][7] != 0 || root["paleta" + mc[i][4]].currentFrame == 6 && mc[i][7] == 2 && root["pontosGraf"].currentFrame != 1) && mc[i][0].currentFrame != 2)
                        {
                           j = 1;
                           while(j < Number(mc[i][4]))
                           {
                              if(root["paleta" + j].currentFrame != 1)
                              {
                                 if(igual == false)
                                 {
                                    teclas[j] = true;
                                 }
                              }
                              j++;
                           }
                           if(mc[i][5] < xmlNotas.length())
                           {
                              if((mc[i][0].currentFrame == 3 || mc[i][0].currentFrame == 6) && dGlobal.especial == false)
                              {
                                 if(xmlTempo[Number(mc[i][5])] != xmlTempo[Number(mc[i][5]) + 1] && xmlTempo[Number(mc[i][5])] != xmlTempo[Number(mc[i][5]) - 1])
                                 {
                                    if(xmlEspecial[Number(mc[i][5]) + 1] == 0)
                                    {
                                       if(i != 0)
                                       {
                                          if(mc[i - 1][6] == 0 || mc[i - 1][0].currentFrame == 2)
                                          {
                                             trovaoSP(i);
                                          }
                                       }
                                       else
                                       {
                                          trovaoSP(i);
                                       }
                                    }
                                 }
                                 else
                                 {
                                    j = 1;
                                    while(j < 6)
                                    {
                                       if(xmlTempo[Number(mc[i][5])] == xmlTempo[Number(mc[i][5]) + j])
                                       {
                                          if(!(mc[i + j][6] == 0 || mc[i + j][0].currentFrame == 2))
                                          {
                                             j = 6;
                                          }
                                       }
                                       else if(Number(mc[i][5]) + j < xmlNotas.length() && i + j < mc.length)
                                       {
                                          if(xmlEspecial[Number(mc[i + j][5])] == 1)
                                          {
                                             j = 6;
                                          }
                                       }
                                       if(xmlTempo[Number(mc[i][5])] == xmlTempo[Number(mc[i][5]) - j])
                                       {
                                          if(i != 0)
                                          {
                                             if(!(mc[i - j][6] == 0 || mc[i - j][0].currentFrame == 2))
                                             {
                                                j = 6;
                                             }
                                          }
                                       }
                                       if(j == 5)
                                       {
                                          trovaoSP(i);
                                       }
                                       j++;
                                    }
                                 }
                              }
                              else if(dGlobal.especial == true && mc[i][6] == 1)
                              {
                                 tirarSP = true;
                              }
                           }
                           root["paleta" + mc[i][4]].gotoAndStop(6);
                           if(dGlobal.especial == true)
                           {
                              if(ultNotaA == false)
                              {
                                 priNotaSP = mc[i][5];
                                 dGlobal.notasSP = dGlobal.notasSP + mc[i][5] + "-";
                                 especialP = dGlobal.especialP;
                              }
                              ultNotaSP = mc[i][5];
                              if(especialP == 20 && xmlTempo[ultNotaSP] - xmlTempo[priNotaSP] > 7.8)
                              {
                                 especialT = true;
                              }
                              if(especialP == 30 && xmlTempo[ultNotaSP] - xmlTempo[priNotaSP] > 11.9)
                              {
                                 especialT = true;
                              }
                              if(especialP == 40 && xmlTempo[ultNotaSP] - xmlTempo[priNotaSP] > 16)
                              {
                                 especialT = true;
                              }
                              if(especialT == false && xmlTempo[ultNotaSP] - xmlTempo[priNotaSP] > 18)
                              {
                                 especialT2 = true;
                              }
                              if(especialT == true)
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
                              ultNotaA = true;
                              if(mc[i][11] == true)
                              {
                                 atrasouNA = true;
                              }
                              else
                              {
                                 atrasouNA = false;
                              }
                           }
                           else
                           {
                              if(ultNotaA == true)
                              {
                                 dGlobal.notasSP = dGlobal.notasSP + ultNotaSP + "/";
                              }
                              atrasouNA = false;
                              ultNotaA = false;
                           }
                           if(mc[i][8] == 0)
                           {
                              root["fogo" + mc[i][4]].gotoAndPlay(4);
                              deletarNota(i);
                              apagou = true;
                              i = i - 1;
                           }
                           else
                           {
                              root["fogo" + mc[i][4]].gotoAndPlay("seq");
                              mc[i][0].gotoAndStop(2);
                              if(root["pontosGraf"].currentFrame < 11)
                              {
                                 dGlobal.rastroCont = dGlobal.rastroCont + xmlRastro[mc[i][5]] * 2.38;
                              }
                              else if(root["pontosGraf"].currentFrame < 21)
                              {
                                 dGlobal.rastroCont = dGlobal.rastroCont + xmlRastro[mc[i][5]] * 2.86;
                              }
                              else if(root["pontosGraf"].currentFrame < 31)
                              {
                                 dGlobal.rastroCont = dGlobal.rastroCont + xmlRastro[mc[i][5]] * 3.1;
                              }
                              else if(root["pontosGraf"].currentFrame == 31)
                              {
                                 dGlobal.rastroCont = dGlobal.rastroCont + xmlRastro[mc[i][5]] * 2.86;
                              }
                              else if(root["pontosGraf"].currentFrame < 42)
                              {
                                 dGlobal.rastroCont = dGlobal.rastroCont + xmlRastro[mc[i][5]] * 2.86;
                              }
                              else if(root["pontosGraf"].currentFrame < 52)
                              {
                                 dGlobal.rastroCont = dGlobal.rastroCont + xmlRastro[mc[i][5]] * 3.34;
                              }
                              else if(root["pontosGraf"].currentFrame < 62)
                              {
                                 dGlobal.rastroCont = dGlobal.rastroCont + xmlRastro[mc[i][5]] * 3.82;
                              }
                              else if(root["pontosGraf"].currentFrame == 62)
                              {
                                 dGlobal.rastroCont = dGlobal.rastroCont + xmlRastro[mc[i][5]] * 4.3;
                              }
                           }
                           notaAcertada(atrasouNA);
                        }
                     }
                     igual = false;
                  }
               }
               if((dGlobal.reiniciar == true || rock == true) && apagou == false)
               {
                  deletarNota(i);
               }
               i++;
            }
            apagou = false;
            acertou = false;
            root["pontosMarq2"].voce.height = 324 * (dGlobal.pontosG * 100 / dGlobal.ptsMax) / 100;
            root["pontosMarq2"].barraVoce.y = 314.6 - root["pontosMarq2"].voce.height;
            if(dGlobal.ptsAmigo != 0)
            {
               root["pontosMarq2"].amigo.height = 324 * (dGlobal.ptsAmigo * (notasDel * 100 / xmlNotas.length()) / 100 * 100 / dGlobal.ptsMax) / 100;
               root["pontosMarq2"].barraAmigo.y = 314.6 - root["pontosMarq2"].amigo.height;
            }
            if(dGlobal.pontosG > dGlobal.ptsBest)
            {
               root["mensagem"].mensagem.mensagem.gotoAndStop(42);
               root["mensagem"].play();
               dGlobal.ptsBest = 999000;
               root["pontosMarq2"].melhor.play();
            }
            j = 1;
            while(j < 6)
            {
               if(teclas[j] == true)
               {
                  root["paleta" + j].gotoAndStop(6);
               }
               teclas[j] = false;
               dGlobal["fret" + j] = false;
               j++;
            }
            if(dGlobal.posicao > Number(xmlTotal) && rock == false)
            {
               dGlobal.rockVF = true;
               dGlobal.jogadaTotal = true;
               rock = true;
            }
            else
            {
               if(dGlobal.posicao > Number(som.m1G.length / 1000 - 1) && rock == false)
               {
                  if(dGlobal.jogadaTotal == true)
                  {
                     dGlobal.rockVF = true;
                     dGlobal.jogadaTotal = true;
                     rock = true;
                  }
                  else
                  {
                     dGlobal.travarPause = true;
                     dGlobal.erroCar = true;
                     root["rockAcertos"].gotoAndStop(1);
                     rock = true;
                  }
               }
               if(root["rockAcertos"].currentFrame == 1)
               {
                  rock = true;
               }
            }
            if(root["rockAcertos"].currentFrame == 62)
            {
               retirar_mc();
            }
         }
         posiAnt = dGlobal.posicaoRel;
      }
      
      private function trovaoSP(param1:Number) : *
      {
         root["trovao" + mc[param1][4]].gotoAndPlay(2);
         dGlobal.espP = Number(dGlobal.espP) + 1;
         if(root["trovao" + mc[param1][4]].currentFrame < 8)
         {
            som.exB1 = true;
         }
         if(dGlobal.especial == false)
         {
            if(dGlobal.especialP < 40)
            {
               root["rockEspecial"].play();
            }
            if(dGlobal.especialP == 0 && dGlobal.aCEsp == 208)
            {
               dGlobal.aCEsp = 198;
               dGlobal.especialP = 10;
            }
            else if(dGlobal.especialP == 10 && dGlobal.aCEsp == 198)
            {
               dGlobal.aCEsp = 188;
               dGlobal.especialP = 20;
            }
            else if(dGlobal.especialP == 20 && dGlobal.aCEsp == 188)
            {
               dGlobal.aCEsp = 178;
               dGlobal.especialP = 30;
            }
            else if(dGlobal.especialP == 30 && dGlobal.aCEsp == 178)
            {
               dGlobal.aCEsp = 168;
               dGlobal.especialP = 40;
            }
         }
         tirarSP = false;
      }
      
      private function notaAcertada(param1:Boolean) : *
      {
         if(dGlobal.semGuitarra == 1)
         {
            dGlobal.controle = true;
         }
         if(dGlobal.especial == false || especialT == true || especialT2 == true || param1 == true)
         {
            if(dGlobal.especial == false)
            {
               especialT = false;
            }
            if(param1 == true)
            {
               dGlobal.contErSP++;
            }
            if(dGlobal.especial == false || especialT == true)
            {
               if(root["pontosGraf"].currentFrame > 31)
               {
                  root["pontosGraf"].gotoAndStop(root["pontosGraf"].currentFrame - 31);
               }
               if(dGlobal.aCEmulti < 73)
               {
                  dGlobal.aCEmulti = dGlobal.aCEmulti + 31;
               }
               if(aCEmultiB == false)
               {
                  if(root["pontosGraf"].currentFrame < 11)
                  {
                     if(antiCE == 1)
                     {
                        dGlobal.pontos = dGlobal.pontos + 5;
                     }
                     else
                     {
                        dGlobal.pontos2 = dGlobal.pontos2 + 5;
                     }
                     dGlobal.pontosG = dGlobal.pontosG + 5;
                  }
                  else if(root["pontosGraf"].currentFrame < 21)
                  {
                     if(antiCE == 1)
                     {
                        dGlobal.pontos = dGlobal.pontos + 10;
                     }
                     else
                     {
                        dGlobal.pontos2 = dGlobal.pontos2 + 10;
                     }
                     dGlobal.pontosG = dGlobal.pontosG + 10;
                  }
                  else if(root["pontosGraf"].currentFrame < 31)
                  {
                     if(antiCE == 1)
                     {
                        dGlobal.pontos = dGlobal.pontos + 15;
                     }
                     else
                     {
                        dGlobal.pontos2 = dGlobal.pontos2 + 15;
                     }
                     dGlobal.pontosG = dGlobal.pontosG + 15;
                  }
                  else if(root["pontosGraf"].currentFrame == 31)
                  {
                     if(antiCE == 1)
                     {
                        dGlobal.pontos = dGlobal.pontos + 20;
                     }
                     else
                     {
                        dGlobal.pontos2 = dGlobal.pontos2 + 20;
                     }
                     dGlobal.pontosG = dGlobal.pontosG + 20;
                  }
               }
               if(root["pontosGraf"].currentFrame != 31)
               {
                  root["pontosGraf"].nextFrame();
               }
               if(dGlobal.aCEmulti != 74)
               {
                  dGlobal.aCEmulti--;
               }
            }
         }
         else
         {
            if(root["pontosGraf"].currentFrame < 32)
            {
               root["pontosGraf"].gotoAndStop(root["pontosGraf"].currentFrame + 31);
            }
            if(dGlobal.aCEmulti > 73)
            {
               dGlobal.aCEmulti = dGlobal.aCEmulti - 31;
            }
            if(aCEmultiB == false)
            {
               if(dGlobal.frameMus < 23)
               {
                  dGlobal.frameErMus++;
               }
               else if(root["pontosGraf"].currentFrame < 42)
               {
                  if(antiCE == 1)
                  {
                     dGlobal.pontos = dGlobal.pontos + 10;
                  }
                  else
                  {
                     dGlobal.pontos2 = dGlobal.pontos2 + 10;
                  }
                  dGlobal.pontosG = dGlobal.pontosG + 10;
               }
               else if(root["pontosGraf"].currentFrame < 52)
               {
                  if(antiCE == 1)
                  {
                     dGlobal.pontos = dGlobal.pontos + 20;
                  }
                  else
                  {
                     dGlobal.pontos2 = dGlobal.pontos2 + 20;
                  }
                  dGlobal.pontosG = dGlobal.pontosG + 20;
               }
               else if(root["pontosGraf"].currentFrame < 62)
               {
                  if(antiCE == 1)
                  {
                     dGlobal.pontos = dGlobal.pontos + 30;
                  }
                  else
                  {
                     dGlobal.pontos2 = dGlobal.pontos2 + 30;
                  }
                  dGlobal.pontosG = dGlobal.pontosG + 30;
               }
               else if(root["pontosGraf"].currentFrame == 62)
               {
                  if(antiCE == 1)
                  {
                     dGlobal.pontos = dGlobal.pontos + 40;
                  }
                  else
                  {
                     dGlobal.pontos2 = dGlobal.pontos2 + 40;
                  }
                  dGlobal.pontosG = dGlobal.pontosG + 40;
               }
            }
            root["vcEstatisticas"].estAcertadasSP.text = Number(root["vcEstatisticas"].estAcertadasSP.text) + 1;
            if(root["pontosGraf"].currentFrame != 62)
            {
               root["pontosGraf"].nextFrame();
            }
            if(dGlobal.aCEmulti != 43)
            {
               dGlobal.aCEmulti--;
            }
         }
         if(root["rockAcertos"].currentFrame < 61)
         {
            if(dGlobal.especial == false)
            {
               root["rockAcertos"].gotoAndStop(root["rockAcertos"].currentFrame + 1);
            }
            else if(root["rockAcertos"].currentFrame < 60)
            {
               root["rockAcertos"].gotoAndStop(root["rockAcertos"].currentFrame + 2);
            }
            else
            {
               root["rockAcertos"].gotoAndStop(root["rockAcertos"].currentFrame + 1);
            }
         }
         root["vcEstatisticas"].estAcertadas.text = Number(root["vcEstatisticas"].estAcertadas.text) + 1;
         root["vcEstatisticas"].estComboM.text = Number(root["vcEstatisticas"].estComboM.text) + 1;
         if(root["vcEstatisticas"].estComboM.text % 100 == 0 && root["vcEstatisticas"].estComboM.text < 3901)
         {
            root["mensagem"].mensagem.mensagem.gotoAndStop(root["vcEstatisticas"].estComboM.text / 100 + 2);
            root["mensagem"].play();
         }
         if(root["vcEstatisticas"].estComboM.text == 50)
         {
            root["mensagem"].mensagem.mensagem.gotoAndStop(2);
            root["mensagem"].play();
         }
      }
      
      private function criarNota(param1:uint, param2:Number, param3:Number, param4:uint, param5:uint, param6:Boolean) : *
      {
         if(param1 == 1)
         {
            if(param3 != 0)
            {
               mc.push([new pal1(),213,305,0,1,param2,param4,param5,param3,new mascara1(),0,param6,0]);
            }
            else
            {
               mc.push([new pal1(),213,305,0,1,param2,param4,param5,param3,0,0,param6,0]);
            }
         }
         else if(param1 == 2)
         {
            if(param3 != 0)
            {
               mc.push([new pal2(),125,323,0,2,param2,param4,param5,param3,new mascara2(),0,param6,0]);
            }
            else
            {
               mc.push([new pal2(),125,323,0,2,param2,param4,param5,param3,0,0,param6,0]);
            }
         }
         else if(param1 == 3)
         {
            if(param3 != 0)
            {
               mc.push([new pal3(),33,341,0,3,param2,param4,param5,param3,new mascara3(),0,param6,0]);
            }
            else
            {
               mc.push([new pal3(),33,341,0,3,param2,param4,param5,param3,0,0,param6,0]);
            }
         }
         else if(param1 == 4)
         {
            if(param3 != 0)
            {
               mc.push([new pal4(),-58,359,0,4,param2,param4,param5,param3,new mascara4(),0,param6,0]);
            }
            else
            {
               mc.push([new pal4(),-58,359,0,4,param2,param4,param5,param3,0,0,param6,0]);
            }
         }
         else if(param1 == 5)
         {
            if(param3 != 0)
            {
               mc.push([new pal5(),-145,377,0,5,param2,param4,param5,param3,new mascara5(),0,param6,0]);
            }
            else
            {
               mc.push([new pal5(),-145,377,0,5,param2,param4,param5,param3,0,0,param6,0]);
            }
         }
         if(String(xmlTempo[param2] / 0.125).indexOf(".") == -1)
         {
            mc[mc.length - 1][3] = velocidade;
         }
         else
         {
            mc[mc.length - 1][3] = velocidade + velocidade / 2;
         }
         addChild(mc[mc.length - 1][0]);
         if(mc[mc.length - 1][8] != 0)
         {
            this.setChildIndex(this.getChildAt(this.numChildren - 1),0);
            addChild(mc[mc.length - 1][9]);
            mc[mc.length - 1][9].y = 57;
            mc[mc.length - 1][8] = xmlTempo[param2] - dGlobal.atrasoTR + param3 - 0.2;
            mc[mc.length - 1][12] = Math.floor(23.9 * param3);
            if(param1 == 1)
            {
               mc[mc.length - 1][9].x = 150.2;
            }
            else if(param1 == 2)
            {
               mc[mc.length - 1][9].x = 190.9;
            }
            else if(param1 == 3)
            {
               mc[mc.length - 1][9].x = 218.9;
            }
            else if(param1 == 4)
            {
               mc[mc.length - 1][9].x = 239.9;
            }
            else if(param1 == 5)
            {
               mc[mc.length - 1][9].x = 249.1;
            }
         }
         if(param4 == 0)
         {
            if(param5 != 0)
            {
               mc[mc.length - 1][0].gotoAndStop(5);
            }
         }
         else if(param5 != 0)
         {
            mc[mc.length - 1][0].gotoAndStop(6);
         }
         else
         {
            mc[mc.length - 1][0].gotoAndStop(3);
         }
         this.setChildIndex(this.getChildAt(this.numChildren - 1),0);
      }
      
      private function deletarNota(param1:Number) : *
      {
         if(mc[param1][8] != 0)
         {
            removeChild(MovieClip(mc[param1][9]));
            mc[param1][9] = null;
         }
         removeChild(MovieClip(mc[param1][0]));
         mc[param1][0] = null;
         mc.splice(param1,1);
         notasDel++;
      }
      
      private function retirar_mc() : *
      {
      }
   }
}
