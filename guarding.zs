
Class PowerGuarding : PowerProtection
{
	Default
	{
		+INVENTORY.ADDITIVETIME;
		Powerup.Duration -999;
		DamageFactor "Normal", 0.25;
		Inventory.Icon "STIMA0";
	}
}

class Guarding_Main : EventHandler
{
	bool guarding;
	int guardTimer;
	override void WorldLoaded (WorldEvent e)
	{
	}
	override void WorldTick()
	{
	}
	override void NetworkProcess (ConsoleEvent e)
	{
		let playe = PlayerPawn(players[e.Player].mo);
		if (e.Name ~== "GuardKeyEvent")
		{
			GuardToggle(e);
		}
	}
	void GuardToggle(ConsoleEvent e)
	{
		let playe = PlayerPawn(players[e.Player].mo);
		if(guarding){GuardRelease(e);}
		else{GuardPress(e);}
	}
	void GuardPress(ConsoleEvent e)
	{
		let playe = PlayerPawn(players[e.Player].mo);
		playe.A_GiveInventory("PowerGuarding", 1);
		guarding = 1;
		
		playe.A_SetViewRoll(playe.ViewRoll+2.0,SPF_INTERPOLATE);
		playe.A_SetViewPitch(playe.ViewPitch+2.0,SPF_INTERPOLATE);
		playe.A_SetViewAngle(playe.ViewAngle+2.0,SPF_INTERPOLATE);
	}
	void GuardRelease(ConsoleEvent e)
	{
		let playe = PlayerPawn(players[e.Player].mo);
		playe.A_TakeInventory("PowerGuarding", 1);
		guarding = 0;
		
		playe.A_SetViewRoll(playe.ViewRoll-2.0,SPF_INTERPOLATE);
		playe.A_SetViewPitch(playe.ViewPitch-2.0,SPF_INTERPOLATE);
		playe.A_SetViewAngle(playe.ViewAngle-2.0,SPF_INTERPOLATE);
	}
}
