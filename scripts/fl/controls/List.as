package fl.controls
{
   import fl.controls.listClasses.ICellRenderer;
   import fl.controls.listClasses.ListData;
   import fl.core.InvalidationType;
   import fl.core.UIComponent;
   import fl.managers.IFocusManagerComponent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   
   public class List extends SelectableList implements IFocusManagerComponent
   {
      
      private static var defaultStyles:Object = {
         "focusRectSkin":null,
         "focusRectPadding":null
      };
      
      public static var createAccessibilityImplementation:Function;
       
      
      protected var _labelField:String = "label";
      
      protected var _rowHeight:Number = 20;
      
      protected var _cellRenderer:Object;
      
      protected var _iconField:String = "icon";
      
      protected var _labelFunction:Function;
      
      protected var _iconFunction:Function;
      
      public function List()
      {
         _rowHeight = 20;
         _labelField = "label";
         _iconField = "icon";
         super();
      }
      
      public static function getStyleDefinition() : Object
      {
         return mergeStyles(defaultStyles,SelectableList.getStyleDefinition());
      }
      
      public function get iconField() : String
      {
         return _iconField;
      }
      
      protected function doKeySelection(param1:int, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         _loc4_ = false;
         if(param2)
         {
            _loc6_ = [];
            _loc7_ = lastCaretIndex;
            _loc8_ = param1;
            if(_loc7_ == -1)
            {
               _loc7_ = caretIndex != -1?int(caretIndex):int(param1);
            }
            if(_loc7_ > _loc8_)
            {
               _loc8_ = _loc7_;
               _loc7_ = param1;
            }
            _loc5_ = _loc7_;
            while(_loc5_ <= _loc8_)
            {
               _loc6_.push(_loc5_);
               _loc5_++;
            }
            selectedIndices = _loc6_;
            caretIndex = param1;
            _loc4_ = true;
         }
         else
         {
            selectedIndex = param1;
            caretIndex = lastCaretIndex = param1;
            _loc4_ = true;
         }
         if(_loc4_)
         {
            dispatchEvent(new Event(Event.CHANGE));
         }
         invalidate(InvalidationType.DATA);
      }
      
      override protected function drawList() : void
      {
         var _loc1_:Rectangle = null;
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:Object = null;
         var _loc6_:ICellRenderer = null;
         var _loc7_:Dictionary = null;
         var _loc8_:Dictionary = null;
         var _loc9_:Boolean = false;
         var _loc10_:String = null;
         var _loc11_:Object = null;
         var _loc12_:Sprite = null;
         var _loc13_:* = null;
         listHolder.x = listHolder.y = contentPadding;
         _loc1_ = listHolder.scrollRect;
         _loc1_.x = _horizontalScrollPosition;
         _loc1_.y = Math.floor(_verticalScrollPosition) % rowHeight;
         listHolder.scrollRect = _loc1_;
         listHolder.cacheAsBitmap = useBitmapScrolling;
         _loc2_ = Math.floor(_verticalScrollPosition / rowHeight);
         _loc3_ = Math.min(length,_loc2_ + rowCount + 1);
         _loc7_ = renderedItems = new Dictionary(true);
         _loc4_ = _loc2_;
         while(_loc4_ < _loc3_)
         {
            _loc7_[_dataProvider.getItemAt(_loc4_)] = true;
            _loc4_++;
         }
         _loc8_ = new Dictionary(true);
         while(activeCellRenderers.length > 0)
         {
            _loc6_ = activeCellRenderers.pop() as ICellRenderer;
            _loc5_ = _loc6_.data;
            if(_loc7_[_loc5_] == null || invalidItems[_loc5_] == true)
            {
               availableCellRenderers.push(_loc6_);
            }
            else
            {
               _loc8_[_loc5_] = _loc6_;
               invalidItems[_loc5_] = true;
            }
            list.removeChild(_loc6_ as DisplayObject);
         }
         invalidItems = new Dictionary(true);
         _loc4_ = _loc2_;
         while(_loc4_ < _loc3_)
         {
            _loc9_ = false;
            _loc5_ = _dataProvider.getItemAt(_loc4_);
            if(_loc8_[_loc5_] != null)
            {
               _loc9_ = true;
               _loc6_ = _loc8_[_loc5_];
               delete _loc8_[_loc5_];
            }
            else if(availableCellRenderers.length > 0)
            {
               _loc6_ = availableCellRenderers.pop() as ICellRenderer;
            }
            else
            {
               _loc6_ = getDisplayObjectInstance(getStyleValue("cellRenderer")) as ICellRenderer;
               _loc12_ = _loc6_ as Sprite;
               if(_loc12_ != null)
               {
                  _loc12_.addEventListener(MouseEvent.CLICK,handleCellRendererClick,false,0,true);
                  _loc12_.addEventListener(MouseEvent.ROLL_OVER,handleCellRendererMouseEvent,false,0,true);
                  _loc12_.addEventListener(MouseEvent.ROLL_OUT,handleCellRendererMouseEvent,false,0,true);
                  _loc12_.addEventListener(Event.CHANGE,handleCellRendererChange,false,0,true);
                  _loc12_.doubleClickEnabled = true;
                  _loc12_.addEventListener(MouseEvent.DOUBLE_CLICK,handleCellRendererDoubleClick,false,0,true);
                  if(_loc12_["setStyle"] != null)
                  {
                     for(_loc13_ in rendererStyles)
                     {
                        _loc12_["setStyle"](_loc13_,rendererStyles[_loc13_]);
                     }
                  }
               }
            }
            list.addChild(_loc6_ as Sprite);
            activeCellRenderers.push(_loc6_);
            _loc6_.y = rowHeight * (_loc4_ - _loc2_);
            _loc6_.setSize(availableWidth + _maxHorizontalScrollPosition,rowHeight);
            _loc10_ = itemToLabel(_loc5_);
            _loc11_ = null;
            if(_iconFunction != null)
            {
               _loc11_ = _iconFunction(_loc5_);
            }
            else if(_iconField != null)
            {
               _loc11_ = _loc5_[_iconField];
            }
            if(!_loc9_)
            {
               _loc6_.data = _loc5_;
            }
            _loc6_.listData = new ListData(_loc10_,_loc11_,this,_loc4_,_loc4_,0);
            _loc6_.selected = _selectedIndices.indexOf(_loc4_) != -1;
            if(_loc6_ is UIComponent)
            {
               (_loc6_ as UIComponent).drawNow();
            }
            _loc4_++;
         }
      }
      
      public function get iconFunction() : Function
      {
         return _iconFunction;
      }
      
      public function set iconField(param1:String) : void
      {
         if(param1 == _iconField)
         {
            return;
         }
         _iconField = param1;
         invalidate(InvalidationType.DATA);
      }
      
      override protected function keyDownHandler(param1:KeyboardEvent) : void
      {
         var _loc2_:int = 0;
         if(!selectable)
         {
            return;
         }
         switch(param1.keyCode)
         {
            case Keyboard.UP:
            case Keyboard.DOWN:
            case Keyboard.END:
            case Keyboard.HOME:
            case Keyboard.PAGE_UP:
            case Keyboard.PAGE_DOWN:
               moveSelectionVertically(param1.keyCode,param1.shiftKey && _allowMultipleSelection,param1.ctrlKey && _allowMultipleSelection);
               break;
            case Keyboard.LEFT:
            case Keyboard.RIGHT:
               moveSelectionHorizontally(param1.keyCode,param1.shiftKey && _allowMultipleSelection,param1.ctrlKey && _allowMultipleSelection);
               break;
            case Keyboard.SPACE:
               if(caretIndex == -1)
               {
                  caretIndex = 0;
               }
               doKeySelection(caretIndex,param1.shiftKey,param1.ctrlKey);
               scrollToSelected();
               break;
            default:
               _loc2_ = getNextIndexAtLetter(String.fromCharCode(param1.keyCode),selectedIndex);
               if(_loc2_ > -1)
               {
                  selectedIndex = _loc2_;
                  scrollToSelected();
               }
         }
         param1.stopPropagation();
      }
      
      override public function itemToLabel(param1:Object) : String
      {
         if(_labelFunction != null)
         {
            return String(_labelFunction(param1));
         }
         return param1[_labelField] != null?String(param1[_labelField]):"";
      }
      
      public function get labelField() : String
      {
         return _labelField;
      }
      
      override protected function moveSelectionVertically(param1:uint, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         _loc4_ = Math.max(Math.floor(calculateAvailableHeight() / rowHeight),1);
         _loc5_ = -1;
         _loc6_ = 0;
         switch(param1)
         {
            case Keyboard.UP:
               if(caretIndex > 0)
               {
                  _loc5_ = caretIndex - 1;
               }
               break;
            case Keyboard.DOWN:
               if(caretIndex < length - 1)
               {
                  _loc5_ = caretIndex + 1;
               }
               break;
            case Keyboard.PAGE_UP:
               if(caretIndex > 0)
               {
                  _loc5_ = Math.max(caretIndex - _loc4_,0);
               }
               break;
            case Keyboard.PAGE_DOWN:
               if(caretIndex < length - 1)
               {
                  _loc5_ = Math.min(caretIndex + _loc4_,length - 1);
               }
               break;
            case Keyboard.HOME:
               if(caretIndex > 0)
               {
                  _loc5_ = 0;
               }
               break;
            case Keyboard.END:
               if(caretIndex < length - 1)
               {
                  _loc5_ = length - 1;
               }
         }
         if(_loc5_ >= 0)
         {
            doKeySelection(_loc5_,param2,param3);
            scrollToSelected();
         }
      }
      
      public function set labelField(param1:String) : void
      {
         if(param1 == _labelField)
         {
            return;
         }
         _labelField = param1;
         invalidate(InvalidationType.DATA);
      }
      
      public function set rowCount(param1:uint) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         _loc2_ = Number(getStyleValue("contentPadding"));
         _loc3_ = _horizontalScrollPolicy == ScrollPolicy.ON || _horizontalScrollPolicy == ScrollPolicy.AUTO && _maxHorizontalScrollPosition > 0?Number(15):Number(0);
         height = rowHeight * param1 + 2 * _loc2_ + _loc3_;
      }
      
      override protected function setHorizontalScrollPosition(param1:Number, param2:Boolean = false) : void
      {
         list.x = -param1;
         super.setHorizontalScrollPosition(param1,true);
      }
      
      public function set iconFunction(param1:Function) : void
      {
         if(_iconFunction == param1)
         {
            return;
         }
         _iconFunction = param1;
         invalidate(InvalidationType.DATA);
      }
      
      public function get labelFunction() : Function
      {
         return _labelFunction;
      }
      
      override protected function moveSelectionHorizontally(param1:uint, param2:Boolean, param3:Boolean) : void
      {
      }
      
      override protected function setVerticalScrollPosition(param1:Number, param2:Boolean = false) : void
      {
         invalidate(InvalidationType.SCROLL);
         super.setVerticalScrollPosition(param1,true);
      }
      
      protected function calculateAvailableHeight() : Number
      {
         var _loc1_:Number = NaN;
         _loc1_ = Number(getStyleValue("contentPadding"));
         return height - _loc1_ * 2 - (_horizontalScrollPolicy == ScrollPolicy.ON || _horizontalScrollPolicy == ScrollPolicy.AUTO && _maxHorizontalScrollPosition > 0?15:0);
      }
      
      override protected function draw() : void
      {
         var _loc1_:* = false;
         _loc1_ = contentHeight != rowHeight * length;
         contentHeight = rowHeight * length;
         if(isInvalid(InvalidationType.STYLES))
         {
            setStyles();
            drawBackground();
            if(contentPadding != getStyleValue("contentPadding"))
            {
               invalidate(InvalidationType.SIZE,false);
            }
            if(_cellRenderer != getStyleValue("cellRenderer"))
            {
               _invalidateList();
               _cellRenderer = getStyleValue("cellRenderer");
            }
         }
         if(isInvalid(InvalidationType.SIZE,InvalidationType.STATE) || _loc1_)
         {
            drawLayout();
         }
         if(isInvalid(InvalidationType.RENDERER_STYLES))
         {
            updateRendererStyles();
         }
         if(isInvalid(InvalidationType.STYLES,InvalidationType.SIZE,InvalidationType.DATA,InvalidationType.SCROLL,InvalidationType.SELECTED))
         {
            drawList();
         }
         updateChildren();
         validate();
      }
      
      override protected function configUI() : void
      {
         useFixedHorizontalScrolling = true;
         _horizontalScrollPolicy = ScrollPolicy.AUTO;
         _verticalScrollPolicy = ScrollPolicy.AUTO;
         super.configUI();
      }
      
      override public function get rowCount() : uint
      {
         return Math.ceil(calculateAvailableHeight() / rowHeight);
      }
      
      override protected function initializeAccessibility() : void
      {
         if(List.createAccessibilityImplementation != null)
         {
            List.createAccessibilityImplementation(this);
         }
      }
      
      override public function scrollToIndex(param1:int) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:uint = 0;
         drawNow();
         _loc2_ = Math.floor((_verticalScrollPosition + availableHeight) / rowHeight) - 1;
         _loc3_ = Math.ceil(_verticalScrollPosition / rowHeight);
         if(param1 < _loc3_)
         {
            verticalScrollPosition = param1 * rowHeight;
         }
         else if(param1 > _loc2_)
         {
            verticalScrollPosition = (param1 + 1) * rowHeight - availableHeight;
         }
      }
      
      public function get rowHeight() : Number
      {
         return _rowHeight;
      }
      
      public function set labelFunction(param1:Function) : void
      {
         if(_labelFunction == param1)
         {
            return;
         }
         _labelFunction = param1;
         invalidate(InvalidationType.DATA);
      }
      
      public function set rowHeight(param1:Number) : void
      {
         _rowHeight = param1;
         invalidate(InvalidationType.SIZE);
      }
   }
}
