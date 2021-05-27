package DpdzUtils
{
	import flash.display.*;
	import com.bit101.components.*;
	import flash.net.*;

	public class imageButton extends Component
	{

		protected var image:Loader = new Loader();
    
		public function imageButton(doc:DisplayObjectContainer, url:String, x:Number, y:Number)
		{
			super(doc, x, y);
			image.load(new URLRequest(url));
			addChild(image);
			this.x = x;
			this.y = y;
		}
    
		override public function set enabled(funciona:Boolean):void
		{
			super.enabled = funciona;
		}
	}
}
