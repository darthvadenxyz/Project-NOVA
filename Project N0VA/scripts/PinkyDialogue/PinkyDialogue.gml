function PinkyDialogue(_textCase){

	global.dialogueScript = PinkyDialogue;
	
	//Setup Variables
	var bg			= TEXTBOX_COLOR;
	var nr			= -1;	//no responses

	//Protagonist Variables
	var npcName	= "PINKY";
	
	switch(_textCase) {
		
		//Test
		case 0: {
			NewTextBox("Hello, I am a friendly NPC Robot.", bg, nr, npcName);
			NewTextBox("This place used to be full of humans.\nThen one day they all disappeared.", bg, nr, npcName);
			NewTextBox("I will wait here until they return.\nThen I will have a purpose again.", bg, nr, npcName);
		} break;
		
	}

}