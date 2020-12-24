package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   public class btReiniciar extends MovieClip
   {
       
      
      public function btReiniciar()
      {
         super();
         addFrameScript(0,frame1,2,frame3);
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,clique);
         this.addEventListener(MouseEvent.MOUSE_OVER,sobre);
         this.addEventListener(MouseEvent.MOUSE_OUT,fora);
         if(dGlobal.idDuelo != 0)
         {
            this.buttonMode = false;
            this.gotoAndStop(3);
         }
      }
      
      private function clique(param1:MouseEvent) : void
      {
         if(dGlobal.idDuelo == 0)
         {
            MovieClip(parent).gotoAndStop(1);
            dGlobal.reiniciar = true;
            dGlobal.mPause = false;
            root["vcEstatisticas"].estAcertadasSP.text = 0;
            root["vcEstatisticas"].estAcertadas.text = 0;
            root["vcEstatisticas"].estPerdidas.text = 0;
            root["vcEstatisticas"].estErradas.text = 0;
            root["vcEstatisticas"].estCombo.text = 0;
            root["vcEstatisticas"].estComboM.text = 0;
            dGlobal.espT = 0;
            dGlobal.espP = 0;
            dGlobal.posicao = 0;
            dGlobal.contErSP = 0;
            dGlobal.frameErMus = 0;
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
         }
      }
      
      private function sobre(param1:MouseEvent) : void
      {
         if(dGlobal.idDuelo == 0)
         {
            gotoAndStop(2);
         }
      }
      
      private function fora(param1:MouseEvent) : void
      {
         if(dGlobal.idDuelo == 0)
         {
            gotoAndStop(1);
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
