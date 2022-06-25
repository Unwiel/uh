local rain = {'thunder_1', 'thunder_2'}
function onCreate()
	-- background 
-- sprites that only load if Low Quality is turned off
  if not lowQuality then 
	makeAnimatedLuaSprite('dark','halloween_bgD2_dark', -200, -100);
    addAnimationByPrefix('dark', 'q', 'halloweem bg0', 24, false) 
    addAnimationByPrefix('dark', '2q', 'halloweem bg lightning strike0', 24, false) 
	makeAnimatedLuaSprite('ci', 'halloween_bgD2', -200, -100);
	addAnimationByPrefix('ci', 'q', 'halloweem bg0', 24, false) 
    addAnimationByPrefix('ci', '2q', 'halloweem bg lightning strike0', 24, false) 
    
    elseif lowQuality then
       makeLuaSprite('dark', 'halloween_bgD2_low_dark', -200, -100)
       makeLuaSprite('ci', 'halloween_bgD2_low', -200, -100)
   end
	
	makeLuaSprite('su', 'overlay', -150, -100);
	setObjectCamera('su', 'other');
	scaleObject('su', 1.2, 1.2);

	addLuaSprite('dark', false);
	addLuaSprite('ci', false);
	addLuaSprite('su', false);
    setProperty('ci.visible', false)
    setProperty('su.visible', false)
	
	
	
	
	
end

function onBeatHit()
   if curBeat % 20 == 0 and not lowQuality then
       objectPlayAnimation('dark', '2q', false) 
       objectPlayAnimation('ci', '2q', false) 
       triggerEvent('Add Camera Zoom', '', '') 
       playSound(rain[getRandomInt(1, #rain)], 1) 
    end 
       
end 