package  {
	
import flash.display.MovieClip;


	public class HeroShip {
	
	private var MyShip: MovieClip;
	private var Health: int;
	
	private var onUpPress: Boolean=false;
	private var onDownPress: Boolean=false;
	private var onRightPress: Boolean=false;
	private var onLeftPress: Boolean=false;
	
	private var Forcage: Boolean=false;
	private var force:Number=1;
	
	private var Rad: Number=Math.PI/2;
	
	
	public function initShipView(newView: MovieClip): void
	{
		MyShip=newView;
		MyShip.x=275;
		MyShip.y=200;
	}
	
	public function pilotCommand(key:int,starSystem: MovieClip): void
	{
		switch(key)
		{
			case 38:
			{
				onUpPress=true;
				onDownPress=false;
			}break;
			case 40:
			{
				onDownPress=true;
				onUpPress=false;
			}break;
			case 37:
			{
				onLeftPress=true;
				onRightPress=false;
			}break;
			case 39:
			{
				onRightPress=true;
				onLeftPress=false;
			}break;
			case 16:
			{
				if(Forcage==true) Forcage=false;
				else Forcage=true;
			}break;
		}
		moving(starSystem);
	}

	public function stopFly()
	{
		if(onRightPress || onLeftPress)
		{
			onRightPress=false;
			onLeftPress=false;
		}
		else
		{
			onUpPress=false;
			onDownPress=false;
		}
	}


	private function moving(starSystem: MovieClip): void
	{
		if(Forcage==true) force=2;
		else force=1;
		if(onUpPress)
		{
			starSystem.x+=5*force*Math.cos(Rad);
			starSystem.y+=5*force*Math.sin(Rad);
		}
		if(onDownPress)
		{
			starSystem.x-=5*force*Math.cos(Rad);
			starSystem.y-=5*force*Math.sin(Rad);
		}
		if(onLeftPress)
		{
			Rad-=3*(Math.PI/180);
			MyShip.rotation-=3;
		}
		if(onRightPress)
		{
			Rad+=3*(Math.PI/180);
			MyShip.rotation+=3;
		}
	}

	public function getXShip(): Number
	{
		return MyShip.x;
	}
	
	public function getYShip(): Number
	{
		return MyShip.y;
	}
	
	}
	
}
