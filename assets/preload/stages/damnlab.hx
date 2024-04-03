import Std;
import objects.HealthIcon;
import flixel.math.FlxMath;

var bg;
var dark;
var light;
var bulb;
var stageCurtains;
var flickerTween;
var flickerTween2;

var jake:Character;
var jakeIcon;
var pibbyIcon;

function onCreate()
{	
	bg = new FlxSprite(900, 525);
	bg.loadGraphic(Paths.image('lab/bg'));
	bg.antialiasing = ClientPrefs.globalAntialiasing;
	bg.setGraphicSize(Std.int(bg.width * 1.3));
	bg.updateHitbox();
	bg.active = false;

	// add to the final array
	game.addBehindGF(bg);

	dark = new FlxSprite(900, 405);
	dark.loadGraphic(Paths.image('lab/dark'));
	dark.setGraphicSize(Std.int(dark.width * 1.3));
	dark.updateHitbox();
	dark.antialiasing = ClientPrefs.globalAntialiasing;
	dark.active = false;
	dark.origin.set(800, 0);

	// add to the final array
	game.add(dark);

	light = new FlxSprite(900, 405);
	light.loadGraphic(Paths.image('lab/light'));
	light.setGraphicSize(Std.int(light.width * 1.3));
	light.alpha = 0.8;
	light.updateHitbox();
	light.antialiasing = ClientPrefs.globalAntialiasing;
	light.active = false;
	light.origin.set(800, 0);
	flickerTween = FlxTween.tween(light, {alpha: 0}, 0.25, {ease: FlxEase.bounceInOut, type: 4});
	flickerTween.active = true;

	// add to the final array
	game.add(light);

	bulb = new FlxSprite(0, 0);
	bulb.loadGraphic(Paths.image('lab/bulb'));
	bulb.setGraphicSize(Std.int(bulb.width * 1.3));
	bulb.updateHitbox();
	bulb.antialiasing = ClientPrefs.globalAntialiasing;
	bulb.active = false;
	bulb.origin.set(800, 0);
	flickerTween2 = FlxTween.tween(light, {alpha: 0}, 0.25, {ease: FlxEase.bounceInOut, type: 4});
	flickerTween2.active = true;

	// add to the final array
	game.add(dark);
	game.add(bulb);


	jake = new Character(0, 0, 'jake');
	game.addBehindDad(jake);
	setVar('jake',jake);
	jake.dance();

	
	jakeIcon = new HealthIcon('jake', false);
	jakeIcon.camera = game.camHUD;
	game.add();

	pibbyIcon = new HealthIcon('pibby', true);
	pibbyIcon.camera = game.camHUD;
	game.add();

	jakeIcon.x = 180;
	pibbyIcon.x = 950;

	return;
}

function onCreatePost(){
	if (PlayState.SONG.song == 'Suffering Siblings')
		{
			game.camGame.zoom = 0.7;
		}
		return;
}

function onUpdatePost(elapsed){
	light.angle = Math.sin((Conductor.songPosition / 1000) * (Conductor.bpm / 60) * 1.0) * 5;
	dark.angle = light.angle;
	bulb.angle = light.angle;

	jakeIcon.y = pibbyIcon.y = game.iconP2.y;

	if (game.startedCountdown && game.generatedMusic)
	{
		if (!jake.stunned && jake.holdTimer > Conductor.stepCrochet * 0.0011 * jake.singDuration && StringTools.startsWith(jake.animation.curAnim.name, 'sing') && !StringTools.endsWith(jake.animation.curAnim.name, 'miss'))
		{
			jake.dance();
		}
	}

	var mult:Float = FlxMath.lerp(1, jakeIcon.scale.x, FlxMath.bound(1 - (elapsed * 9 * game.playbackRate), 0, 1));
	jakeIcon.scale.set(mult, mult);
	jakeIcon.updateHitbox();

	var mult:Float = FlxMath.lerp(1, pibbyIcon.scale.x, FlxMath.bound(1 - (elapsed * 9 * game.playbackRate), 0, 1));
	pibbyIcon.scale.set(mult, mult);
	pibbyIcon.updateHitbox();

	jakeIcon.animation.curAnim.curFrame = (game.healthBar.percent > 80) ? 1 : 0;
	pibbyIcon.animation.curAnim.curFrame = (game.healthBar.percent < 20) ? 1 : 0;
	return;
	
}

createGlobalCallback('playJakeAnim',function(dir:Int){
	jake.playAnim(game.singAnimations[dir], true);
	jake.holdTimer = 0;
});


function onBeatHit(){
	jakeIcon.scale.set(1.2, 1.2);
	pibbyIcon.scale.set(1.2, 1.2);
	return;
}

function onSongStart()
{
	if (PlayState.SONG.song == 'Mindless')
		{
			bg.visible = false;
			dark.visible = false;
			light.visible = false;
			bulb.visible = false;
		}

	return;
}

function onMoveCamera(focus)
{
	if (game.camZooming){
		if (focus == 'dad') {
			if (game.dad.curCharacter != 'jake')
			game.defaultCamZoom = 0.9;
			else
			game.defaultCamZoom = 1.2;
		}
		else
			game.defaultCamZoom = 1.1;
	}
	return;
}

function onStepHit()
{
	if (curStep == 296)
	{
		if (PlayState.SONG.song == 'Mindless')
			{
				bg.visible = true;
				dark.visible = true;
				light.visible = true;
				bulb.visible = true;
			}
	}
	if (PlayState.SONG.song == 'Suffering Siblings'){
		switch(curStep){
			case 2080:
				jake.alpha = 0.1;
			case 2336:
				game.gf.alpha = 1;
				jake.alpha = 1;

		}
	}

	return;
}

function onEvent(event, value1, value2)
{
	if (event == 'Apple Filter')
	{
			if (value1 == 'on') 
		{
			bg.visible = false;
			dark.visible = false;
			light.visible = false;
			bulb.visible = false;
		}
			else if (value1 == 'off')
		{
			bg.visible = true;
			dark.visible = true;
			light.visible = true;
			bulb.visible = true;
		}
	}
	return;
}
