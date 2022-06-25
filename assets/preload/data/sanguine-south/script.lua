function onStepHit()
         if curStep == 256 then
               setProperty('ci.visible', true)
         end
          if curStep == 768 then
               setProperty('ci.visible', false)
         end
         if curStep == 832 then
               setProperty('ci.visible', true)
               setProperty('su.visible', true)
         end
         if curStep == 1024 then
               setProperty('ci.visible', false)
         end
end
              