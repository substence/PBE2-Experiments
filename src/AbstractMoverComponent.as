package
{
	import com.pblabs.core.PBComponent;
	import com.pblabs.time.ITicked;
	import com.pblabs.time.TimeManager;
	
	import flash.geom.Point;
	
	public class AbstractMoverComponent extends PBComponent implements ITicked
	{
		[Inject]
		public var timeManager:TimeManager;
		public var position:Point;
		public var positionReference:String;
		
		public function AbstractMoverComponent(positionReference:String):void
		{
			this.positionReference = positionReference;
		}
		
		override protected function onAdd():void
		{
			timeManager.addTickedObject(this);
			addBinding("position", positionReference);
			super.onAdd();
		}
		
		virtual public function onTick():void
		{
			//applyBindings(); why does this work when commented
		}
		
		override protected function onRemove():void
		{
			timeManager.removeTickedObject(this);
			removeBinding("position", positionReference);
			super.onRemove();
		}
	}
}