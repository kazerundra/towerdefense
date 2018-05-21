package 
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	public class Turret extends Sprite
	{
		private var local_time:Number = 0;
		private var reload_time:int;
		private var range:int;
		
		/**
		 * コンストラクタ
		 */
		public function Turret() 
		{
			reload_time = 15;
			range = 150;
			draw();
		}
		
		/**
		 * 初期化
		 */
		private function draw():void
		{
			var g:Graphics = this.graphics;
			g.beginFill(0xD7D700);
			g.drawCircle(0, 0, 20);
			g.beginFill(0x800000);
			g.drawRect(0, -5, 25, 10);
			g.endFill();
		}
		
		//マウス　で　狙う
		/**
		 * リロード時間の加算
		 */
		public function update(): void {
			local_time++;
		}
		
		/**
		 * リロード可能な状態かどうかの判断
		 * @return	true:発射可能、false:発射不可能
		 */
		public function isReady():Boolean 
		{
			return local_time > reload_time;	
		}
		
		/**
		 * リロードタイムの初期化
		 */
		public function reset():void 
		{
			local_time = 0;	
		}
		
		/**
		 * 敵との距離が一定距離内にいるならば攻撃可能の判断を行う
		 * @param	enemy
		 * @return	true:攻撃可能、fale:攻撃不可能
		 */
		public function canShoot(enemy:Enemy):Boolean 
		{
			var dx:Number = enemy.x - x;
			var dy:Number = enemy.y - y;
			if (Math.sqrt(dx * dx + dy * dy) <= range) return true;
			else return false;
		}
		
	}

}