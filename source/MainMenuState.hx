package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.5.1'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		'credits',
		'options', 
		#if ACHIEVEMENTS_ALLOWED 'awards' #end 
	];

	var magenta:FlxSprite;
	var cosa1:FlxSprite;
	var cosa2:FlxSprite;
	var skid:FlxSprite;
	var bf:FlxSprite;
	var gfbf:FlxSprite;
        var honton:FlxSprite;
	var awards:FlxSprite;
	var credits:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;

	override function create()
	{
		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		FlxG.cameras.reset(camGame);
		FlxG.cameras.add(camAchievement);
		FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.setGraphicSize(Std.int(magenta.width * 1.175));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = ClientPrefs.globalAntialiasing;
		magenta.color = 0xFFfd719b;
		add(magenta);
		// magenta.scrollFactor.set();
		
		cosa1 = new FlxSprite().loadGraphic(Paths.image('menuLines'));
		cosa1.antialiasing = ClientPrefs.globalAntialiasing;
		add(cosa1);
		
		cosa2 = new FlxSprite().loadGraphic(Paths.image('menuSupportBG'));
		cosa2.antialiasing = ClientPrefs.globalAntialiasing;
		add(cosa2);
		
		skid = new FlxSprite(100, -50).loadGraphic(Paths.image('menuicons/story'));
	    skid.frames = Paths.getSparrowAtlas('menuicons/story');
	    skid.animation.addByPrefix('idleB', 'idle0', 24, true);
	    skid.animation.play('idleB');
		skid.setGraphicSize(Std.int(skid.width * 0.8));
		skid.antialiasing = ClientPrefs.globalAntialiasing;
		skid.visible = false;
		add(skid);
		
		gfbf = new FlxSprite(-50, -80).loadGraphic(Paths.image('menuicons/freeplay'));
	    gfbf.frames = Paths.getSparrowAtlas('menuicons/freeplay');
	    gfbf.animation.addByPrefix('idleB', 'idle0', 24, true);
	    gfbf.animation.play('idleB');
		gfbf.setGraphicSize(Std.int(gfbf.width * 0.8));
		gfbf.antialiasing = ClientPrefs.globalAntialiasing;
		gfbf.visible = false;
		add(gfbf);
		
		bf = new FlxSprite(50, -50).loadGraphic(Paths.image('menuicons/options'));
	    bf.frames = Paths.getSparrowAtlas('menuicons/options');
	    bf.animation.addByPrefix('idleB', 'idle0', 24, true);
	    bf.animation.play('idleB');
		bf.setGraphicSize(Std.int(bf.width * 0.8));
		bf.antialiasing = ClientPrefs.globalAntialiasing;
		bf.visible = false;
		add(bf);
		
		awards = new FlxSprite(50, -50).loadGraphic(Paths.image('menuicons/awards'));
		awards.setGraphicSize(Std.int(awards.width * 0.8));
		awards.antialiasing = ClientPrefs.globalAntialiasing;
		awards.visible = false;
		add(awards);
		
		credits = new FlxSprite(50, -50).loadGraphic(Paths.image('menuicons/credits'));
		credits.setGraphicSize(Std.int(credits.width * 0.8));
		credits.antialiasing = ClientPrefs.globalAntialiasing;
		credits.visible = false;
		add(credits);

                honton = new FlxSprite(500, 300).loadGraphic(Paths.image('menuicons/donate'));
	    honton.frames = Paths.getSparrowAtlas('menuicons/donate');
	    honton.animation.addByPrefix('no', 'DONATE0', 24, false);
            honton.animation.addByPrefix('selected', 'DONATE SELECT0', 24, false); 
	    honton.animation.play('no');
		honton.setGraphicSize(Std.int(skid.width * 0.8));
		honton.antialiasing = ClientPrefs.globalAntialiasing;
		add(honton); 

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, (i * 140)  + offset);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.screenCenter(X);
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			menuItem.setGraphicSize(Std.int(menuItem.width * 0.8));
			menuItem.updateHitbox();
		}

                var bsid:FlxText = new FlxText(12, FlxG.height - 64, 0, "BSIDES CORRUPTION DEMO v1.3.0", 12);
		bsid.scrollFactor.set();
		bsid.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(bsid);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine v" + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

                #if android
		addVirtualPad(UP_DOWN, A_B);
		#end

		super.create();
	}

	#if ACHIEVEMENTS_ALLOWED
	// Unlocks "Freaky on a Friday Night" achievement
	function giveAchievement() {
		add(new AchievementObject('friday_night_play', camAchievement));
		FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
		trace('Giving achievement "friday_night_play"');
	}
	#end

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

                if (FlxG.mouse.overlaps(honton))
		{
                        honton.animation.play('selected');
			if(FlxG.mouse.justPressed)
			{
                          FlxG.sound.play(Paths.sound('confirmMenu'));

	                  CoolUtil.browserLoad('https://youtube.com/c/Honton129');
                          
                        } 

                } 
                else
                {
                  honton.animation.play('no'); 
                } 
		
		

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		
		if (optionShit[curSelected] == 'story_mode') 
		{
		
		
		    skid.visible = true;
		} 
		else
		{
		    skid.visible = false;
		} 
		
		if (optionShit[curSelected] == 'freeplay') 
		{
		    
		
		    gfbf.visible = true;
		} 
		else
		{
		    gfbf.visible = false;
		} 
		
		if (optionShit[curSelected] == 'options') 
		{
		    
		
		    bf.visible = true;
		} 
		else
		{
		    bf.visible = false;
		} 
		
		if (optionShit[curSelected] == 'credits') 
		{
		    
		
		    credits.visible = true;
		} 
		else
		{
		    credits.visible = false;
		} 
		
		if (optionShit[curSelected] == 'awards') 
		{
		    

		    awards.visible = true;
		} 
		else
		{
		    awards.visible = false;
		} 
		

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					if(ClientPrefs.flashing) FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});

                                                        FlxTween.tween(cosa1, {x: cosa1.x + 50}, 0.8, {
                                                                ease: FlxEase.quadOut,
                                                                onComplete: function(twn2:FlxTween)
								{
									FlxTween.tween(cosa1, {x: cosa1.x + 900}, 0.4, {ease: FlxEase.quadInOut});
		

								}
							});

                                                        FlxTween.tween(cosa2, {x: cosa2.x - 50}, 0.8, {
                                                                ease: FlxEase.quadOut,
                                                                onComplete: function(twn3:FlxTween)
								{
									FlxTween.tween(cosa2, {x: cosa2.x - 900}, 0.4, {ease: FlxEase.quadInOut});
		

								}
							});


                                                        FlxTween.tween(skid, {x: skid.x - 50}, 0.8, {
                                                                ease: FlxEase.quadOut,
                                                                onComplete: function(twn3:FlxTween)
								{
									FlxTween.tween(skid, {x: skid.x - 900}, 0.4, {ease: FlxEase.quadInOut});
		

								}
							});

                                                        
                                                        FlxTween.tween(gfbf, {x: gfbf.x - 50}, 0.8, {
                                                                ease: FlxEase.quadOut,
                                                                onComplete: function(twn4:FlxTween)
								{
									FlxTween.tween(gfbf, {x: gfbf.x - 900}, 0.4, {ease: FlxEase.quadInOut});
		

								}
							}); 

                                  
                                                        FlxTween.tween(bf, {x: bf.x - 50}, 0.8, {
                                                                ease: FlxEase.quadOut,
                                                                onComplete: function(twn5:FlxTween)
								{
									FlxTween.tween(bf, {x: bf.x - 900}, 0.4, {ease: FlxEase.quadInOut});
		

								}
							});

                                                        
                                                        FlxTween.tween(credits, {x: credits.x - 50}, 0.8, {
                                                                ease: FlxEase.quadOut,
                                                                onComplete: function(twn6:FlxTween)
								{
									FlxTween.tween(credits, {x: credits.x - 900}, 0.4, {ease: FlxEase.quadInOut});
		

								}
							});

                                                        
                                                        FlxTween.tween(awards, {x: awards.x - 50}, 0.8, {
                                                                ease: FlxEase.quadOut,
                                                                onComplete: function(twn7:FlxTween)
								{
									FlxTween.tween(awards, {x: awards.x - 900}, 0.4, {ease: FlxEase.quadInOut});
		

								}
							});

                                                }                                                     			
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new FreeplayState());
									#if MODS_ALLOWED
									case 'mods':
										MusicBeatState.switchState(new ModsMenuState());
									#end
									case 'awards':
										MusicBeatState.switchState(new AchievementsMenuState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										MusicBeatState.switchState(new options.OptionsState());
								}
							});
						}
					});
				}
			}
			else if (FlxG.keys.anyJustPressed(debugKeys)#if android || _virtualpad.buttonE.justPressed #end)
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.screenCenter(X);
                        spr.x += 250;
		});
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				
				spr.centerOffsets();
			}
		});
	}
}
