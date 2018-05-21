package 
{
	/**
	 * ...
	 * @author Tech c
	 */
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.utils.Timer;
	public class Enemy extends Sprite
	{
		
		private var health_txt:TextField;
		public var health:int;
		private var speed_x:Number;
		private var speed_y:Number;

		/**
		 * コンストラクタ
		 */
		public function Enemy() 
		{   
			//敵の速さ
			speed_x = -3;
			speed_y = 0;
			//敵の体力
			health = 5;
			draw();			
		}
		//敵を描く
		private function draw():void 
		{
			var g:Graphics = this.graphics;
			g.beginFill(0xff3333);
			g.drawCircle(0, 0, 15);
			g.endFill();
			
			health_txt = new TextField;
			health_txt.height = 20; health_txt.width = 15;
			health_txt.textColor = 0xffffff;
			health_txt.x = -5;
			health_txt.y = -8;
			health_txt.text = health +"";
			addChild(health_txt);
		}
		public function update():void 
		{
			x += speed_x;
			y += speed_y;
		}
		//敵の体力が減るupdate
		public function updateHealth(amount:int):int 
		{
			health += amount;
			health_txt.text = health + "";
			return health;
		}
		
	}

}