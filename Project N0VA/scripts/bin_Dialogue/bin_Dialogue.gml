function DialogueResponses(_response){
	/// @arg Response
	switch(_response){
		case 0: break;
		case 1: NewTextBox("Cool beans", 1, -1); break;
		case 2: {
			NewTextBox("Well that was rather quite rude...", 1, ["0:I'm sorry","3:Good, get used to it."]);
		} break;
		case 3: NewTextBox("'Questy will remember that'", 3, -1); break;
		case 4: {
			NewTextBox("Thanks!", 2); 
			NewTextBox("I think I left it in that scary cave to the north east!", 2);
			global.questStatus[? "TheHatQuest"] = 1;	//Set quest to active
		} break;		
		case 5: NewTextBox(":(", 2); break;
		default: break;
	}
}


function QuestyDialogue(_text){
	
	//Setup Variables
	var bg			= TEXTBOX_COLOR;
	var nr			= -1;	//no responses
	
	/// @arg Message	
	switch(_text){
		case 0: break;
		//Questy Intro
		case 1: {
			NewTextBox("Hello There!", 1, -1); 
			NewTextBox("My Name is Questy.", 1, -1);
			NewTextBox("I am in charge on guiding you\nalong your great adventure!", 1, -1);
			NewTextBox("Well I hope we get along!", 1, ["1:Yeah Me Too","2:I don't want your help, BAKA!"]);
		} break;
		
		//Questy gives TheHatQuest
		case 2:{
			NewTextBox("Hello there! You look like a brave adventurer!\nWhat with the cape and all.", bg, -1);
			NewTextBox("Could you help me find my missing hat?", -1, 
			["4: Of course!", "5: This task is beneath me."]);			
		} break;
		
		//Questy reminds player of TheHatQuest
		case 3:{
			NewTextBox("I think I left it in that scary cave to the north east!", 2);
			NewTextBox("You might need some items to get there.", 2);		
		} break;
		
		//Return hat without first activating quest
		case 4:{
			NewTextBox("Wow, you found my hat without me even asking you to!", 2);
			NewTextBox("You are a true hero indeed!", 2);		
		} break;
		
		//Return Hat after being assigned quest
		case 5:{
			NewTextBox("Wow, you found my hat!", 2);
			NewTextBox("You are a true hero indeed!", 2);		
		} break;
		
		//Questy: TheHatQuest is already complete
		case 6: {
			NewTextBox("Thanks again!", 2);	
		}
		
		default: break;
	}
}