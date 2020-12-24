package fl.controls.dataGridClasses
{
   import fl.controls.LabelButton;
   
   public class HeaderRenderer extends LabelButton
   {
      
      private static var defaultStyles:Object = {
         "upSkin":"HeaderRenderer_upSkin",
         "downSkin":"HeaderRenderer_downSkin",
         "overSkin":"HeaderRenderer_overSkin",
         "disabledSkin":"HeaderRenderer_disabledSkin",
         "selectedDisabledSkin":"HeaderRenderer_selectedDisabledSkin",
         "selectedUpSkin":"HeaderRenderer_selectedUpSkin",
         "selectedDownSkin":"HeaderRenderer_selectedDownSkin",
         "selectedOverSkin":"HeaderRenderer_selectedOverSkin",
         "textFormat":null,
         "disabledTextFormat":null,
         "textPadding":5
      };
       
      
      public var _column:uint;
      
      public function HeaderRenderer()
      {
         super();
         focusEnabled = false;
      }
      
      public static function getStyleDefinition() : Object
      {
         return defaultStyles;
      }
      
      public function set column(param1:uint) : void
      {
         _column = param1;
      }
      
      public function get column() : uint
      {
         return _column;
      }
      
      override protected function drawLayout() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         _loc1_ = Number(getStyleValue("textPadding"));
         textField.height = textField.textHeight + 4;
         textField.visible = label.length > 0;
         _loc2_ = textField.textWidth + 4;
         _loc3_ = textField.textHeight + 4;
         _loc4_ = icon == null?Number(0):Number(icon.width + 4);
         _loc5_ = Math.max(0,Math.min(_loc2_,width - 2 * _loc1_ - _loc4_));
         if(icon != null)
         {
            icon.x = width - _loc1_ - icon.width - 2;
            icon.y = Math.round((height - icon.height) / 2);
         }
         textField.width = _loc5_;
         textField.x = _loc1_;
         textField.y = Math.round((height - textField.height) / 2);
         background.width = width;
         background.height = height;
      }
   }
}
