function onCreate()
  if not lowQuality then
		makeLuaSprite('sky','philly3/sky', -100, 00);
		setLuaSpriteScrollFactor('sky', 0.1, 0.1);
  end 
		makeLuaSprite('city','philly3/city', -10, 0);
		setLuaSpriteScrollFactor('city', 0.3, 0.3);
		scaleObject('city', 0.85, 0.85);
		
		makeLuaSprite('city2','philly3/city2', -10, 0);
		setLuaSpriteScrollFactor('city2', 0.3, 0.3);
		scaleObject('city2', 0.85, 0.85);
	
		makeLuaSprite('behindTrain','philly3/behindTrain', -40, 50);
		makeLuaSprite('street','philly3/street', -40, 50);
 if not lowQuality then
		makeLuaSprite('train','philly3/train',  2000, 360);
  end 
		makeLuaSprite('blue', 'philly3/win0',-10, 0);
        setLuaSpriteScrollFactor('blue', 0.3, 0.3);		
	    scaleObject('blue',0.85, 0.85)
		
		makeLuaSprite('green', 'philly3/win1',-10, 0);
        setLuaSpriteScrollFactor('green', 0.3, 0.3);		
	    scaleObject('green',0.85, 0.85)
		makeLuaSprite('pink', 'philly3/win2',-10, 0);
        setLuaSpriteScrollFactor('pink', 0.3, 0.3);		
	    scaleObject('pink',0.85, 0.85)
		
		makeLuaSprite('red', 'philly3/win3',-10, 0);
        setLuaSpriteScrollFactor('red', 0.3, 0.3);		
	    scaleObject('red',0.85, 0.85)
	    
		makeLuaSprite('yellow', 'philly3/win4',-10, 0);
        setLuaSpriteScrollFactor('yellow', 0.3, 0.3);		
	    scaleObject('yellow',0.85, 0.85)
	
	
	makeAnimatedLuaSprite('bops', 'philly3/phillyBoppers', -70, 500)
	setLuaSpriteScrollFactor('bops', 0.8, 0.8)
	scaleObject('bops', 0.95, 0.95)
	addAnimationByPrefix('bops', 'bop', 'philly bop0', 40, false) 
	
	makeAnimatedLuaSprite('bops2', 'philly3/meatballBop', 150, 280)
	addAnimationByPrefix('bops2', 'bop', 'meatbop0', 40, false) 
	
	makeAnimatedLuaSprite('bops3', 'philly3/pogaPumpBop', 1100, 280)
	addAnimationByPrefix('bops3', 'bop', 'poga idle0', 40, false) 
	
	makeLuaSprite('overlay', 'philly3/overlay', 0, 0)
      setObjectCamera('overlay', 'other')
      addLuaSprite('overlay', false)
	
	addLuaSprite('sky', false);
	addLuaSprite('city', false);
	addLuaSprite('city2', false);
	addLuaSprite('behindTrain', false);
	addLuaSprite('street', false);
	addLuaSprite('bops', false) 
	addLuaSprite('bops2', false)
	addLuaSprite('bops3', false) 
	
end


function onBeatHit() 
    objectPlayAnimation('bops', 'bop', false)
    objectPlayAnimation('bops2', 'bop', false) 
    objectPlayAnimation('bops3', 'bop', false) 
end 
	
