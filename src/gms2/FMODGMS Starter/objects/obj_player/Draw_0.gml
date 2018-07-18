draw_set_font(fnt_default);
draw_set_color(c_white);

draw_text(16,16,"FMODGMS Starter Project");

//Play state
if (!is_playing)
    draw_text(16,96,"State: Stopped");
else
{
    if (is_paused)
        draw_text(16,96,"State: Paused");
    else
        draw_text(16,96,"State: Playing");            
} 

draw_text(16,304,"Space -- Play/Stop\nP -- Pause/Unpause");

draw_text(16,432,"FMODGMS version: 0.9.1");
draw_text(16,448,"FMOD version: Studio 1.10.07");