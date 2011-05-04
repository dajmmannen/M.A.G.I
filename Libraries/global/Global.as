package global {
	import flash.display.MovieClip;
	import flash.display.*
	import flash.events.*
	
	public class Global extends MovieClip {
		// Global variables
		public static var objArray:Array = new Array();
		public static var playerHealth:Number = 100;
		public static var playerHealthMax:Number = 100;
		public static var enemyArray:Array = new Array();
		public static var playerDead:Boolean = false;
		public static var damageMultiplier = 1;
		public static var standardMultiplier = 1;
		public static var minDamage = 10;
		public static var maxDamage = 25;
		public static var swingTime = 750;
		public static var playerMoney:Number = 0;
		
		//Variable update loop
		public function Global() {
		addEventListener(Event.ENTER_FRAME, globalUpdater)
		function globalUpdater(e) {
			if(playerHealth > playerHealthMax) {
				playerHealth = playerHealthMax;
			}
		}
		}

	
		
	}
}