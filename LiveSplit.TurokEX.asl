// MY SPLITS ARE AS FOLLOWS
//
//	The Hub
//	The Jungle
//	Ancient City
//	The Ruins
//	The Catacombs
//	The Treetop Village
//	The Lost Land
//	The Final Confrontation
//	Thunder
//	The Campaigner
//

state ("sobek")
{
	string255 Level : 0x3AE25C, 0x0; // map id - unpack the Turok .kpf file with 7zip and look in the defs folder for the mapinfo.txt file for map details
	int thunderAndCampaignerHealth : 0x393118, 0xE0; // T-rex and Campaigner share health in memory, dont know why only these two and not the longhunter or mantis bosses
}

startup
{ 

}

init
{

}

exit
{

}

update
{

}

start // Starts the timer when moving from the title screen to another level
{
	return (old.Level == "title" && current.Level != "title");
}

reset // Resets the timer on the title screen
{
	return (current.Level == "title");
}

split // Splits when travelling *from* the hub *to* another level and when the last two bosses die totalling TEN splits as per the current route I know of
{
	return (
	old.Level == "the hub" && current.Level == "the ancient city" 
	|| old.Level == "the hub" && current.Level == "the jungle" 
	|| old.Level == "the hub" && current.Level == "the ruins" 
	|| old.Level == "the hub" && current.Level == "the catacombs" 
	|| old.Level == "the hub" && current.Level == "the treetop village" 
	|| old.Level == "the hub" && current.Level == "the lost land" 
	|| old.Level == "the hub" && current.Level == "the final confrontation" 
	|| current.thunderAndCampaignerHealth == 6000 && old.thunderAndCampaignerHealth == 0 // splits at start of thunder battle
	|| current.Level == "the final confrontation" && current.thunderAndCampaignerHealth == 0 && old.thunderAndCampaignerHealth != 0 // splits on death of thunder AND death of campaigner
	);
}

gameTime
{

}

isLoading
{

}
