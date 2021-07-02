function PlayerThoughts(_textCase){

	// Set as current global dialogue script
	global.dialogueScript = PlayerThoughts;
	
	//Setup Variables
	var bg			= TEXTBOX_COLOR;
	var nr			= -1;	//no responses
	
	//Protagonist Variables
	var protagName	= "TOBY";
	
	switch(_textCase) {
		
		//Test
		case 0: {
			NewTextBox("This is a test message for Bobby", bg, nr, protagName);
			NewTextBox("This is a test message for Bobby.\nThis one has a second line to it.", bg, nr, protagName);
		} break;
		
	}

}