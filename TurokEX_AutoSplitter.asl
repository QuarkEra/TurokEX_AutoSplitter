/*

Note: final split is on the level change from Final Confrontation to Ending which takes place shortly after the Campaigner's actual death, manual split must be made for now if a split at his moment of death is desired

*/

state ("sobek")
{
	string255 Level : 0x3AE25C, 0x0; // map id - unpack the Turok .kpf file with 7zip and look in the defs folder for the mapinfo.txt file for map details
	// int campaignerHp : 0x393118, 0xE0; 
}
// 00393118, 0xE0; campaignerHp commented out due to conflicting split

startup
{ 
	settings.Add("the hub", true, "The Hub");
	settings.Add("Ancient City", true, "Ancient City");
	settings.Add("the Jungle", true, "The Jungle");
	settings.Add("the ruins", true, "The Ruins");
	settings.Add("the catacombs", true, "The Catacombs");
	settings.Add("the treetop village", true, "The Treetop Village");
	settings.Add("the lost land", true, "The Lost Land");
	settings.Add("the final confrontation", true, "The Final Confontation");
}

}

start // Starts the timer when moving from the title screen to another level
{
	return (old.Level == "title" && current.Level != "title");
}

reset // Resets the timer on the title screen
{
	return (current.Level == "title");
}

split // Splits when travelling *from* the hub *to* another level and last when the campaigner is dead and Turok escapes through the tunnel
{
	return (
	old.Level == "the hub" && current.Level == "the ancient city" 
	|| old.Level == "the hub" && current.Level == "the jungle" 
	|| old.Level == "the hub" && current.Level == "the ruins" 
	|| old.Level == "the hub" && current.Level == "the catacombs" 
	|| old.Level == "the hub" && current.Level == "the treetop village" 
	|| old.Level == "the hub" && current.Level == "the lost land" 
	|| old.Level == "the hub" && current.Level == "the final confrontation" 
	|| current.Level == "ending" 
	// || current.Level == "the final confrontation" && current.campaignerHp == 0 // splits on entering level 8 OR when killing the campaigner having warped there bypassing level 8 :( would prefer to split on campaigner death separately obviously
	);
}