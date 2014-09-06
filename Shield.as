package  {
	
	public class Shield extends Equipment{

		private var shieldPowerMax:int;
		private var shieldPower:int=0;
		private var sheldActive:Boolean=false;

		public function setupNewShield():void
		{
			switch(getLevel())
			{//установка характеристик щита
				case 1:
				{
					shieldPowerMax=100;
				}break;
				case 2:
				{
					shieldPowerMax=150;
				}break;
				case 3:
				{
					shieldPowerMax=200;
				}break;
				case 4:
				{
					shieldPowerMax=250;
				}break;
				case 5:
				{
					shieldPowerMax=300;
				}break;
				default:
				{
					shieldPowerMax=0;
				}break;
			}
		}
		
		public function activeShield():void
		{
			if(sheldActive)
			{
				sheldActive=false;
				shieldPower=0;
			}
			else
			{
				sheldActive=true
				shieldPower=shieldPowerMax;
			}
		}
		
		public function deactiveShield():void
		{
			sheldActive=false;
			shieldPower=0;
		}
		
		public function shieldConditionTest():void
		{
			if(sheldActive)
			{
				if(shieldPower<=0)
				{
					sheldActive=false;
				}
			}
		}
		
		public function getShieldCondition():Boolean
		{
			return sheldActive;
		}
		
		public function getShieldPower():int
		{
			return shieldPower;
		}
		
		public function getShieldPowerMax():int
		{
			return shieldPowerMax;
		}
		
		public function shieldDamage(damage:int):void
		{
			shieldPower-=damage;
		}


	}
	
}
