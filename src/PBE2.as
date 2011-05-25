
package
{
	import com.pblabs.core.PBGameObject;
	import com.pblabs.core.PBGroup;
	import com.pblabs.core.PBSet;
	import com.pblabs.debug.Console;
	import com.pblabs.debug.ConsoleCommandManager;
	import com.pblabs.input.KeyboardKey;
	import com.pblabs.input.KeyboardManager;
	import com.pblabs.property.PropertyManager;
	import com.pblabs.simpler.MouseFollowComponent;
	import com.pblabs.simpler.SimpleSpriteRenderer;
	import com.pblabs.simplest.SimplestMouseFollowComponent;
	import com.pblabs.simplest.SimplestSpatialComponent;
	import com.pblabs.simplest.SimplestSpriteRenderer;
	import com.pblabs.time.TimeManager;
	
	import demos.SimplePartyGameObject;
	import demos.SimplestPartyGameObject;
	import demos.circlePickupWithTimeManager.CirclePickupWithTimeManagerScene;
	import demos.simplestRenderer.SimplestRendererScene;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	
	public class PBE2 extends Sprite
	{
		private var _rootGroup:PBGroup;
		private var _ship:VisibleGameObject;
		private var _timeManager:TimeManager;
		private var _keyboardManager:KeyboardManager;
		private var _bullets:PBSet;
		[SWF(width="800",height="600")]
		
		public function PBE2()
		{
			_rootGroup = new PBGroup("primaryGroup");
			_rootGroup.initialize();
			_rootGroup.registerManager(Stage, stage);
			_rootGroup.registerManager(PropertyManager, new PropertyManager());
			_rootGroup.registerManager(ConsoleCommandManager, new ConsoleCommandManager());
			_timeManager = new TimeManager();
			_rootGroup.registerManager(TimeManager, _timeManager);
			_keyboardManager = new KeyboardManager();
			_rootGroup.registerManager(KeyboardManager, _keyboardManager);
			_rootGroup.registerManager(Console, new Console());
			//
			createShip();
			createEnemy();
			_bullets = new PBSet("bullets");
			stage.addEventListener(KeyboardEvent.KEY_UP, pressedKey);
		}
		
		private function pressedKey(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.SPACE)
				createBullet();
		}
		
		private function createEnemy():void
		{
			var enemy:VisibleGameObject = createVisibleGameObject();
			enemy.spatial.position = new Point(Math.random() * stage.stageWidth, y);
			enemy.addComponent(new AIMoverComponent("@spatial.position", 5), "mover");
			enemy.initialize();
			_timeManager.schedule(Math.random() * 5000, this, createEnemy);
		}
		
		private function createBullet():void
		{
			var bullet:VisibleGameObject = createVisibleGameObject();
			bullet.spatial.position = new Point(_ship.spatial.position.x, _ship.spatial.position.y);
			bullet.addComponent(new AIMoverComponent("@spatial.position", -5), "mover");
			bullet.render.size = 5;
			bullet.initialize();
			_bullets.add(bullet);
		}
		
		private function createShip():void
		{
			_ship = createVisibleGameObject();
			_ship.spatial.position = new Point(stage.stageWidth * .5, stage.stageHeight * .9)
			_ship.addComponent(new KeyboardMoverComponent("@spatial.position"), "mover");
			_ship.initialize();
		}
		
		private function createVisibleGameObject():VisibleGameObject
		{
			var gameObject:VisibleGameObject = new VisibleGameObject();
			gameObject.owningGroup = _rootGroup;
			gameObject.spatial = new SimplestSpatialComponent();
			gameObject.addComponent(gameObject.spatial, "spatial");
			gameObject.render = new CustomSimplestSpriteRenderer();
			gameObject.render.addBinding("position", "@spatial.position");
			gameObject.addComponent(gameObject.render, "renderer");
			return gameObject;
		}
	}
}