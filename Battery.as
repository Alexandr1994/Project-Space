package  {
	
	public class Battery extends Equipment{
	
		private var EnergyMax:int;//максимальное кол-во энергии
		private var Energy:int;//текущее кол-во энергии
		
		public function setupNewBattery():void
		{//установка новых характеристик батареи
			switch(getLevel())
			{
				case 1:
				{
					EnergyMax=Energy=500;
				}break;
				case 2:
				{
					EnergyMax=Energy=750;
				}break;
				case 3:
				{
					EnergyMax=Energy=1000;
				}break;
				case 4:
				{
					EnergyMax=Energy=1250;
				}break;
				case 5:
				{
					EnergyMax=Energy=1500;
				}break;
				default:
				{
					EnergyMax=Energy=0;
				}break;
			}
		}

		public function getEnergyMax():int//получить макс. ёмкость батареи
		{
			return EnergyMax;
		}
		
		public function getEnergy():int//получить кол-во энергии в батарее
		{
			return Energy;
		}

		public function energyChange(changeEnergy:int):void//изменить кол-ао энергии в батарее
		{
			Energy+=changeEnergy;
		}

	}
	
}
