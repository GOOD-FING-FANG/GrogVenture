///exit_state
if (image_alpha > 0) {
    image_alpha -= .25;
} else {
    if (room != room_last) {
        room_goto_next();
    } else {
        //Calculate score
        score = PlayerStats.sapphires * (250 - PlayerStats.time/room_speed);
        
        //Open highscores
        ini_open("Settings.ini");
        PlayerStats.highscore = ini_read_real("Score","Highscore",0);
        
        //Input new highscore
        if(score > PlayerStats.highscore) {
            PlayerStats.highscore = score;
            ini_write_real("Score","Highscore",PlayerStats.highscore);
        }
        
        //Close the ini
        ini_close();
        
        room_goto(rm_highscore);
    }
}
