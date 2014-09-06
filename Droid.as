package  {
	
	public class Droid extends Equipment{

		private var droidWork:int;
		private var	droidEnergyNeed:int=2;
		
		public function setupNewDroid():void
		{
			switch(getLevel())
			{//установка характеристик ремдроида
				case 1:
				{
					droidWork=1;
				}break;
				case 2:
				{
					droidWork=2;
				}break;
				case 3:
				{
					droidWork=3;
				}break;
				case 4:
				{
					droidWork=4;
				}break;
				case 5:
				{
					droidWork=5;
				}break;
				default:
				{
					droidWork=0;
				}break;
			}
		}
		
		public function getDroidWork():int
		{
			return droidWork;
		}
		
		public function getDroidNeed():int
		{
			return droidEnergyNeed;
		}

	}
	
}
