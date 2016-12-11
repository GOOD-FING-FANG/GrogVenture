//Buff is available
if(bufftime == buffduration) {
    audio_play_sound(snd_tom_grunt, 5, false);
    portraitversion = 0;
    pJumpHeight += (pJumpBuff*3);
    pSpd += (pSpdBuff*2);
    hp += pHPBuff;
    maxhp += pHPBuff;
}

//Buff expires
else if(bufftime <= 0) {
    portraitversion = 1;
    bufftime = buffduration;
    pJumpHeight -= (pJumpBuff*3);
    pSpd -= (pSpdBuff*2);
    hp -= pHPBuff;
    if(hp <= 0) hp = 1;
    maxhp -= pHPBuff;
    buffState = buffStates.normal;
}

//reset Buff
if(portraitversion == 0) {
    bufftime -= 1;
}
