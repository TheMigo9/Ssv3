var defaultStrumX = [92,
    204,
    316,
    428,
    732,
    844,
    956,
    1068];

var defaultStrumY = (ClientPrefs.downScroll ? 90 : 570);


function onUpdate() {
    var currentAnimBF = game.boyfriend.animation.curAnim;
    if (!currentAnimBF.finished) game.boyfriend.holdTimer = 0;

    if (currentAnimBF.finished) {
        game.boyfriend.skipDance = false;
        game.boyfriend.playAnim("idle", true);
    }
    if (game.gf != null){
        if (game.gf.curCharacter == 'pibby'){
            var currentAnimGF = game.gf.animation.curAnim;
            if (!currentAnimGF.finished) game.gf.holdTimer = 0;
            if (currentAnimGF.finished) {
                game.gf.dance();
            }
        }
    } 

    return;
}


createGlobalCallback('startGlitch',function(){
    for (s in game.opponentStrums){
        s.setColorTransform(-1, -1, -1, 1, FlxG.random.int(-1,255), FlxG.random.int(-1,255), FlxG.random.int(-1,255), 0);
    }
    for (n in game.notes) if (!n.mustPress) n.setColorTransform(-1, -1, -1, 1, FlxG.random.int(-1,255), FlxG.random.int(-1,255), FlxG.random.int(-1,255), 0);
    game.dad.setColorTransform(-1, -1, -1, 1, FlxG.random.int(-1,255), FlxG.random.int(-1,255), FlxG.random.int(-1,255), 0);
    new FlxTimer().start(0.1, function(g:FlxTimer) {
        game.dad.setColorTransform(1, 1, 1, 1, 1, 1, 1, 0);
        for (s in game.opponentStrums) s.setColorTransform(1, 1, 1, 1, 1, 1, 1, 0);
        for (n in game.notes) if (!n.mustPress) n.setColorTransform(1, 1, 1, 1, 1, 1, 1, 0);
    });

    for (n in 0...8){
        game.strumLineNotes.members[n].x = defaultStrumX[n] + FlxG.random.float(-15,15);
        game.strumLineNotes.members[n].y = defaultStrumY + FlxG.random.float(-15,15);
    }
});

createGlobalCallback('startGlitchCharacter',function(chara:String){
    for (s in game.opponentStrums){
        s.setColorTransform(-1, -1, -1, 1, FlxG.random.int(-1,255), FlxG.random.int(-1,255), FlxG.random.int(-1,255), 0);
    }
    for (n in game.notes) if (!n.mustPress) n.setColorTransform(-1, -1, -1, 1, FlxG.random.int(-1,255), FlxG.random.int(-1,255), FlxG.random.int(-1,255), 0);
    getVar(chara).setColorTransform(-1, -1, -1, 1, FlxG.random.int(-1,255), FlxG.random.int(-1,255), FlxG.random.int(-1,255), 0);
    new FlxTimer().start(0.1, function(h:FlxTimer) {
        getVar(chara).setColorTransform(1, 1, 1, 1, 1, 1, 1, 0);
        for (s in game.opponentStrums) s.setColorTransform(1, 1, 1, 1, 1, 1, 1, 0);
        for (n in game.notes) if (!n.mustPress) n.setColorTransform(1, 1, 1, 1, 1, 1, 1, 0);
    });

    for (n in 0...8){
        game.strumLineNotes.members[n].x = defaultStrumX[n] + FlxG.random.float(-15,15);
        game.strumLineNotes.members[n].y = defaultStrumY + FlxG.random.float(-15,15);
    }
});

createGlobalCallback('staticOPStrums',function(dir:Int){
    game.opponentStrums.members[dir].playAnim('static', true);
});
