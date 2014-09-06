package  {
	
	public class Equipment {

		private var level:int//версия оборудования
		private var mass:int;//масса оборудования
	
		public function setupNewEquipment(newLevel:int,newMass:int):void
		{//установка новых версии и массы оборудования
			level=newLevel;
			mass=newMass;
		}
		
		public function getLevel():int//получить уровень оборудования
		{
			return level;
		}
		
		public function getMass():Number//получить массу оборудования
		{
			return mass;
		}
	}
	
}
