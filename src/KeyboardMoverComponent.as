package
{
	import com.pblabs.input.KeyboardKey;
	import com.pblabs.input.KeyboardManager;

	public class KeyboardMoverComponent extends AbstractMoverComponent
	{
		[Inject]
		public var keyboardManager:KeyboardManager;
		
		public function KeyboardMoverComponent(positionReference:String):void
		{
			super(positionReference);
		}
		
		override public function onTick():void
		{
			const speed:int = 5;
			if (keyboardManager.isKeyDown(KeyboardKey.RIGHT.keyCode))
				position.x += speed;
			else if (keyboardManager.isKeyDown(KeyboardKey.LEFT.keyCode))
				position.x -= speed;
		}
	}
}