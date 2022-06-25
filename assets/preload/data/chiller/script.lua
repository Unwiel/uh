function opponentNoteHit()
    health = getProperty('health')
    if getProperty('dad.curCharacter') == 'spooky3' and getProperty('health') > 0.2 then
        setProperty('health', health- 0.02);
    end
    
    
    if getProperty('dad.curCharacter') == 'spooky3-glow' and getProperty('health') > 0.2 then
        setProperty('health', health- 0.02);
    end
end
function onStepHit()
         if curStep == 128 then
               
               setProperty('ci.visible', true)
         end
          if curStep == 367 then
               
               setProperty('ci.visible', false)
         end
         if curStep == 383 then
               
               setProperty('ci.visible', true)
         end
         if curStep == 448 then
               
               setProperty('ci.visible', false)
         end
         if curStep == 640 then
               
               setProperty('ci.visible', true)
         end
         if curStep == 768 then
      
               setProperty('ci.visible', false)
         end
         if curStep == 896 then
               
               setProperty('ci.visible', true)
         end
         if curStep == 1024 then
               
               playSound('shoot', 1)
               setProperty('su.visible', true) 
         end
         if curStep == 448 then
       
               setProperty('ci.visible', false)
         end
         if curStep == 1280 then
             
               setProperty('ci.visible', false)
         end
end
              