/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2006 AllBinary 
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
package org.allbinary.game.layer.unit;

import org.allbinary.game.layer.resources.BasicGameResources;
import org.allbinary.game.layer.resources.GameGraphicsResourceUtil;
import org.allbinary.AndroidUtil;
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory;

class Unit2DecalGameResources extends BasicGameResources {
    private static final instance : Unit2DecalGameResources = new Unit2DecalGameResources();
    public function new() {
        super();
        final ROOT : String = "/unit_decal";
        final SMALL : String = "_30_by_30.png";
        final MEDIUM : String = SMALL;
        final SIZE_FOUR : String = SMALL;
        final SIZE_FIVE : String = SMALL;
        final SIZE_SIX : String = SMALL;
        final SIZE : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([SMALL, MEDIUM, SIZE_FOUR, SIZE_FIVE, SIZE_SIX]);
        super.init(ROOT, SIZE);
    }

    // throws Exception
    public override function append(ROOT : String, sizeString : String) : Void {
        super.append(ROOT, sizeString);
    }

    // throws Exception
    public override function getString() : String {
        if (AndroidUtil.isAndroid()) {
            return GameGraphicsResourceUtil.getInstance().getStringForFeature(GraphicsFeatureFactory.getInstance().SPRITE_QUARTER_ROTATION_GRAPHICS);
        } else {
            return super.getString();
        }
    }

    public static function getInstance() : BasicGameResources {
        return Unit2DecalGameResources.instance;
    }

}

