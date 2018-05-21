package 
{
	/**
	 * ...
	 * @author Tech c
	 */
	//弾作る
	import flash.display.Graphics;
	import flash.display.Sprite;
	public class Bullet extends Sprite
	{
		private var speed:Number;
		private var speed_x:Number;
		private var speed_y:Number;
		public var damage:int;
		//弾を描く
		private function draw():void 
		{
			var g: Graphics = this.graphics;
			g.beginFill(0xeeeee);
			g.drawCircle(0, 0, 5);
			g.endFill();
		}
		/**
		 * コンストラクタ
		 */
		public function Bullet(angle:Number) 
		{
			//弾の速さ
			speed = 5;
			//弾の攻撃力
			damage = 1;
			speed_x = Math.cos(angle * Math.PI / 180) * speed;
			speed_y = Math.sin(angle * Math.PI / 180) * speed;
			draw();
		}
		public function update():void 
		{
			x += speed_x;
			y += speed_y;
		}
		
	}

}