package  {
import flash.display.MovieClip;
import flash.sensors.Accelerometer;

	public class MillitaryShip {
		
		private var fighterLife:Boolean=true;
		private var healthMax:int;
		private var health:int;
		private var maxMass: int;//максимальная грузоподёмность
		private var freeMass: int;//оставшаяся свободная масса
		private var rase:String;
		private var fighter:MovieClip;
		private var Rad: Number=Math.PI/2;
	
		
		{//оборудование корабля
			public var shipEngine:Engine=new Engine();//двигатель
			public var shipBattery:Battery=new Battery();//энергобатарея
			public var shipReactor:Reactor=new Reactor();//реактор
			public var shipShield:Shield=new Shield();//энергощит
			public var shipRadar:Radar=new Radar();//радар
			public var shipDroid:Droid=new Droid();//радар
		}
		{//вооружение
			public var weapon:Array=new Array();
			private var activWeaponSlot:int=0;//активный оружейный слот
		}
			
		
		
		public function initFighter(fighterView: MovieClip, fighterLevel:int, newRase:String): void
		{
			fighter=fighterView;
			rase=newRase;
			switch(fighterLevel)
			{
				case 1: 
				{
					healthMax=health=maxMass=freeMass=100;
					for(var i:int=0;i<1;i++)
					{
						weapon[i]=new Weapon();
						weapon[i].setupNewEquipment(1,20);
						
						if(Math.random()<0.5)
						{
							weapon[i].setupWeapon("plasma");
						}
						else
						{
							weapon[i].setupWeapon("laser");
						}
						
						
						freeMass-=weapon[i].getMass();
					}
				}break;
				case 2: 
				{
					for(var j:int=0;j<2;j++)
					{
						weapon[j]=new Weapon();
						weapon[j].setupNewEquipment(1+Math.random(),20);
						
						if(Math.random()<0.5)
						{
							weapon[j].setupWeapon("plasma");
						}
						else
						{
							weapon[j].setupWeapon("laser");
						}
						
						freeMass-=weapon[j].getMass();
					}
					healthMax=health=maxMass=freeMass=150;
				}break;
				case 3: 
				{
					for(var k:int=0;k<2;k++)
					{
						weapon[k]=new Weapon();
						weapon[k].setupNewEquipment(1+Math.random()*2,20);
						
						if(Math.random()<0.5)
						{
							weapon[k].setupWeapon("plasma");
						}
						else
						{
							weapon[k].setupWeapon("laser");
						}
						
						freeMass-=weapon[k].getMass();
					}
					healthMax=health=maxMass=freeMass=250;
				}break;
				case 4: 
				{
					for(var n:int=0;n<3;n++)
					{
						weapon[n]=new Weapon();
						weapon[n].setupNewEquipment(1+Math.random()*2,20);
						if(Math.random()<0.5)
						{
							weapon[n].setupWeapon("plasma");
						}
						else
						{
							weapon[n].setupWeapon("laser");
						}
						freeMass-=weapon[n].getMass();
					}
					healthMax=health=maxMass=freeMass=350;
				}break;
				case 5: 
				{
					for(var m:int=0;m<3;m++)
					{
						weapon[m]=new Weapon();
						weapon[m].setupNewEquipment(1+Math.random()*3,20);
						if(Math.random()<0.5)
						{
							weapon[m].setupWeapon("plasma");
						}
						else
						{
							weapon[m].setupWeapon("laser");
						}
						freeMass-=weapon[i].getMass();
					}
					healthMax=health=maxMass=freeMass=400;
				}break;
				default:
				{
					healthMax=health=0;
				}
			}
			initEngine(fighterLevel);
			initBattery(fighterLevel);
			initReactor(fighterLevel);
			initRadar(fighterLevel);
			initShield(fighterLevel);
			
		}
		
		private function initEngine(fighterLevel:int):void
		{
			switch(fighterLevel)
			{
				case 1: 
				{
					shipEngine.setupNewEquipment(1,30);
					shipEngine.setupNewEngine();
					freeMass-=shipEngine.getMass();
				}break;
				case 2: 
				{
					shipEngine.setupNewEquipment(1,20);
					shipEngine.setupNewEngine();
					freeMass-=shipEngine.getMass();
				}break;
				case 3: 
				{
					shipEngine.setupNewEquipment(2,30);
					shipEngine.setupNewEngine();
					freeMass-=shipEngine.getMass();
				}break;
				case 4: 
				{
					shipEngine.setupNewEquipment(3,30);
					shipEngine.setupNewEngine();
					freeMass-=shipEngine.getMass();
				}break;
				case 5: 
				{
					shipEngine.setupNewEquipment(2,30);
					shipEngine.setupNewEngine();
					freeMass-=shipEngine.getMass();
				}break;
				default:
				{
					shipEngine.setupNewEquipment(0,0);
					shipEngine.setupNewEngine();
				}
			}
		}
			
		private function initReactor(fighterLevel:int):void
		{
			switch(fighterLevel)
			{
				case 1: 
				{
					shipReactor.setupNewEquipment(1,20);
					shipReactor.setupNewReactor()
					freeMass-=shipReactor.getMass();
				}break;
				case 2: 
				{
					shipReactor.setupNewEquipment(1,20);
					shipReactor.setupNewReactor();
					freeMass-=shipReactor.getMass();
				}break;
				case 3: 
				{
					shipReactor.setupNewEquipment(2,20);
					shipReactor.setupNewReactor()
					freeMass-=shipReactor.getMass();
				}break;
				case 4: 
				{
					shipReactor.setupNewEquipment(3,20);
					shipReactor.setupNewReactor()
					freeMass-=shipReactor.getMass();
				}break;
				case 5: 
				{
					shipReactor.setupNewEquipment(3,30);
					shipReactor.setupNewReactor()
					freeMass-=shipReactor.getMass();
				}break;
				default:
				{
					shipReactor.setupNewEquipment(0,0);
					shipReactor.setupNewReactor()
				}
			}
		}
			
		private function initBattery(fighterLevel:int):void
		{
			switch(fighterLevel)
			{
				case 1: 
				{
					shipBattery.setupNewEquipment(1,20);
					shipBattery.setupNewBattery();
					freeMass-=shipBattery.getMass();
				}break;
				case 2: 
				{
					shipBattery.setupNewEquipment(1,20);
					shipBattery.setupNewBattery();
					freeMass-=shipBattery.getMass();
				}break;
				case 3: 
				{
					shipBattery.setupNewEquipment(2,20);
					shipBattery.setupNewBattery();
					freeMass-=shipBattery.getMass();
				}break;
				case 4: 
				{
					shipBattery.setupNewEquipment(3,20);
					shipBattery.setupNewBattery();
					freeMass-=shipBattery.getMass();
				}break;
				case 5: 
				{
					shipBattery.setupNewEquipment(3,30);
					shipBattery.setupNewBattery();
					freeMass-=shipBattery.getMass();
				}break;
				default:
				{
					shipBattery.setupNewEquipment(0,0);
					shipBattery.setupNewBattery();
				}
			}
		}
			
		private function initRadar(fighterLevel:int):void
		{
			switch(fighterLevel)
			{
				case 1: 
				{
					shipRadar.setupNewEquipment(1,20);
					shipRadar.setupNewRadar();
					freeMass-=shipRadar.getMass();
				}break;
				case 2: 
				{
					shipRadar.setupNewEquipment(2,20);
					shipRadar.setupNewRadar();
					freeMass-=shipRadar.getMass();
				}break;
				case 3: 
				{
					shipRadar.setupNewEquipment(3,20);
					shipRadar.setupNewRadar();
					freeMass-=shipRadar.getMass();
				}break;
				case 4: 
				{
					shipRadar.setupNewEquipment(4,20);
					shipRadar.setupNewRadar();
					freeMass-=shipRadar.getMass();
				}break;
				case 5: 
				{
					shipRadar.setupNewEquipment(5,20);
					shipRadar.setupNewRadar();
					freeMass-=shipRadar.getMass();
				}break;
				default:
				{
					shipRadar.setupNewEquipment(0,0);
					shipRadar.setupNewRadar();
				}
			}
		}
		
		private function initShield(fighterLevel:int):void
		{
			switch(fighterLevel)
			{
				case 2: 
				{
					shipShield.setupNewEquipment(1,20);
					shipShield.setupNewShield();
					freeMass-=shipShield.getMass();
				}break;
				case 3: 
				{
					shipShield.setupNewEquipment(2,20);
					shipShield.setupNewShield();
					freeMass-=shipShield.getMass();
				}break;
				case 4: 
				{
					shipShield.setupNewEquipment(3,20);
					shipShield.setupNewShield();
					freeMass-=shipShield.getMass();
				}break;
				case 5: 
				{
					shipShield.setupNewEquipment(3,20);
					shipShield.setupNewShield();
					freeMass-=shipShield.getMass();
				}break;
				default:
				{
					shipShield.setupNewEquipment(0,0);
					shipShield.setupNewShield();
				}
			}
		}

		private function initDroid(fighterLevel:int):void
		{
			switch(fighterLevel)
			{
				case 1: 
				{
					shipDroid.setupNewEquipment(0,0);
					shipDroid.setupNewDroid();
					freeMass-=shipDroid.getMass();
				}break;
				case 2: 
				{
					shipDroid.setupNewEquipment(1,20);
					shipDroid.setupNewDroid();
					freeMass-=shipDroid.getMass();
				}break;
				case 3: 
				{
					shipDroid.setupNewEquipment(1,20);
					shipDroid.setupNewDroid();
					freeMass-=shipDroid.getMass();
				}break;
				case 4: 
				{
					shipDroid.setupNewEquipment(2,30);
					shipDroid.setupNewDroid();
					freeMass-=shipDroid.getMass();
				}break;
				case 5: 
				{
					shipDroid.setupNewEquipment(3,20);
					shipDroid.setupNewDroid();
					freeMass-=shipDroid.getMass();
				}break;
				default:
				{
					shipDroid.setupNewEquipment(0,0);
					shipDroid.setupNewDroid();
					freeMass-=shipDroid.getMass();
				}
			}
		}

		public function followTarget(TargetX, TargetY): Number
		{
			var dX:Number=Math.abs(TargetX-fighter.x);//разность х координат истребителя и игрока
			var dY:Number=Math.abs(TargetY-fighter.y);//разность у координат истребителя и игрока
			var dX2:Number=TargetX-fighter.x;
			var dY2:Number=TargetY-fighter.y;
			var distToTarget:Number=Math.pow(Math.pow(dX,2)+Math.pow(dY,2),0.5);//расстояние между истребителем и игроком
			var beta:Number=Math.acos(dX/distToTarget);//угол между перпедикуляром к Ох и прямой через корабль игрока и истребитель
			var alfa:Number=(Math.PI/2)-beta;// угол между Ох и прямой через корабль игрока и истребитель

			if(dX2<=0 && dY2>=0)//правильное 
			{
				alfa-=0.5*Math.PI;
				if(Math.abs(Rad-alfa)>3*(Math.PI/180))
				{
					if(alfa<Rad)
					{
						fighterRotate(-1);
					}
					if(alfa>Rad)
					{
						fighterRotate(1);
					}
				}
			}
			if(dX2>=0 && dY2>=0)//правильное
			{
				alfa=-alfa-0.5*Math.PI;
				if(Math.abs(Rad-alfa)>3*(Math.PI/180))
				{
					if(alfa<Rad)
					{
						fighterRotate(-1);
					}
					if(alfa>Rad)
					{
						fighterRotate(1);
					}
				}
			}
			if(dX2>=0 && dY2<=0) //правильное
			{
				alfa+=0.5*Math.PI;
				if(Math.abs(Rad-alfa)>3*(Math.PI/180))
				{
					if(alfa<Rad)
					{
						fighterRotate(-1);
					}
					if(alfa>Rad)
					{
						fighterRotate(1);
					}
				}
			}
			if(dX2<=0 && dY2<=0)//правильное
			{
				alfa=-alfa+0.5*Math.PI;
				if(Math.abs(Rad-alfa)>3*(Math.PI/180))
				{
					if(alfa<Rad)
					{
						fighterRotate(-1);
					}
					if(alfa>Rad)
					{
						fighterRotate(1);
					}
				}
			}
			if(distToTarget>50 && distToTarget<690)
			{
				moving();
			}
			else
			{
				if(distToTarget>50 && Math.abs(Rad-alfa)<3*(Math.PI/180))
				{
					moving();
				}
			}
			return alfa-Rad;
		}
		
		public function followPlanet(planetX, planetY): void
		{
			var dX:Number=Math.abs(planetX-fighter.x);//разность х координат истребителя и игрока
			var dY:Number=Math.abs(planetY-fighter.y);//разность у координат истребителя и игрока
			var dX2:Number=planetX-fighter.x;
			var dY2:Number=planetY-fighter.y;
			var distToPlanet:Number=Math.pow(Math.pow(dX,2)+Math.pow(dY,2),0.5);//расстояние между истребителем и игроком
			var beta:Number=Math.acos(dX/distToPlanet);//угол между перпедикуляром к Ох и прямой через корабль игрока и истребитель
			var alfa:Number=(Math.PI/2)-beta;// угол между Ох и прямой через корабль игрока и истребитель

			if(dX2<=0 && dY2>=0)//правильное 
			{
				alfa-=0.5*Math.PI;
				if(Math.abs(Rad-alfa)>30*(Math.PI/180))
				{
					if(alfa<Rad)
					{
						fighterRotate(-2);
					}
					if(alfa>Rad)
					{
						fighterRotate(2);
					}
				}
			}
			if(dX2>=0 && dY2>=0)//правильное
			{
				alfa=-alfa-0.5*Math.PI;
				if(Math.abs(Rad-alfa)>30*(Math.PI/180))
				{
					if(alfa<Rad)
					{
						fighterRotate(-2);
					}
					if(alfa>Rad)
					{
						fighterRotate(2);
					}
				}
			}
			if(dX2>=0 && dY2<=0) //правильное
			{
				alfa+=0.5*Math.PI;
				if(Math.abs(Rad-alfa)>30*(Math.PI/180))
				{
					if(alfa<Rad)
					{
						fighterRotate(-2);
					}
					if(alfa>Rad)
					{
						fighterRotate(2);
					}
				}
			}
			if(dX2<=0 && dY2<=0)//правильное
			{
				alfa=-alfa+0.5*Math.PI;
				if(Math.abs(Rad-alfa)>30*(Math.PI/180))
				{
					if(alfa<Rad)
					{
						fighterRotate(-2);
					}
					if(alfa>Rad)
					{
						fighterRotate(2);
					}
				}
			}
			moving();
		}
		
		private function moving(): void
		{
			if(shipBattery.getEnergy()>0)
			{
				fighter.x-=shipEngine.getForwardSpeed()*Math.cos(Rad);
				fighter.y-=shipEngine.getForwardSpeed()*Math.sin(Rad);
				shipBattery.energyChange(-1);
			}
		}
		
		private function fighterRotate(rotateSide:Number): void
		{
			if(shipBattery.getEnergy()>0)
			{
				Rad+=rotateSide*shipEngine.getRotationSpeed()*(Math.PI/180);
				fighter.rotation+=rotateSide*shipEngine.getRotationSpeed();
				shipBattery.energyChange(-1);
			}
		}

			
		private function getPatrolOrbit():Number
		{
			var patrolOrbit=Math.pow(Math.pow(fighter.x,2)+Math.pow(fighter.y,2),0.5);
			return patrolOrbit;
		}
		
		private function getOrbitAngle():Number
		{
			var currentAngle=Math.atan(fighter.y/fighter.x);
			return currentAngle;
		}
		
		public function patrolSystem():void
		{	
			var patrolOrbit;
			var angleSpeed;
			if(fighter.x<0)
			{
				patrolOrbit=-1*getPatrolOrbit();
				angleSpeed=-2/patrolOrbit;
			}
			else
			{
				patrolOrbit=getPatrolOrbit();
				angleSpeed=2/patrolOrbit;
			}
			var currentAngle=getOrbitAngle();
			currentAngle+=angleSpeed;
			fighter.x=patrolOrbit*Math.cos(currentAngle);
			fighter.y=patrolOrbit*Math.sin(currentAngle);
			if(currentAngle==2*Math.PI)
			{
				currentAngle=0;
			}
			if(fighter.x>=0)
			{
				Rad=1.5*Math.PI+currentAngle;
				fighter.rotation=(Math.PI+currentAngle)*(180/Math.PI);
			}
			else
			{
				Rad=0.5*Math.PI+currentAngle;
				fighter.rotation=currentAngle*(180/Math.PI);
			}
		}
		
		public function fighterOnStar(starSystem: MovieClip):void//приближение к звезде
		{
			var X: Number = Math.abs(fighter.x-starSystem.Star.x);//рахница между координатами центра звезды
			var Y: Number = Math.abs(fighter.y-starSystem.Star.y);//и координатами корабля
			var distanseFromStar: Number=Math.pow(Math.pow(X+5,2)+Math.pow(Y+5,2),0.5);	
			if(fighter && distanseFromStar<starSystem.Star.width/2)
			{
				getDamage(5);
			}
		}
		
		public function getDamage(damage:int): void//получение урона
		{
			if(fighterLife)
			{
				if(shipShield.getShieldCondition())
				{
					shipShield.shieldDamage(damage);
				}
				else
				{
					health-=damage;
				}
				if(health<=0)
				{
					fighterDestroy();
				}
			}
		}
		
		private function fighterDestroy(): void//уничтожение боевого корабля
		{
			fighterLife=false;
		}
		
		public function fighterCondition(): Boolean//проверка; уничтожен ли корабль
		{
			return fighterLife;
		}
		
		public function getWeaponSlot():int
		{
			return 	activWeaponSlot;
		}
		
		public function changeWeaponSlot():void
		{
			var minOverHeatingSlot:int=activWeaponSlot;
			for(var i:int=0;i<weapon.length;i++)
			{
				if(weapon[i].getOverheating<weapon[minOverHeatingSlot].getOverheating)
				{
					minOverHeatingSlot=i;
				}
			}
			activWeaponSlot=minOverHeatingSlot;
		}
		
		public function getRase():String
		{
			return rase;
		}
		
		public function getHealth():int
		{
			return health;
		}
		
		public function getHealthMax():int
		{
			return healthMax;
		}
		
		public function fullRepair():void
		{
			health=healthMax;
		}
		
		public function crash(k:Number):void
		{

			fighter.x-=shipEngine.getForwardSpeed()*k;
			fighter.y-=shipEngine.getForwardSpeed()*k;
			getDamage(10);
		}
		

	}
	
}
