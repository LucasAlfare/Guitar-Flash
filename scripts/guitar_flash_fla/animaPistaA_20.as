package guitar_flash_fla
{
   import flash.display.MovieClip;
   
   public dynamic class animaPistaA_20 extends MovieClip
   {
       
      
      public function animaPistaA_20()
      {
         super();
         addFrameScript(0,frame1,10,frame11,21,frame22);
      }
      
      function frame1() : *
      {
         stop();
      }
      
      function frame11() : *
      {
         stop();
         visible = false;
         root["paleta1"].visible = true;
         root["paleta2"].visible = true;
         root["paleta3"].visible = true;
         root["paleta4"].visible = true;
         root["paleta5"].visible = true;
         root["pista"].visible = true;
         root["rockAcertos"].visible = true;
         root["rockEspecial"].visible = true;
         root["pontosGraf"].visible = true;
         root["pontosMarq"].visible = true;
         root["pontosMarq2"].visible = true;
      }
      
      function frame22() : *
      {
         stop();
      }
   }
}
