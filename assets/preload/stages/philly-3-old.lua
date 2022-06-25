function onCreate()
  if not lowQuality then
		makeLuaSprite('sky','phillyOld/sky', -100, 00);
		setLuaSpriteScrollFactor('sky', 0.1, 0.1);
  end 
		makeLuaSprite('city','phillyOld/city', -10, 0);
		setLuaSpriteScrollFactor('city', 0.3, 0.3);
		scaleObject('city', 0.85, 0.85);
		
		makeLuaSprite('city2','phillyOld/city2', -10, 0);
		setLuaSpriteScrollFactor('city2', 0.3, 0.3);
		scaleObject('city2', 0.85, 0.85);
	
		makeLuaSprite('behindTrain','phillyOld/behindTrain', -40, 50);
		makeLuaSprite('street','phillyOld/street', -40, 50);
 if not lowQuality then
		makeLuaSprite('train','phillyOld/train',  2000, 360);
  end 
		makeLuaSprite('blue', 'phillyOld/win0',-10, 0);
        setLuaSpriteScrollFactor('blue', 0.3, 0.3);		
	    scaleObject('blue',0.85, 0.85)
		
		makeLuaSprite('green', 'phillyOld/win1',-10, 0);
        setLuaSpriteScrollFactor('green', 0.3, 0.3);		
	    scaleObject('green',0.85, 0.85)
		makeLuaSprite('pink', 'phillyOld/win2',-10, 0);
        setLuaSpriteScrollFactor('pink', 0.3, 0.3);		
	    scaleObject('pink',0.85, 0.85)
		
		makeLuaSprite('red', 'phillyOld/win3',-10, 0);
        setLuaSpriteScrollFactor('red', 0.3, 0.3);		
	    scaleObject('red',0.85, 0.85)
	    
		makeLuaSprite('yellow', 'phillyOld/win4',-10, 0);
        setLuaSpriteScrollFactor('yellow', 0.3, 0.3);		
	    scaleObject('yellow',0.85, 0.85)
	
	
	makeAnimatedLuaSprite('bops', 'phillyOld/phillyBop', -200, -200)
	setLuaSpriteScrollFactor('bops', 0.8, 0.8)
	scaleObject('bops', 0.95, 0.95)
	addAnimationByPrefix('bops', 'bop', 'phillyBoppers0', 40, false) 
	
	makeAnimatedLuaSprite('bops3', 'phillyOld/pumpBop', 700, -450)
	addAnimationByPrefix('bops3', 'bop', 'pumpBopping0', 40, false) 
	
	
	
	addLuaSprite('sky', false);
	addLuaSprite('city', false);
	addLuaSprite('city2', false);
	addLuaSprite('behindTrain', false);
	addLuaSprite('street', false);
	addLuaSprite('bops', true) 

	addLuaSprite('bops3', false) 
	
end


function onBeatHit() 
    objectPlayAnimation('bops', 'bop', false)
    objectPlayAnimation('bops2', 'bop', false) 
    objectPlayAnimation('bops3', 'bop', false) 
end 
	
