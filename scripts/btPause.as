package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   
   public class btPause extends MovieClip
   {
       
      
      private var intervalo:Number;
      
      private var intervalo2:Number;
      
      private var intervalo3:Number;
      
      public function btPause()
      {
         super();
         addFrameScript(0,frame1);
         stage.addEventListener(KeyboardEvent.KEY_UP,tcEntra);
         stage.addEventListener(Event.DEACTIVATE,janelaPerdida);
      }
      
      private function janelaPerdida(param1:Event) : void
      {
         if(dGlobal.especial == false && root["contRgr"].visible == false && dGlobal.somLiberado == true && root["rockAcertos"].currentFrame != 62 && dGlobal.travarPause == false && dGlobal.posicao > 2 && dGlobal.jogadaTotal == false)
         {
            if(dGlobal.mEPause == false)
            {
               if(dGlobal.mPause == false && dGlobal.travarPause2 == false)
               {
                  dGlobal.mPause = true;
                  gotoAndStop(2);
                  dGlobal.mEPause = true;
                  dGlobal.travarPause2 = true;
                  intervalo2 = setInterval(tempo2,10);
                  root["mPause"].alpha = 0;
                  dGlobal.rastroLib = 12;
               }
            }
         }
      }
      
      private function tcEntra(param1:KeyboardEvent) : void
      {
         if(dGlobal.especial == false && param1.keyCode == dGlobal.lta8 && root["contRgr"].visible == false && dGlobal.somLiberado == true && root["rockAcertos"].currentFrame != 62 && dGlobal.travarPause == false && dGlobal.posicao > 2)
         {
            if(dGlobal.mEPause == false)
            {
               if(dGlobal.mPause == false && dGlobal.travarPause2 == false)
               {
                  dGlobal.mPause = true;
                  gotoAndStop(2);
                  dGlobal.mEPause = true;
                  dGlobal.travarPause2 = true;
                  intervalo2 = setInterval(tempo2,10);
                  root["mPause"].alpha = 0;
                  dGlobal.rastroLib = 12;
               }
            }
            else if(dGlobal.mPause == true && dGlobal.travarPause2 == true)
            {
               intervalo = setInterval(tempo,3500);
               intervalo3 = setInterval(tempo3,10);
               root["mPause"].alpha = 1;
               dGlobal.mPause = false;
            }
         }
      }
      
      function tempo() : *
      {
         dGlobal.travarPause2 = false;
         clearInterval(intervalo);
      }
      
      function tempo2() : *
      {
         if(root["mPause"].alpha > 0.9)
         {
            clearInterval(intervalo2);
         }
         else
         {
            root["mPause"].alpha = root["mPause"].alpha + 0.1;
         }
      }
      
      function tempo3() : *
      {
         if(root["mPause"].alpha < 0.1)
         {
            gotoAndStop(1);
            clearInterval(intervalo3);
         }
         else
         {
            root["mPause"].alpha = root["mPause"].alpha - 0.1;
         }
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
