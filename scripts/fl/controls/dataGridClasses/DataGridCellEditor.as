package fl.controls.dataGridClasses
{
   import fl.controls.TextInput;
   import fl.controls.listClasses.ICellRenderer;
   import fl.controls.listClasses.ListData;
   
   public class DataGridCellEditor extends TextInput implements ICellRenderer
   {
      
      private static var defaultStyles:Object = {
         "textPadding":1,
         "textFormat":null,
         "upSkin":"DataGridCellEditor_skin"
      };
       
      
      protected var _data:Object;
      
      protected var _listData:ListData;
      
      public function DataGridCellEditor()
      {
         super();
      }
      
      public static function getStyleDefinition() : Object
      {
         return defaultStyles;
      }
      
      public function get selected() : Boolean
      {
         return false;
      }
      
      public function set listData(param1:ListData) : void
      {
         _listData = param1;
         text = _listData.label;
      }
      
      public function setMouseState(param1:String) : void
      {
      }
      
      public function set selected(param1:Boolean) : void
      {
      }
      
      public function set data(param1:Object) : void
      {
         _data = param1;
      }
      
      public function get listData() : ListData
      {
         return _listData;
      }
      
      public function get data() : Object
      {
         return _data;
      }
   }
}
