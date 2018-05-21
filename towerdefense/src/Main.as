package
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display3D.textures.Texture;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	
	/**
	 * ...
	 * @author Tech c
	 */
	public class Main extends Sprite 
	{
		[Embed(source = "../bin/sprite/gameover.png")]
		private const gameover:Class;
		[Embed(source="../bin/sprite/gameclear.png")]
		private const gameclear:Class;
		[Embed(source = "../bin/sprite/map.png")]
		private const map:Class;
		private var ghost_turret:Turret;
		private var turrets:Array = [];
		private var bullets:Array = [];
		private var enemies:Array = [];
		private var global_time:Number = 0;
		private var money: int;
		private var moneytext:TextField;
		//逃げた敵の数
		private var enemyescaped:int;
		private var enemyescapedtext:TextField;
		//死んだ敵の数
		private var enemydeath:int;
		//turret値段
		private static const turretprice:int = 100;
		//敵を破壊お金貰う
		private static const killmoney:int = 20;
		//ゲーム始まるの時間
		private var gamestarttime:uint;
		//ゲームの時間
		private var gametime:uint;
		//ゲームの時計
		private var gameTimeField:int;
		private var gameTimeFieldtext:TextField;
		
		
				
		public function Main() 
		{
			addChild(new map);
			//turret placeholder 作る
			//上の壁
			var placeholder1A:Sprite = createTurretPlaceholder();
			placeholder1A.x = 390; placeholder1A.y = 30;
			var placeholder1B:Sprite = createTurretPlaceholder();
			placeholder1B.x = 330; placeholder1B.y = 30;
			var placeholder1C:Sprite = createTurretPlaceholder();
			placeholder1C.x = 270; placeholder1C.y = 30;
			var placeholder1D:Sprite = createTurretPlaceholder();
			placeholder1D.x = 210; placeholder1D.y = 30;
			var placeholder1E:Sprite = createTurretPlaceholder();
			placeholder1E.x = 150; placeholder1E.y = 30;
			var placeholder1F:Sprite = createTurretPlaceholder();
			placeholder1F.x = 90; placeholder1F.y = 30;
			var placeholder2:Sprite = createTurretPlaceholder();
			placeholder2.x = 390; placeholder2.y = 80;
			var placeholder3:Sprite = createTurretPlaceholder();
			placeholder3.x = 390; placeholder3.y = 130;
			var placeholder4:Sprite = createTurretPlaceholder();
			placeholder4.x = 390; placeholder4.y = 180;
			//下の壁
			var placeholder5:Sprite = createTurretPlaceholder();
			placeholder5.x = 390; placeholder5.y = 570;
			var placeholder5A:Sprite = createTurretPlaceholder();
			placeholder5A.x = 390; placeholder5A.y = 570;
			var placeholder5B:Sprite = createTurretPlaceholder();
			placeholder5B.x = 330; placeholder5B.y = 570;
			var placeholder5C:Sprite = createTurretPlaceholder();
			placeholder5C.x = 270; placeholder5C.y = 570;
			var placeholder5D:Sprite = createTurretPlaceholder();
			placeholder5D.x = 210; placeholder5D.y = 570;
			var placeholder5F:Sprite = createTurretPlaceholder();
			placeholder5F.x = 150; placeholder5F.y = 570;
			var placeholder5G:Sprite = createTurretPlaceholder();
			placeholder5G.x = 90; placeholder5G.y = 570;
			var placeholder5E:Sprite = createTurretPlaceholder();
			placeholder5E.x = 30; placeholder5E.y = 570;
			var placeholder7:Sprite = createTurretPlaceholder();
			placeholder7.x = 390; placeholder7.y = 520;
			var placeholder6:Sprite = createTurretPlaceholder();
			placeholder6.x = 390; placeholder6.y = 470;
			var placeholder8:Sprite = createTurretPlaceholder();
			placeholder8.x = 390; placeholder8.y = 420;
			
			//真ん中の壁
			var placeholder9:Sprite = createTurretPlaceholder();
			placeholder9.x = 60; placeholder9.y = 250;
			var placeholder10:Sprite = createTurretPlaceholder();
			placeholder10.x = 110; placeholder10.y = 250;
			var placeholder11:Sprite = createTurretPlaceholder();
			placeholder11.x = 160; placeholder11.y = 250;
			var placeholder12:Sprite = createTurretPlaceholder();
			placeholder12.x = 60; placeholder12.y = 300;
			var placeholder13:Sprite = createTurretPlaceholder();
			placeholder13.x = 110; placeholder13.y = 300;
			var placeholder14:Sprite = createTurretPlaceholder();
			placeholder14.x = 160; placeholder14.y = 300;
			var placeholder15:Sprite = createTurretPlaceholder();
			placeholder15.x = 60; placeholder15.y = 350;
			var placeholder16:Sprite = createTurretPlaceholder();
			placeholder16.x = 110; placeholder16.y = 350;
			var placeholder17:Sprite = createTurretPlaceholder();
			placeholder17.x = 160; placeholder17.y = 350;
			
			//上右の壁
			var placeholder18A:Sprite = createTurretPlaceholder();
			placeholder18A.x = 690; placeholder18A.y = 40;
			var placeholder18B:Sprite = createTurretPlaceholder();
			placeholder18B.x = 640; placeholder18B.y = 40;
			var placeholder18C:Sprite = createTurretPlaceholder();
			placeholder18C.x = 590; placeholder18C.y = 40;
			
			//下右の壁
			var placeholder19A:Sprite = createTurretPlaceholder();
			placeholder19A.x = 690; placeholder19A.y = 560;
			var placeholder19B:Sprite = createTurretPlaceholder();
			placeholder19B.x = 640; placeholder19B.y = 560;
			var placeholder19C:Sprite = createTurretPlaceholder();
			placeholder19C.x = 590; placeholder19C.y = 560;
			
			
			addChild(placeholder1A);
			addChild(placeholder1B);
			addChild(placeholder1C);
			addChild(placeholder1D);
			addChild(placeholder1E);
			addChild(placeholder1F);
			addChild(placeholder2);
			addChild(placeholder3);
			addChild(placeholder4);
			addChild(placeholder5);
			addChild(placeholder5A);
			addChild(placeholder5B);
			addChild(placeholder5C);
			addChild(placeholder5D);
			addChild(placeholder5E);
			addChild(placeholder5F);
			addChild(placeholder5G);
			addChild(placeholder6);
			addChild(placeholder7);
			addChild(placeholder8);
			addChild(placeholder9);
			addChild(placeholder10);
			addChild(placeholder11);
			addChild(placeholder12);
			addChild(placeholder13);
			addChild(placeholder14);
			addChild(placeholder15);
			addChild(placeholder16);
			addChild(placeholder17);
			addChild(placeholder18A);
			addChild(placeholder18B);
			addChild(placeholder18C);
			addChild(placeholder19A);
			addChild(placeholder19B);
			addChild(placeholder19C);

			
			//money表す
			moneytext = new TextField();
			addChild(moneytext);
			money = 500;
			showMoney();
			
			//逃げた敵表す
			enemyescapedtext = new TextField();
			enemyescapedtext.y = 15;
			addChild(enemyescapedtext);
			enemyescaped = 0;
			showEscape();
			
			//ゲーム時計表示
			gameTimeFieldtext = new TextField();
			gameTimeFieldtext.y = 30;
			addChild(enemyescapedtext);
			gameTimeField = 0;

			//mouse move ghost
			ghost_turret = new Turret();
			ghost_turret.alpha = 0.5;
			ghost_turret.mouseEnabled = false;
			ghost_turret.visible = false;
			
			addChild(ghost_turret);
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);
		}
		
		/**
		 * 金額表示
		 */
		public function showMoney():void 
		{
			moneytext.text= "Money:"+String(money);	
		}
		
		/**
		 * 逃げた敵
		 * @return
		 */
		public function showEscape():void 
		{
			enemyescapedtext.text = "Escaped:" +String(enemyescaped);
		}
		/**
		 * 砲台
		 * @return	生成したオブジェクト
		 */
		private function createTurretPlaceholder():Sprite 
		{
			var placeholder:Sprite = new Sprite();
			//draw the graphics
			var g:Graphics = placeholder.graphics;
			g.beginFill(0xCE7822);
			g.drawCircle(0, 0, 20);
			g.endFill();
					
			//マウスでtower現れる
			placeholder.addEventListener(MouseEvent.MOUSE_OVER, showGhostTurret, false, 0, true);
			placeholder.addEventListener(MouseEvent.MOUSE_OUT, hideGhostTurret, false, 0, true);
			//マウスでtower作る
			placeholder.addEventListener(MouseEvent.CLICK, addTurret, false, 0, true);
			//クリック打つ
			stage.addEventListener(Event.ENTER_FRAME, gameLoop);
			return placeholder;
		}
		
		/**
		 * tower現れる
		 * @param	e
		 */
		private function showGhostTurret(e:MouseEvent = null) :void 
		{
			var target_placeholder:Sprite = e.currentTarget as Sprite;
			ghost_turret.x = target_placeholder.x;
			ghost_turret.y = target_placeholder.y;
			ghost_turret.visible = true;
		}
		
		/**
		 * tower消える
		 * @param	e
		 */
		private function hideGhostTurret(e:MouseEvent = null):void 
		{
			ghost_turret.visible = false;	
		}
		
		/**
		 * tower生成
		 * @param	e
		 */
		private function addTurret(e:MouseEvent):void 
		{
			//お金ある時
			if (money >= 100)
			{
				var target_placeholder:Sprite = e.currentTarget as Sprite;
				var turret:Turret = new Turret();
				turret.x = target_placeholder.x;
				turret.y = target_placeholder.y;
				addChild(turret);
				turrets.push(turret);
				money -= turretprice;
				showMoney();
			}
			//お金ない時
			else 
			{
				
			}
				
//			e.stopPropagation();
		}
		
		/**
		 * コンストラクタ
		 */
		private function gameLoop(e:Event):void 
		{
			//時
			global_time++;
			var turret:Turret;
			var bullet:Bullet;
			var enemy:Enemy;
			
			for each(turret in turrets) 
			{
				//	リロードタイムの加算
				turret.update();
				//	発射可能でなければ次の砲台の処理に移る
				if (!turret.isReady()) continue;
				//	すべての敵に対してチェックする
				for each(enemy in enemies) 
				{
					//	攻撃可能な距離に敵がいるならば攻撃する
					if (turret.canShoot(enemy)) 
					{
						//	砲台から敵に向かって弾を撃つ
						shoot(turret, enemy);
						//	リロードタイムを初期化しておく
						turret.reset();
						break;
					}
				}
			}
			
			for (var i:int = bullets.length - 1; i >= 0; i--) 
			{
				bullet = bullets[i];
				
				if (!bullet) continue;
				
				bullet.update();
				//弾外に出たら消す
				if (bullet.x < 0 || bullet.x > stage.stageWidth || bullet.y < 0 || bullet.y > stage.stageHeight) 
				{
					bullets.splice(i, 1); 
					bullet.parent.removeChild(bullet);
					continue;
				}
				for (var k:int = enemies.length -1; k >= 0; k--) 
				{
					enemy = enemies[k];
					if (bullet.hitTestObject(enemy)) 
					{
						bullets.splice(i, 1);
						//弾当たったら消す
						bullet.parent.removeChild(bullet);
					
							if (enemy.updateHealth( -1) == 0) 
							{
								enemies.splice(k, 1);
								//敵画面から消す
								enemy.parent.removeChild(enemy);
								//お金貰う
								money +=  killmoney;
								enemydeath ++;
								showMoney();
							}
						break
					}
					
				}
				
			}
			/**
			 * 敵画面から消える
			 */
			for (var j:int = enemies.length -1; j >= 0; j--) 
			{
				enemy = enemies[j];
				enemy.update();
				if (enemy.x < 0) 
				{
					enemies.splice(j, 1);
					enemy.parent.removeChild(enemy);
					enemyescaped += 1;
					showEscape();
				}
			}
			/**
			 * 敵スポーン
			 */
			//level1
			if (enemydeath  <=  10)
			{
				if ( global_time % 90 == 0 )
				{	
					enemy = new Enemy();
					enemy.x = 800;
					enemy.y = 30 + Math.random() * 550;
					enemies.push(enemy);
					addChild(enemy);
				}
			} 
			//level2
			else if (enemydeath<=20)
			{
				if ( global_time % 60 == 0 )
				{	
					enemy = new Enemy();
					enemy.x = 800;
					enemy.y = 30 + Math.random() * 550;
					enemies.push(enemy);
					addChild(enemy);
				}
			}
			//level3
			else if (enemydeath<=50)
			{
				if ( global_time % 30 == 0 )
				{	
					enemy = new Enemy();
					enemy.x = 800;
					enemy.y = 30 + Math.random() * 550;
					enemies.push(enemy);
					addChild(enemy);
				}
			} 
			//level4
			else if (enemydeath<=100)
			{
				if ( global_time % 10 == 0 )
				{	
					enemy = new Enemy();
					enemy.x = 800;
					enemy.y = 30 + Math.random() * 550;
					enemies.push(enemy);
					addChild(enemy);
				}
			}
			//level5
			else if (enemydeath<=300)
			{
				if ( global_time % 5 == 0 )
				{	
					enemy = new Enemy();
					enemy.x = 800;
					enemy.y = 30 + Math.random() * 550;
					enemies.push(enemy);
					addChild(enemy);
				}
			} 
			/**
			 * ゲームクレア
			 */
			else if (enemydeath<=500)
			{
			 addChild (new gameclear);
				
			}
			/**
			 * ゲームオーバー
			 */
			if (enemyescaped == 10)
			{
				
				addChild(new gameover);
			}
		}
		
		//tower敵を打つ
		/**
		 * tower敵を打つ
		 * @param	turret	砲台
		 * @param	enemy	敵
		 */
		private function shoot(turret:Turret, enemy:Enemy):void 
		{
			var angle:Number = Math.atan2(enemy.y -turret.y, enemy.x -turret.x) / Math.PI * 180;
			turret.rotation = angle;
			var new_bullet:Bullet = new Bullet(angle);
			new_bullet.x = turret.x + Math.cos(turret.rotation * Math.PI / 180) * 25;
			new_bullet.y = turret.y + Math.sin(turret.rotation * Math.PI / 180) * 25
			bullets.push(new_bullet);
			addChild(new_bullet);
		}
		
	}
	
}