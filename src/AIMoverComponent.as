package
{
	public class AIMoverComponent extends AbstractMoverComponent
	{
		public var speed:int;
		
		public function AIMoverComponent(positionReference:String, speed:int):void
		{
			super(positionReference);
			this.speed = speed;
		}
		
		override public function onTick():void
		{
			position.y += speed;
		}
	}
}