package  {
import flash.display.MovieClip;

	public class PlanetLife
	{	
	
		private var fi: Number=0;
		private var Planet: MovieClip;
		private var shadowOnPlanet: MovieClip;
		private var planetOrbit: Number;
		private var speed:Number;
		private var habitable:Boolean;
		private var population:int;
		private	var race:String; 

		{
			private var food:int;
			private var minerals:int;
			private var technic:int;
			private var medecine:int;
		}
		
		
		public function initPlanet(newPlanet: MovieClip, newPlanetOrbit: Number, newSpeed:Number, hadHabitable:Boolean, newRace:String)
		{
			Planet=newPlanet;
			planetOrbit=newPlanetOrbit;
			shadowOnPlanet=newPlanet.Shadow;
			speed=newSpeed;
			habitable=hadHabitable;
			population=1000+Math.random()*4000;
			if(habitable)
			{
				race=newRace;
			}
			
		}
	
		public function planetMoving(): void
		{
			fi+=speed
			shadowOnPlanet.rotation=fi*180/Math.PI;
			Planet.x=planetOrbit*Math.cos(fi);
			Planet.y=planetOrbit*Math.sin(fi);
		}
	
		public function outputPlanetOnRadar(planetOnRadar: MovieClip, screenCenter: Number) :void
		{
			planetOnRadar.x=screenCenter+Planet.x/15;
			planetOnRadar.y=screenCenter+Planet.y/15;
		}
	

		public function getPlanetRace():String
		{
			return race;
		}

		public function getHabitable():Boolean
		{
			return habitable;
		}



	}
	
}
