package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   
   public class btLetras extends MovieClip
   {
       
      
      private var botao:Number = 0;
      
      private var letra:String = "";
      
      private var nletra:uint = 0;
      
      private var travar:Boolean = false;
      
      private var i:int;
      
      private var ii:int;
      
      private var config:Boolean = false;
      
      public function btLetras()
      {
         super();
         addFrameScript(0,frame1,5,frame6);
         addEventListener(Event.ENTER_FRAME,loop);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,tcEntra);
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,clique);
         this.addEventListener(MouseEvent.MOUSE_OVER,sobre);
         this.addEventListener(MouseEvent.MOUSE_OUT,fora);
      }
      
      private function loop(param1:Event) : *
      {
         if(config == false)
         {
            letra = ltrEsp.ltr(dGlobal["ltt" + this.name.slice(2)]);
            parent["lt" + this.name.slice(2)].text = letra;
            letra = "";
            config = true;
         }
         i = 1;
         while(i < 17)
         {
            if(botao == i)
            {
               ii = 1;
               while(ii < 17)
               {
                  if(parent["bt" + ii].currentFrame > 2)
                  {
                     if(botao == i && parent["bt" + i].currentFrame < 3)
                     {
                        nletra = 0;
                        letra = "";
                        botao = 0;
                        travar = false;
                     }
                  }
                  ii++;
               }
            }
            if(botao == i && letra != "" && parent["bt" + i].currentFrame > 2)
            {
               parent["lt" + i].text = letra;
               dGlobal["ltt" + i] = nletra;
               nletra = 0;
               letra = "";
               botao = 0;
               travar = false;
               parent["bt" + i].gotoAndStop(1);
            }
            i++;
         }
      }
      
      private function tcEntra(param1:KeyboardEvent) : void
      {
         if(botao != 0)
         {
            letra = ltrEsp.ltr(param1.keyCode);
            nletra = param1.keyCode;
            ii = 1;
            while(ii < 17)
            {
               if(Number(this.name.slice(2)) < 10 && ii < 10)
               {
                  if(nletra == dGlobal["ltt" + ii])
                  {
                     letra = "";
                     nletra = 0;
                  }
               }
               else if(Number(this.name.slice(2)) > 9 && ii > 9)
               {
                  if(nletra == dGlobal["ltt" + ii])
                  {
                     letra = "";
                     nletra = 0;
                  }
               }
               ii++;
            }
         }
      }
      
      private function clique(param1:MouseEvent) : void
      {
         ii = 1;
         while(ii < 17)
         {
            parent["bt" + ii].gotoAndStop(1);
            if(this.name == "bt" + ii)
            {
               botao = ii;
               parent["bt" + ii].gotoAndPlay(3);
            }
            ii++;
         }
         travar = true;
         letra = "";
         nletra = 0;
      }
      
      private function sobre(param1:MouseEvent) : void
      {
         if(travar == false)
         {
            gotoAndStop(2);
         }
      }
      
      private function fora(param1:MouseEvent) : void
      {
         if(travar == false)
         {
            gotoAndStop(1);
         }
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame6() : *
      {
         gotoAndPlay(3);
      }
   }
}
