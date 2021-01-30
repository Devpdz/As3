package DpdzUtils
{

	import flash.geom.ColorTransform;
	import flash.events.MouseEvent;
	import flash.display.Sprite;

	public class MouseEffects extends Object
	{
		
		private static const couleurLumiere:ColorTransform = new ColorTransform(1.3,1.3,1.3);
		private static const couleurNormal:ColorTransform = new ColorTransform();

		public function MouseEffects()
		{
			super();
		}

		public function lumiereSprite(param1, param2:Boolean):void
		{
			param1.mouseEnabled = true;
			param1.addEventListener(MouseEvent.MOUSE_OVER, mOVER);
			param1.addEventListener(MouseEvent.MOUSE_OUT, mOUT);
			if (param2)
			{
				param1.useHandCursor = true;
				param1.buttonMode = true;
			}
			else
			{
				param1.mouseEnabled = false;
				param1.removeEventListener(MouseEvent.MOUSE_OVER, mOVER);
				param1.removeEventListener(MouseEvent.MOUSE_OUT, mOUT);
				param1.useHandCursor = false;
				param1.buttonMode = false;
			};
		}
		
		private function mOVER(e:MouseEvent):void
		{
			(e.currentTarget as Sprite).transform.colorTransform = couleurLumiere;
			return;
		}
		private function mOUT(e:MouseEvent):void
		{
			(e.currentTarget as Sprite).transform.colorTransform = couleurNormal;
			return;
		}
	}
}