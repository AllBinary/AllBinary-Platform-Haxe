/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
 *  
 * By agreeing to this license you and any business entity you represent are 
 * legally bound to the AllBinary Open License Version 1 legal agreement. 
 *  
 * You may obtain the AllBinary Open License Version 1 legal agreement from 
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
 *  
 * Created By: Travis Berthelot 
 *   
 */
// Generated Code Do Not Modify
package org.allbinary.game.layer;

//import javax.microedition.lcdui.Image;
//import javax.microedition.lcdui.game.Sprite;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogUtil;

class SpriteFactory implements SpriteFactoryInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : SpriteFactory = new SpriteFactory();
    public static function getInstance() : SpriteFactory {
        return SpriteFactory.instance;
    }

    public function createSprite(image : Image, frameWidth : Int, frameHeight : Int) : Sprite {
        return new Sprite(image, frameWidth, frameHeight);
    }

    public function new() {
    }
}

