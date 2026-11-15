/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2025 AllBinary 
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
package org.allbinary.game.ag.layer.hud.basic;

import org.allbinary.game.graphics.hud.BasicHudFactory;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class NumberStringHudFactory {
    private static var instance : Any = NullUtil.getInstance();
    public static function getInstance() : NumberStringHudFactory {
        if (NumberStringHudFactory.instance == NullUtil.getInstance()) {
            NumberStringHudFactory.instance = new NumberStringHudFactory();
        }
        return (cast NumberStringHudFactory.instance : NumberStringHudFactory);
    }

    public function createHud() : NumberStringHud {
        try {
            return new NumberStringHud(StringUtil.getInstance().EMPTY_STRING, 9, BasicHudFactory.getInstance().ABSOLUTE, 1, 0, BasicColorFactory.getInstance().NULL_COLOR);
        } catch (e : haxe.Exception) {
            final logUtil : LogUtil = LogUtil.getInstance();
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
            throw new jre.lang.JavaException();
        }
    }

    public final NULL_NUMBER_STRING_HUD : NumberStringHud;
    public function new() {
        this.NULL_NUMBER_STRING_HUD = this.createHud();
    }
}

