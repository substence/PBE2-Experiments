package
{
	import com.pblabs.core.PBGameObject;
	import com.pblabs.simplest.SimplestSpatialComponent;
	
	import flash.geom.Point;
	
	public class ShipGameObject extends PBGameObject
	{
		public var spatial:SimplestSpatialComponent;
		public var speed:int = 5;
		
		public function move(direction:Point):void
		{
			direction.x *= speed;
			direction.y *= speed;
			spatial.position.add(direction);
		}
		
		public function fire():void
		{
			
		}
	}
}