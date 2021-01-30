package DpdzUtils.tfm
{
    import flash.display.*;

    public class Panel extends Component
    {
        protected var _mask:Sprite;
        protected var _background:Sprite;
        protected var _color:int = -1;
        protected var _shadow:Boolean = true;
        protected var _gridSize:int = 10;
        protected var _showGrid:Boolean = false;
        protected var _gridColor:uint = 13684944;
        public var afficherFond:Boolean = false;
        public var couleurFond:int = 2829122;
		public var couleurBordure:int = 13267430;
		public var grosseurBordure:Number = 1;
        public var effetBiseau:Boolean = false;
        public var bordureRondeUniquementBas:Boolean = true;
        public var content:Sprite;

        public function Panel(param1:DisplayObjectContainer = null, param2:Number = 0, param3:Number = 0)
        {
            super(param1, param2, param3);
            return;
        }// end function

        override protected function init() : void
        {
            super.init();
            setSize(100, 100);
            return;
        }// end function

        override protected function addChildren() : void
        {
            this._background = new Sprite();
            super.addChild(this._background);
            this._mask = new Sprite();
            this._mask.mouseEnabled = false;
            super.addChild(this._mask);
            this.content = new Sprite();
            super.addChild(this.content);
            this.content.mask = this._mask;
            return;
        }// end function

        override public function addChild(param1:DisplayObject) : DisplayObject
        {
            this.content.addChild(param1);
            return param1;
        }// end function

        public function addRawChild(param1:DisplayObject) : DisplayObject
        {
            super.addChild(param1);
            return param1;
        }// end function

        override public function draw() : void
        {
            super.draw();
            if (this.afficherFond)
            {
                this._background.graphics.clear();
                this._background.graphics.lineStyle(this.grosseurBordure, this.couleurBordure, 1, true);
                this._background.graphics.beginFill(this.couleurFond);
                if (this.bordureRondeUniquementBas)
                {
                    this._background.graphics.drawRoundRectComplex(0, 0, _width, _height, 0, 0, 6, 66);
                }
                else
                {
                    this._background.graphics.drawRoundRect(0, 0, _width, _height, 2);
                }
                this._background.graphics.endFill();
                if (this.effetBiseau)
                {
                    this._background.filters = Style.EFFET_BISEAU_FENETRE;
                }
            }
            this.drawGrid();
            this._mask.graphics.clear();
            this._mask.graphics.beginFill(16711680);
            this._mask.graphics.drawRect(0, 0, _width, _height);
            this._mask.graphics.endFill();
            return;
        }// end function

        protected function drawGrid() : void
        {
            if (!this._showGrid)
            {
                return;
            }
            this._background.graphics.lineStyle(0, this._gridColor);
            var _loc_1:* = 0;
            while (_loc_1 < _width)
            {
                
                this._background.graphics.moveTo(_loc_1, 0);
                this._background.graphics.lineTo(_loc_1, _height);
                _loc_1 = _loc_1 + this._gridSize;
            }
            _loc_1 = 0;
            while (_loc_1 < _height)
            {
                
                this._background.graphics.moveTo(0, _loc_1);
                this._background.graphics.lineTo(_width, _loc_1);
                _loc_1 = _loc_1 + this._gridSize;
            }
            return;
        }// end function

        public function set shadow(param1:Boolean) : void
        {
            this._shadow = param1;
            if (this._shadow)
            {
                filters = [getShadow(2, true)];
            }
            else
            {
                filters = [];
            }
            return;
        }// end function

        public function get shadow() : Boolean
        {
            return this._shadow;
        }// end function

        public function set color(param1:int) : void
        {
            this._color = param1;
            invalidate();
            return;
        }// end function

        public function get color() : int
        {
            return this._color;
        }// end function

        public function set gridSize(param1:int) : void
        {
            this._gridSize = param1;
            invalidate();
            return;
        }// end function

        public function get gridSize() : int
        {
            return this._gridSize;
        }// end function

        public function set showGrid(param1:Boolean) : void
        {
            this._showGrid = param1;
            invalidate();
            return;
        }// end function

        public function get showGrid() : Boolean
        {
            return this._showGrid;
        }// end function

        public function set gridColor(param1:uint) : void
        {
            this._gridColor = param1;
            invalidate();
            return;
        }// end function

        public function get gridColor() : uint
        {
            return this._gridColor;
        }// end function

    }
}
