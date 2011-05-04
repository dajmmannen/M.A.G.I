package  {
	import flash.display.*;
	import global.Global;
	
	public class collZone extends MovieClip {

		public function collZone(startX:Number, startY:Number, startW:Number, startH:Number) {
			var square:Sprite = new Sprite();
			//stage.addChild(this);
			square.graphics.beginFill(0x0000FF);
			square.graphics.drawRect(0, 0, 100, 100)
			square.x = startX;
			square.y = startY;
			x = startX
			y = startY
			width = startW;
			height = startH
			global.Global.objArray.push(this);
			
		}

	}
	
}
