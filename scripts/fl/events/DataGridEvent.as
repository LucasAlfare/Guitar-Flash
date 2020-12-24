package fl.events
{
   import flash.events.Event;
   
   public class DataGridEvent extends ListEvent
   {
      
      public static const ITEM_EDIT_BEGIN:String = "itemEditBegin";
      
      public static const ITEM_EDIT_END:String = "itemEditEnd";
      
      public static const ITEM_EDIT_BEGINNING:String = "itemEditBeginning";
      
      public static const HEADER_RELEASE:String = "headerRelease";
      
      public static const ITEM_FOCUS_IN:String = "itemFocusIn";
      
      public static const ITEM_FOCUS_OUT:String = "itemFocusOut";
      
      public static const COLUMN_STRETCH:String = "columnStretch";
       
      
      protected var _itemRenderer:Object;
      
      protected var _reason:String;
      
      protected var _dataField:String;
      
      public function DataGridEvent(param1:String, param2:Boolean = false, param3:Boolean = false, param4:int = -1, param5:int = -1, param6:Object = null, param7:String = null, param8:String = null)
      {
         super(param1,param2,param3,param4,param5);
         _itemRenderer = param6;
         _dataField = param7;
         _reason = param8;
      }
      
      public function get reason() : String
      {
         return _reason;
      }
      
      public function set dataField(param1:String) : void
      {
         _dataField = param1;
      }
      
      override public function toString() : String
      {
         return formatToString("DataGridEvent","type","bubbles","cancelable","columnIndex","rowIndex","itemRenderer","dataField","reason");
      }
      
      public function get dataField() : String
      {
         return _dataField;
      }
      
      override public function clone() : Event
      {
         return new DataGridEvent(type,bubbles,cancelable,columnIndex,int(rowIndex),_itemRenderer,_dataField,_reason);
      }
      
      public function get itemRenderer() : Object
      {
         return _itemRenderer;
      }
   }
}
