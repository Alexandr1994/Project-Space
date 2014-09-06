package  {
	
	public class Weapon extends Equipment{

		private var damageMin:int;
		private var overheating:int=0;
		private var maxOverheating:int;
		private var enegyNeed:int=-1;
		private var overHeatingCost:int=2;
		private var dispersion:Number;
		private var weaponType:String;
		

		public function setupWeapon(newWeaponType:String):void
		{
			weaponType=newWeaponType;
			switch(weaponType)
			{
				case "laser":
				{
					laserSetup();
				}break;
				case "plasma":
				{
					plasmaSetup();
				}break;
				default:
				{
					damageMin=0;
					dispersion=0;
					maxOverheating=0;
				}
			}
			
		}

		private function laserSetup():void
		{
			switch(getLevel())
			{
				case 1:
				{
					damageMin=2;
					dispersion=0;
					maxOverheating=100;
				}break;
				case 2:
				{
					damageMin=4;
					dispersion=0;
					maxOverheating=150;
				}break;
				case 3:
				{
					damageMin=8;
					dispersion=0;
					maxOverheating=200;
				}break;
				case 4:
				{
					damageMin=16;
					dispersion=0;
					maxOverheating=250;
				}break;
				case 5:
				{
					damageMin=20;
					dispersion=0;
					maxOverheating=300;
				}break;
				default:
				{
					damageMin=0;
					dispersion=0;
					maxOverheating=0;
				}
			}
		}

		private function plasmaSetup():void
		{
			switch(getLevel())
			{
				case 1:
				{
					damageMin=5;
					dispersion=15;
					maxOverheating=100;
				}break;
				case 2:
				{
					damageMin=6;
					dispersion=12;
					maxOverheating=125;
				}break;
				case 3:
				{
					damageMin=7;
					dispersion=10;
					maxOverheating=150;
				}break;
				case 4:
				{
					damageMin=8;
					dispersion=8;
					maxOverheating=175;
				}break;
				case 5:
				{
					damageMin=10;
					dispersion=5;
					maxOverheating=200;
				}break;
				default:
				{
					damageMin=0;
					dispersion=0;
					maxOverheating=0;
				}
			}
		}

		public function getDamage():int
		{
			return damageMin+Math.random()*5;
		}
		
		public function getOverheating():int
		{
			return overheating;
		}
		
		public function getMaxOverheating():int
		{
			return maxOverheating;
		}
		
		public function changeOverheating(overheatingChange:int):void
		{
			overheating+=overheatingChange;
		}
		
		public function getEnergyNeed():int
		{
			return enegyNeed;
		}

		public function getDispersion():Number
		{
			return dispersion;
		}

		public function getOverHeatingCost():int
		{
			return overHeatingCost;
		}

		public function getWeaponType():String
		{
			return weaponType;
		}

	}
	
}
