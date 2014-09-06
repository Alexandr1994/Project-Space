package  {
	
	
	public class Engine extends Equipment{

		private var forvardSpeed: Number;//скорость прямого хода
		private var reversSpeed: Number;//риверсная скорость
		private var rotationSpeed: Number;//скорость поворота
		
		private var overheating:int=0;//перегрев двигателя(в перспективе)
		
		public function setupNewEngine():void
		{//установка новых характеристик двигателя
			switch(getLevel())
			{
				case 1:
				{
					forvardSpeed=4;
					reversSpeed=2
					rotationSpeed=2
				}break;
				case 2:
				{
					forvardSpeed=5;
					reversSpeed=3
					rotationSpeed=3
				}break;
				case 3:
				{
					forvardSpeed=6;
					reversSpeed=4
					rotationSpeed=4
				}break;
				case 4:
				{
					forvardSpeed=7;
					reversSpeed=5;
					rotationSpeed=5
				}break;
				case 5:
				{
					forvardSpeed=8;
					reversSpeed=6;
					rotationSpeed=6;
				}break;
				default:
				{
					forvardSpeed=0;
					reversSpeed=0;
					rotationSpeed=0;
				}break;
				
				
			}
		}
		
		public function getForwardSpeed():Number//получть скорость пряого хода
		{
			return forvardSpeed;
		}
		
		public function getReversSpeed():Number//получить скорость риверсного хода

		{
			return reversSpeed;
		}
		
		public function getRotationSpeed():Number//получить скорость аоворота
		{
			return rotationSpeed;
		}



	}
	
}
