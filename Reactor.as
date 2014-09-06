package  {
	
	public class Reactor extends Equipment{
		
		private var reactorWork:int;//выработка реамтора

		public function setupNewReactor() 
		{//установка новых характеристик реактора
			switch(getLevel())
			{
				case 1:
				{
					reactorWork=1;
				}break;
				case 2:
				{
					reactorWork=2;
				}break;
				case 3:
				{
					reactorWork=3;
				}break;
				case 4:
				{
					reactorWork=4;
				}break;
				case 5:
				{
					reactorWork=5;
				}break;
				default:
				{
					reactorWork=0;
				}break;
			}
		}
	
		
		public function getReactorWork():int//получить выработку реактора
		{
			return reactorWork;
		}

	}
	
}
