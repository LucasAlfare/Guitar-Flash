package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.external.ExternalInterface;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class btPMreplay extends MovieClip
   {
       
      
      private var intervalo:Number;
      
      public function btPMreplay()
      {
         super();
         this.alpha = 0.6;
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,clique);
         this.addEventListener(MouseEvent.MOUSE_OVER,sobre);
         this.addEventListener(MouseEvent.MOUSE_OUT,fora);
      }
      
      private function clique(param1:MouseEvent) : void
      {
         dGlobal.idDuelo = 0;
         dGlobal.ptsAmigo = 0;
         dGlobal.idAmigo = "0";
         root["pontosMarq2"].amigo.height = 0;
         root["pontosMarq2"].barraAmigo.y = 314.6;
         root["pontosMarq2"].barraAmigo.visible = false;
         dGlobal.duelo = false;
         ExternalInterface.call("dadosInfo");
         dGlobal.posicao = 0;
         dGlobal.contErSP = 0;
         dGlobal.frameErMus = 0;
         root["pontosMarq2"].melhor.y = 314.6 - 324 * (dGlobal.ptsBest * 100 / dGlobal.ptsMax) / 100;
         root["pontosMarq2"].melhor.visible = true;
         intervalo = setInterval(tempo,10);
         root["vcEstatisticas"].alpha = 1;
         root["vcEstatisticas"].y = -10;
      }
      
      function tempo() : *
      {
         if(root["vcEstatisticas"].alpha < 0.1)
         {
            dGlobal.somLiberado = true;
            dGlobal.reiniciar = true;
            dGlobal.mPause = false;
            dGlobal.mDPause = true;
            dGlobal.travarPause = false;
            root["vcEstatisticas"].estAcertadasSP.text = 0;
            root["vcEstatisticas"].estAcertadas.text = 0;
            root["vcEstatisticas"].estPerdidas.text = 0;
            root["vcEstatisticas"].estErradas.text = 0;
            root["vcEstatisticas"].estCombo.text = 0;
            root["vcEstatisticas"].estComboM.text = 0;
            root["vcEstatisticas"].y = -490.5;
            root["animaPista"].visible = true;
            root["animaPista"].gotoAndPlay(2);
            dGlobal.espT = 0;
            dGlobal.espP = 0;
            dGlobal.mEPause = false;
            dGlobal.pontos = 0;
            dGlobal.pontos2 = 0;
            dGlobal.pontosG = 0;
            dGlobal.rastros = 0;
            root["pontosMarq"].pontos1.text = "";
            root["pontosMarq"].pontos2.text = "";
            root["pontosMarq"].pontos3.text = "";
            root["pontosMarq"].pontos4.text = "";
            root["pontosMarq"].pontos5.text = "";
            root["pontosMarq"].pontos6.text = "";
            root["pontosGraf"].gotoAndStop(1);
            root["fogo1"].gotoAndStop(1);
            root["fogo2"].gotoAndStop(1);
            root["fogo3"].gotoAndStop(1);
            root["fogo4"].gotoAndStop(1);
            root["fogo5"].gotoAndStop(1);
            dGlobal.rastroCont = 0;
            dGlobal.rastroLib = 0;
            dGlobal.botTec = 0;
            clearInterval(intervalo);
         }
         else
         {
            root["vcEstatisticas"].alpha = root["vcEstatisticas"].alpha - 0.1;
         }
      }
      
      private function sobre(param1:MouseEvent) : void
      {
         this.alpha = 1;
      }
      
      private function fora(param1:MouseEvent) : void
      {
         this.alpha = 0.6;
      }
   }
}
