///shift_hue(amount)
function shift_hue(amount) {
	// Shifts the hue using modular arithmetic
	{
	    hue_shift = (hue_shift + amount) mod 256;
	    draw_set_color(make_color_hsv((hue+hue_shift) mod 256,128,255));
	}



}
