package  {
import flash.display.MovieClip;

	public class PlanetLife
	{	
	
		private var fi: Number=0;
		private var Planet: MovieClip;
		private var planetOrbit: Number;
		private var speed:Number;

		public function initPlanet(newPlanet: MovieClip, newPlanetOrbit: Number, planetSize: Number, newSpeed:Number)
		{
			Planet=newPlanet;
			planetOrbit=newPlanetOrbit;
			Planet.width=Planet.height=planetSize;
			speed=newSpeed;
		}
	
		public function planetMoving(): void
		{
			fi+=speed
			Planet.x=planetOrbit*Math.cos(fi);
			Planet.y=planetOrbit*Math.sin(fi);
		}
	
		public function outputPlanetOnRadar(planetOnRadar: MovieClip, screenCenter: Number) :void
		{
			planetOnRadar.x=screenCenter+Planet.x/15;
			planetOnRadar.y=screenCenter+Planet.y/15;
		}
	







	}
	
}
