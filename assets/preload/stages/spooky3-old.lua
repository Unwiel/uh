local rain = {'thunder_1', 'thunder_2'}
function onCreate()
	-- background 
-- sprites that only load if Low Quality is turned off
  if not lowQuality then 
	makeAnimatedLuaSprite('ci', 'halloween_bg_old', -200, -100);
	addAnimationByPrefix('ci', 'q', 'halloweem bg0', 24, false) 
    addAnimationByPrefix('ci', '2q', 'halloweem bg lightning strike0', 24, false) 
    
    elseif lowQuality then
       makeLuaSprite('ci', 'halloween_bg_old_low', -200, -100)
   end
	

	addLuaSprite('ci', false);
	
	
	
	
	
	
end

function onBeatHit()
   if curBeat % 20 == 0 and not lowQuality then
       objectPlayAnimation('dark', '2q', false) 
       objectPlayAnimation('ci', '2q', false) 
       triggerEvent('Add Camera Zoom', '', '') 
       playSound(rain[getRandomInt(1, #rain)], 1) 
    end 
       
end 