function onCreate()
      makeLuaSprite('overlay2', 'philly3/overlay2', 0, 0)
      setObjectCamera('overlay2', 'other')
      addLuaSprite('overlay2', false)
      makeLuaSprite('white', 'bg', 0, 0)
      scaleObject('white', 5, 5)
      setObjectCamera('white', 'other')
      addLuaSprite('white', false)
      setProperty('overlay2.visible', false) 
      setProperty('city2.visible', false) 
      setProperty('sky.visible', false) 
      setProperty('city.visible', false) 
      setProperty('behindTrain.visible', false) 
      setProperty('street.visible', false) 
      setProperty('train.visible', false) 
      setProperty('bops.visible', false)
      setProperty('bops2.visible', false)  
      setProperty('bops3.visible', false) 
      setProperty('camHUD.alpha', 0) 
      setProperty('gf.alpha', 0) 
      setProperty('dad.alpha', 0) 
      setProperty('boyfriend.alpha', 0) 
      setProperty('white.alpha', 0) 
      setPropertyFromClass('androidc', 'visible', false)
      setObjectOrder('bops', getObjectOrder('boyfriend') + 15)
end

function onStepHit()
    if curStep == 32 then 
        setProperty('boyfriend.alpha', 1) 
        setProperty('scoreTxt.visible', false) 
        setProperty('botplayTxt.visible', false) 
    end 
    
    if curStep == 64 then 
       setProperty('gf.alpha', 1)  
     end 
     
     if curStep == 96 then 
         setProperty('dad.alpha', 1)
      end 
      
      if curStep == 108 then
          doTweenAlpha('uh', 'white', 1, 1.52, 'linear') 
      end 
      
      if curStep == 128 then 
           doTweenAlpha('uh', 'white', 0, 1.52, 'linear')  
           setProperty('sky.visible', true) 
      setProperty('city.visible', true) 
      setProperty('behindTrain.visible', true) 
      setProperty('street.visible', true) 
      setProperty('train.visible', true) 
      setProperty('bops.visible', true)
      setProperty('bops2.visible', true)  
      setProperty('bops3.visible', true) 
      setProperty('camHUD.alpha', 1) 
      end 
      
      
      if curStep == 384 then 
          doTweenAlpha('uc', 'bops', 0, 1, 'linear')
      end 
      
      if curStep == 512 then 
          doTweenAlpha('uc', 'bops', 1, 1, 'linear')
      end 
      
      if curStep == 1024 then 
          doTweenAlpha('uc', 'bops', 0, 1, 'linear')
      end 
      
          if curStep == 1152 then 
          doTweenAlpha('uc', 'bops', 1, 1, 'linear')
      end 
      
      if curStep == 400 then 
          setProperty('city2.visible', true) 
       end 
       
       if curStep == 1536 then 
       setProperty('camHUD.alpha', 0) 
       setProperty('overlay2.visible', true) 
       end 
       
       if curStep == 1767 then 
            doTweenAlpha('o', 'camGame', 0, 1, 'linear') 
        end 
        
        if curStep == 1792 then 
            doTweenAlpha('o', 'camGame', 1, 1, 'linear') 
        end 
        
        if curStep == 1799 then 
            doTweenAlpha('o', 'camGame', 0, 1, 'linear') 
        end 
        
end