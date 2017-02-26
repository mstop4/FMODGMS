/// @description (Old DnD) - fullscreen
/// @param type type of fullscreen (1 == not fullscreen, 2 == fullscreen, anything else change what you are )
switch( argument0 ) {
case 1: 
	window_set_fullscreen( true ); 
	break;
case 2: 
	window_set_fullscreen( false ); 
	break;
default:
	window_set_fullscreen( window_get_fullscreen() ? false : true );
	break;
} // end switch
