package DpdzUtils
{
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import DpdzUtils.tfm.*;

	public class ToolTip extends Panel
	{
		private var _label:Label;
		public var tt:Sprite = new Sprite();

		public function ToolTip(OBJ:DisplayObjectContainer = null, Content:String = "Write the content of the bubble.", text_color:int = 0, background_color:int = 0, border_color:int = 0, border_thickness:Number = 0.5) 
		{
			super(OBJ.parent);
			_label = new Label(tt, 5, 2, Content, -1, text_color);
			Config_tt(10, 4, true, true, background_color, border_color, border_thickness, false)
			set_tt(OBJ, 2, 25);
			addChild(tt);
		}
		
		private function Config_tt(horizontal_center:int, vertical_center:int, Background:Boolean,radius:Boolean, background_color:int, border_color:int, border_thickness:Number, Visible:Boolean):void
		{
			super.width = _label.width + horizontal_center;
			super.height = tt.height + vertical_center;
			super.afficherFond = Background;
			super.bordureRondeUniquementBas = radius;
			super.couleurFond = background_color;
			super.couleurBordure = border_color;
			super.grosseurBordure = border_thickness;
			super.visible = Visible;
			
		}
		
		private function set_tt(param1:*, param2:int, param3:int):void
		{
			param1.addEventListener(MouseEvent.MOUSE_MOVE, function()
			{
				x = param1.parent.mouseX + param2;
				y = param1.parent.mouseY + param3;
				visible = true;
			});
			param1.addEventListener(MouseEvent.MOUSE_OUT, function(){ 
									visible = false; });
			return;
		}
	}
}