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
import org.allbinary.logic.string.StringUtil;

class UnitGameResources extends BasicGameResources {
    public var NAME : String = StringUtil.getInstance().EMPTY_STRING;
    public var RESOURCE_ICON_ANIMATION : String = StringUtil.getInstance().EMPTY_STRING;
    public var RESOURCE_ICON_BUILD : String = StringUtil.getInstance().EMPTY_STRING;
    public var RESOURCE_ICON : String = StringUtil.getInstance().EMPTY_STRING;
    public function new() {
        super();
    }

    private static final ICON : String = "_icon";
    private static final BUILD : String = "_build";
    private static final DESTROY : String = "_destroy";
    private static final ICON_BUILD : String = "_icon" + UnitGameResources.BUILD;
    private final ICON_SIZE : String = "_64_by_64.png";
    // throws Exception
    public override function append(ROOT : String, sizeString : String) : Void {
        super.append(ROOT, sizeString);
        var string : String = GameGraphicsResourceUtil.getInstance().getName();
        BasicGameResources.stringBuffer.delete(0, BasicGameResources.stringBuffer.length());
        BasicGameResources.stringBuffer.append(ROOT);
        BasicGameResources.stringBuffer.append(UnitGameResources.DESTROY);
        BasicGameResources.stringBuffer.append(string);
        BasicGameResources.stringBuffer.append(sizeString);
        this.RESOURCE_DESTROY = BasicGameResources.stringBuffer.toString();
        BasicGameResources.stringBuffer.delete(0, BasicGameResources.stringBuffer.length());
        BasicGameResources.stringBuffer.append(UnitGameResources.ICON);
        BasicGameResources.stringBuffer.append(ROOT);
        this.RESOURCE_ICON_ANIMATION = BasicGameResources.stringBuffer.toString();
        BasicGameResources.stringBuffer.delete(0, BasicGameResources.stringBuffer.length());
        BasicGameResources.stringBuffer.append(ROOT);
        BasicGameResources.stringBuffer.append(UnitGameResources.ICON);
        BasicGameResources.stringBuffer.append(string);
        BasicGameResources.stringBuffer.append(this.ICON_SIZE);
        this.RESOURCE_ICON = BasicGameResources.stringBuffer.toString();
        BasicGameResources.stringBuffer.delete(0, BasicGameResources.stringBuffer.length());
        BasicGameResources.stringBuffer.append(ROOT);
        BasicGameResources.stringBuffer.append(UnitGameResources.ICON_BUILD);
        BasicGameResources.stringBuffer.append(string);
        BasicGameResources.stringBuffer.append(this.ICON_SIZE);
        this.RESOURCE_ICON_BUILD = BasicGameResources.stringBuffer.toString();
    }

    // throws Exception
    public override function getString() : String {
        if (AndroidUtil.isAndroid()) {
            return GameGraphicsResourceUtil.getInstance().getStringForFeature(GraphicsFeatureFactory.getInstance().SPRITE_QUARTER_ROTATION_GRAPHICS);
        } else {
            return super.getString();
        }
    }

}

