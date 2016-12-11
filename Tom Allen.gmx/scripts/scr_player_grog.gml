//Buff is available
if(bufftime == buffduration) {
    audio_play_sound(snd_tom_grunt, 5, false);
    portraitversion = 0;
    pJumpHeight += pJumpBuff;
    pSpd += pSpdBuff;
}

//Buff expires
else if(bufftime <= 0) {
    portraitversion = 1;
    bufftime = buffduration;
    pJumpHeight -= pJumpBuff;
    pSpd -= pSpdBuff;
    buffState = buffStates.normal;
}

//reset Buff
if(portraitversion == 0) {
    bufftime -= 1;
}
