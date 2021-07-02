/// @desc Drop Fragments & Items

//Fragments that are dropped when destroyed
if (entityFragmentCount > 0) {
	fragmentArray = array_create(entityFragmentCount, entityFragment);	
	DropItems(x, y, fragmentArray);
}

//Items that are dropped when destroyed
if (entityDropList != -1){
	DropItems(x, y, entityDropList);	
}