package  {
	
	import flash.display.MovieClip;
	import flash.text.*
	import flash.events.*
	import gameEngine
	import global.Global;
	
	
	public class combatTextObj extends MovieClip {
		
		
		public function combatTextObj(startX:Number, startY:Number, damageNumber:Number) {
			
			addEventListener(Event.ENTER_FRAME, frameUpdater)
			
			function frameUpdater(e) {
				trace("lol")
				y += 1
				alpha -= 0,01
				
				if(alpha==0) {
					x=13371337
				}
			}
			
			
		}
	}
	
}
