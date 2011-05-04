package  {
	
	import flash.display.MovieClip;
	import global.Global;
	import flash.events.*
	
	
	public class shopUI2 extends MovieClip {
		
		
		var itemHeal = 10;
		var itemCost = 2;
		
		public function shopUI2() {
			stop()
			addEventListener(MouseEvent.CLICK, clickTest)
		
			function clickTest(e) {
				if(global.Global.playerMoney >= itemCost) {
					global.Global.playerMoney -= itemCost
					global.Global.playerHealth += itemHeal;
					if(global.Global.playerHealth > global.Global.playerHealthMax) {
						global.Global.playerHealth = global.Global.playerHealthMax
					}
					   
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
