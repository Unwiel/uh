function onCreate()
      makeLuaSprite('overlay', 'philly/overlay', 0, 0)
      setObjectCamera('overlay', 'other')
      addLuaSprite('overlay', false)
      setProperty('overlay.visible', false)
end

function onStepHit()
    if curStep == 1672 then
        setProperty('overlay.visible', true)
    end
   
   if curStep == 1824 then
       doTweenAlpha('q', 'camGame', 0, 1, 'linear')
       doTweenAlpha('dq', 'camHUD', 0, 1, 'linear')
   end
end 