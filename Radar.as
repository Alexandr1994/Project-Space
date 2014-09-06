package  {
	
	public class Radar extends Equipment{

		private var maxRadius:int;
		
		public function setupNewRadar():void
		{
			switch(getLevel())
			{
				case 1:
				{
					maxRadius=600;
				}break;
				case 2:
				{
					maxRadius=800;
				}break;
				case 3:
				{
					maxRadius=1000;
				}break;
				case 4:
				{
					maxRadius=1200;
				}break;
				case 5:
				{
					maxRadius=1400;
				}break;
				default:
				{
					maxRadius=0;
				}break;
			}
		}
		
		public function getRadarRadius():int
		{
			return maxRadius;
		}
		
	}
	
}
