function ActivateHatCat(){

	var _hasHat = (global.iLifted != noone) && (global.iLifted.object_index == oHat);
	switch (global.questStatus[? "TheHatQuest"]){
		//Not Started
		case 0:{
			//Player might have brought the hat back anyway
			if (_hasHat){
				//Complete Quest	
				QuestyDialogue(4);
				global.questStatus[? "TheHatQuest"] = 2;
				
				//Place hat on questy
				with (oQuestNPC) sprite_index = sQuestyHat;
				with (oHat) instance_destroy();
				global.iLifted = noone;
				with (oPlayer){
					spriteIdle	= sPlayer;
					spriteRun	= sPlayerRun;
				}
			}
			else{
				//Offer Quest
				QuestyDialogue(2);
			}
			
		} break;
		
		//Quest in Progress
		case 1:{
			if (_hasHat){
				//Complete Quest	
				QuestyDialogue(5);
				global.questStatus[? "TheHatQuest"] = 2;
				
				//Place hat on questy
				with (oQuestNPC) sprite_index = sQuestyHat;
				with (oHat) instance_destroy();
				global.iLifted = noone;
				with (oPlayer){
					spriteIdle	= sPlayer;
					spriteRun	= sPlayerRun;
				}
			}
			else{
				//Clue or Reminder for Quest
				QuestyDialogue(3);
			}
		} break;
		
		//Quest already Completed
		case 2:{
			QuestyDialogue(6);
		} break;
	}
	
}