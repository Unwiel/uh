function onCreate()
      makeLuaSprite('overlay', 'philly2/overlay', 0, 0)
      setObjectCamera('overlay', 'other')
      addLuaSprite('overlay', false)
      setProperty('camGame.alpha', 0)
      setProperty('bops.visible', false) 
end

function onStepHit()
    if curStep == 64 then
        doTweenAlpha('q', 'camGame', 1, 1, 'linear')
    end
    
    if curStep == 192 then 
       setProperty('overlay.visible', false)
     end 
     
     if curStep == 831 then 
         playSound('shoot', 0.8);
         setProperty('overlay.visible', true)
     end 
     
     if curStep == 1216 then 
         setProperty('overlay.visible', false)
      end 
     
       if curStep == 1599 then 
          setProperty('overlay.visible', true) 
          playSound('Lights_Turn_On', 0.8);
          setProperty('bops.visible', true) 
        end 
        
        if curStep == 2240 then 
            setProperty('camGame.alpha', 0)
         end 
         
         if curStep == 2262 then
             doTweenAlpha('u', 'camHUD',0, 1, 'linear') 
         end 
         
         
end

function onUpdatePost() -- make sure the countdown numbers arent visible
    setProperty('countdownReady.visible', false)
    setProperty('countdownSet.visible', false)
    setProperty('countdownGo.visible', false)
    
end
