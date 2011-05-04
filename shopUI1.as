package  {
	
	import flash.display.*
	import flash.events.*
	import global.Global;
	
	
	public class shopUI1 extends MovieClip {
		
		var weaponDamage = 3;
		var weaponCost = 2;
		
		public function shopUI1() {
			stop()
			addEventListener(MouseEvent.CLICK, clickTest)
		
			function clickTest(e) {
				if(global.Global.playerMoney >= weaponCost) {
					global.Global.playerMoney -= weaponCost
					global.Global.damageMultiplier = weaponDamage;
					global.Global.standardMultiplier = weaponDamage;
				}
			}
			
			addEventListener(MouseEvent.ROLL_OVER, rollOverEvent)
			addEventListener(MouseEvent.ROLL_OUT, rollOutEvent)
			
			function rollOverEvent(e) {
				gotoAndStop(2)
			}
			
			function rollOutEvent(e) {
				gotoAndStop(1)
			}
		}
	}
	
}
