package fl.controls.listClasses
{
   public interface ICellRenderer
   {
       
      
      function setSize(param1:Number, param2:Number) : void;
      
      function get listData() : ListData;
      
      function get data() : Object;
      
      function setMouseState(param1:String) : void;
      
      function set x(param1:Number) : void;
      
      function set y(param1:Number) : void;
      
      function set data(param1:Object) : void;
      
      function set selected(param1:Boolean) : void;
      
      function set listData(param1:ListData) : void;
      
      function get selected() : Boolean;
   }
}
