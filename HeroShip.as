package  {
	
import flash.display.MovieClip;
import flash.ui.Keyboard;

	public class HeroShip {
		
		private var shipLife:Boolean=true;//состояние корабля(цел/уничтожен)
		private var MyShip: MovieClip;//корабль игрока
		private var Compase: MovieClip;//компас(указатель на звезду)
		private var maxMass: int=250;//максимальная грузоподёмность
		private var freeMass: int=maxMass;//оставшаяся свободная масса
		private var rase:String="Человек";
		private var HealthMax: int=250;//максимальный запас прочности
		private var Health: int = HealthMax;//текущий запас прочности
		private var Money:int=2000;
		
		{//оборудование корабля
			public var shipEngine:Engine=new Engine();//двигатель
			public var shipBattery:Battery=new Battery();//энергобатарея
			public var shipReactor:Reactor=new Reactor();//реактор
			public var shipShield:Shield=new Shield();//энергощит
			public var shipRadar:Radar=new Radar();//радар
			public var shipDroid:Droid= new Droid();//ремдроид
			{//вооружение
				public var weapon:Array=new Array();
				private var activWeaponSlot:int=0;//активный оружейный слот
			}
		}
		
		{
			private var Name:String;//имя пилота
			private var shipName:String;//назване корабля
			private var piratesDestroy:int=0;//число сбитых пиратов
			private var rang:String="КУРСАНТ";//звание пилота
		}
		
		public function initWepon():void
		{
			weapon[0]=new Weapon();//оружейный слот 1
			weapon[1]=new Weapon();//оружейный слот 2
			weapon[2]=new Weapon();//оружейный слот 3
		}
		
		private var onUpPress: Boolean=false;//индикатор нажатия на клавишу-стрелку
		private var onDownPress: Boolean=false;
		private var onRightPress: Boolean=false;
		private var onLeftPress: Boolean=false;
		
		{//режимы корабля
			private var Forcage: Boolean=false;//активирован/деактивирован режим форсажа
			private var force:Number=1;//коэффициент форсажа
			private var Rad: Number=Math.PI/2;//поворот корабля 
		}
		
		public function initShipView(newHeroName:String,newShipName:String,newView:MovieClip, CompaseView:MovieClip,stageWidth,stageHeight): void
		{
			Name=newHeroName;
			shipName=newShipName;
			MyShip=newView;
			Compase=CompaseView;
			MyShip.x=Compase.x=stageWidth/2-(stageWidth-800)/2;
			MyShip.y=Compase.y=stageHeight/2-(stageHeight-580)/2;
			initWepon();
			{//инициализация движка
				shipEngine.setupNewEquipment(1,30);
				shipEngine.setupNewEngine();
				freeMass-=shipEngine.getMass();
			}
			{//инициализация энергобатареи
				shipBattery.setupNewEquipment(1,40);
				shipBattery.setupNewBattery();
				freeMass-=shipBattery.getMass();
			}
			{//инициализация реактора
				shipReactor.setupNewEquipment(1,20);
				shipReactor.setupNewReactor();
				freeMass-=shipReactor.getMass();
			}
			{//инициализация щита
				shipShield.setupNewEquipment(0,30);
				shipShield.setupNewShield();
				freeMass-=shipShield.getMass();
			}
			{//инициализация радара
				shipRadar.setupNewEquipment(0,20);
				shipRadar.setupNewRadar();
				freeMass-=shipRadar.getMass();
			}
			{//инициализация дроида
				shipDroid.setupNewEquipment(0,20);
				shipDroid.setupNewDroid()
				freeMass-=shipDroid.getMass();
			}
			{
				{
					weapon[0].setupNewEquipment(1,20);
					weapon[0].setupWeapon("plasma");
					freeMass-=weapon[0].getMass();
				}
				{
					weapon[1].setupNewEquipment(1,20);
					weapon[1].setupWeapon("laser");
					freeMass-=weapon[1].getMass();
				}
				{
					weapon[2].setupNewEquipment(0,0);
					weapon[2].setupWeapon("laser");
					freeMass-=weapon[2].getMass();
				}
				
			}
		}//инициализация внешнего вида корабля, начального оборудования и оружия и компаса игрока
		
		public function compaseFunction(starSystem: MovieClip): void//определение направления компаса
		{
			var X: Number = Math.abs(MyShip.x-starSystem.x);
			var Y: Number = Math.abs(MyShip.y-starSystem.y);
			var X2: Number = MyShip.x-starSystem.x;
			var Y2: Number = MyShip.y-starSystem.y;
			
			if(starSystem.y<MyShip.y)
			{
				Compase.rotation=360-Math.atan(X2/Y2)*(180/Math.PI);
			}
			else
			{
				Compase.rotation=180-Math.atan(X2/Y2)*(180/Math.PI);
			}
		}
		
		public function pilotCommand(key:int,starSystem: MovieClip): void//реакция на нажатие клавиши
		{
			switch(key)
			{
				case Keyboard.W:
				{
					onUpPress=true;
				}break;
				case Keyboard.S:
				{
					onDownPress=true;
				}break;
				case Keyboard.A:
				{
					onLeftPress=true;
				}break;
				case Keyboard.D:
				{
					onRightPress=true;
				}break;
				case Keyboard.SHIFT:
				{
					if(Forcage==true) Forcage=false;
					else Forcage=true;
				}break;
				case Keyboard.CONTROL:
				{
					if(shipShield.getShieldPowerMax()>=100)
					{
						shipShield.activeShield();
					}
				}break;
			}
		}
	
		public function stopFly(key:int)//реакция на отжатие клавиши
		{
			switch(key)
			{
				case Keyboard.W:
				{
					onUpPress=false;
				}break;
				case Keyboard.S:
				{
					onDownPress=false;
				}break;
				case Keyboard.A:
				{
					onLeftPress=false;
				}break;
				case Keyboard.NUMBER_1:
				{
					activWeaponSlot=0;
				}break;
				case Keyboard.NUMBER_2:
				{
					activWeaponSlot=1;
				}break;
				case Keyboard.NUMBER_3:
				{
					activWeaponSlot=2;
				}break;			
				case Keyboard.D:
				{
					onRightPress=false;
				}break;
			}
		}
	
	
		public function moving(starSystem: MovieClip,Background: MovieClip): void//функция движения корабля
		{
			if(shipLife && shipBattery.getEnergy()>0)
			{
				if(Forcage==true) force=2;
				else force=1;
				if(onUpPress)
				{
					starSystem.x+=shipEngine.getForwardSpeed()*force*Math.cos(Rad);
					starSystem.y+=shipEngine.getForwardSpeed()*force*Math.sin(Rad);
					Background.x+=shipEngine.getForwardSpeed()*force*Math.cos(Rad)*0.2;
					Background.y+=shipEngine.getForwardSpeed()*force*Math.sin(Rad)*0.2;
					shipBattery.energyChange(-1*force);
				}
				if(onDownPress)
				{
					starSystem.x-=shipEngine.getReversSpeed()*force*Math.cos(Rad);
					starSystem.y-=shipEngine.getReversSpeed()*force*Math.sin(Rad);
					Background.x-=shipEngine.getReversSpeed()*force*Math.cos(Rad)*0.2;
					Background.y-=shipEngine.getReversSpeed()*force*Math.sin(Rad)*0.2;					
					shipBattery.energyChange(-1*force);
				}
				if(onLeftPress)
				{
					Rad-=shipEngine.getRotationSpeed()*(Math.PI/180);
					MyShip.rotation-=shipEngine.getRotationSpeed();
					shipBattery.energyChange(-1*force);
				}
				if(onRightPress)
				{
					Rad+=shipEngine.getRotationSpeed()*(Math.PI/180);
					MyShip.rotation+=shipEngine.getRotationSpeed();
					shipBattery.energyChange(-1*force);
				}
			}
		}
	
		public function shipActiv():void//действия происходящие с кораблем не прерывно
		{
			if(shipLife)
			{
				if(shipBattery.getEnergy()<shipBattery.getEnergyMax())
				{
					shipBattery.energyChange(shipReactor.getReactorWork());//подзарядка энергобатарей
				}
				shipShield.shieldConditionTest();//проверка состояния энергощита
				if(shipShield.getShieldCondition())
				{
					shipBattery.energyChange(-3);//энерго затраты на удержание щита
				}
				if(shipBattery.getEnergy()<20)
				{
					shipShield.deactiveShield();//сброс щита при недостатке энергии
				}
				if(shipReactor.getReactorWork()<=0 && shipBattery.getEnergy()<=0)
				{
					shipDestroy();
				}
			}
		}
	
		public function getXShip(): Number//вывод координаты корабля Х
		{
			return MyShip.x;
		}
		
		public function getYShip(): Number//вывод координаты корабля Y
		{
			return MyShip.y;
		}
		
		public function getShipHealth(): int//вывод текущего запаса прочности
		{
			return Health;
		}
		
		public function getShipHealthMax(): int//вывод максимального запаса прочности
		{
			return HealthMax;
		}
		
		public function shipDestroy(): void//уничтожение корабля игрока
		{
			Compase.visible=false;
			shipLife=false;
		}
		
		public function shipOnStar(starSystem: MovieClip):void//приближение к звезде
		{
			var X: Number = Math.abs(MyShip.x-starSystem.x);//рахница между координатами центра звезды
			var Y: Number = Math.abs(MyShip.y-starSystem.y);//и координатами корабля
			var distanseFromStar: Number=Math.pow(Math.pow(X+5,2)+Math.pow(Y+5,2),0.5);	
			if(shipLife && distanseFromStar<250)
			{
				if(shipBattery.getEnergy()<shipBattery.getEnergyMax())
				{
					shipBattery.energyChange(5);
				}
				getDamage(5);
			}
		}
		
		public function reloadBattery():void//полная перезарядка энергобатареи
		{
			shipBattery.energyChange(shipBattery.getEnergyMax()-shipBattery.getEnergy());
		}
		
		public function getDamage(damage:int): void//получение урона
		{
			if(shipLife)
			{
				if(shipShield.getShieldCondition())
				{
					shipShield.shieldDamage(5);
				}
				else
				{
					Health-=damage;
				}
			}
		}
		
		public function fullRepair():void//полный ремонт корабля
		{
			Health=HealthMax;
		}
		
		public function getWeaponSlot():int//получить номер активного оружейного слота
		{
			return 	activWeaponSlot;
		}
	
		public function getRase():String//получить расу игрока
		{
			return rase;
		}
		
		public function getMoney():int//получить состояние денежного счета игрока
		{
			return Money;
		}
		
		public function getCurrentMass():int//получить текущую массу корабля
		{
			return maxMass-freeMass;
		}
	
		public function getMaxMass():int//получить максимальную массу корабля
		{
			return maxMass;
		}
		
		public function periodicalRepairShip(repWork:int):void//переодический ремонт корабля дроидом
		{
			if(shipLife && Health<HealthMax)
			{
				Health+=repWork;
				shipBattery.energyChange(-shipDroid.getDroidNeed());
			}
		}
		
		public function crash(starSystem,Background,k:Number):void//функция столкновения с пиратским кораблем
		{
			starSystem.x-=shipEngine.getReversSpeed()*force*k;
			starSystem.y-=shipEngine.getReversSpeed()*force*k;
			Background.x-=shipEngine.getReversSpeed()*force*k*0.2;
			Background.y-=shipEngine.getReversSpeed()*force*k*0.2;
			getDamage(10);
		}
	
		public function changeMoneyKol(moneyKol:int)//изменеие состояния денежного счета
		{
			Money+=moneyKol;
		}
	
		public function getDestroyPiratesKol():int//получение числа уничтоженных пиратов
		{
			return piratesDestroy;
		}
		
		public function getRang():String//получение звания пилота
		{
			return rang;
		}
		
		public function changeDestroyPiratesKol():void//изменение числа сбитых пиратов
		{
			piratesDestroy++;
			rangStatus();
		}
		
		public function getHeroName():String//получение имени пилота
		{
			return Name;
		}
		
		public function getShipName():String//получение названия корабля
		{
			return shipName;
		}
		
		public function getForcageCondition():Boolean//получение состояния форсажа
		{
			return Forcage;
		}
		
		public function selectWeaponSlot(newSlot:int):void//выбор активного оружейного слота
		{
			activWeaponSlot=newSlot;
		}
		
		private function rangStatus():void//функция изменения воинского звания пилота
		{
			if(piratesDestroy>10)
			{
				rang="ЛЕЙТЕНАНТ";
				Money+=50;
			}
			if(piratesDestroy>20)
			{
				rang="КАПИТАН";
				Money+=50;
			}
			if(piratesDestroy>30)
			{
				rang="КОМАНДОР";
				Money+=50;
			}
			if(piratesDestroy>40)
			{
				rang="АДМИРАЛ";
				Money+=50;
			}
		}
	}
}
