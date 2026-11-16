/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
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
package org.allbinary.game.layer.resources;

import org.allbinary.game.configuration.GameConfigurationCentral;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class BasicGameResources {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public static final stringBuffer : StringMaker = new StringMaker();
    public var RESOURCE : String = StringUtil.getInstance().EMPTY_STRING;
    public var RESOURCE_DESTROY : String = StringUtil.getInstance().EMPTY_STRING;
    public function new() {
    }

    public function init(ROOT : String, SIZE : haxe.ds.Vector<String>) : Void {
        try {
            var scale : Int = jre.lang.JavaObject.intValue(GameConfigurationCentral.getInstance().SCALE.getValue());
            if (scale > 1 && scale - 1 < SIZE.length) {
                this.append(ROOT, SIZE[scale - 1]);
            } else {
                throw new jre.lang.JavaException(Std.string(new StringMaker().append("Invalid Value: ").appendint(scale)));
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.INIT, e);
        }
    }

    // throws Exception
    public function append(ROOT : String, sizeString : String) : Void {
        final DESTROY : String = "_destroy";
        final string : String = this.getString();
        BasicGameResources.stringBuffer.delete(0, BasicGameResources.stringBuffer.length());
        BasicGameResources.stringBuffer.append(ROOT);
        BasicGameResources.stringBuffer.append(string);
        BasicGameResources.stringBuffer.append(sizeString);
        this.RESOURCE = Std.string(BasicGameResources.stringBuffer);
        BasicGameResources.stringBuffer.delete(0, BasicGameResources.stringBuffer.length());
        BasicGameResources.stringBuffer.append(ROOT);
        BasicGameResources.stringBuffer.append(DESTROY);
        BasicGameResources.stringBuffer.append(string);
        BasicGameResources.stringBuffer.append(sizeString);
        this.RESOURCE_DESTROY = Std.string(BasicGameResources.stringBuffer);
    }

    // throws Exception
    public function getString() : String {
        return GameGraphicsResourceUtil.getInstance().getName();
    }

}

