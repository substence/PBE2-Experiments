package
{
	import com.pblabs.simplest.SimplestSpriteRenderer;
	
	public class CustomSimplestSpriteRenderer extends SimplestSpriteRenderer
	{
		public var size:int;
		public var color:uint;
		
		public function CustomSimplestSpriteRenderer(size:int = 20, color:uint = 0xFF00FF)
		{
			this.size = size;
			this.color = color;
		}
		
		override protected function onAdd():void
		{
			super.onAdd();
			sprite.graphics.clear();
			sprite.graphics.lineStyle(2, 0);
			sprite.graphics.beginFill(color);
			sprite.graphics.drawCircle(0, 0, size);
		}
	}
}