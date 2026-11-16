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
package org.allbinary.game.input;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class GameInputProcessorComposite extends PlayerGameInput {
    private final name : String;
    private final gameInputProcessorInterface : GameInputProcessorInterface;
    public function new(name : String, gameInputProcessorInterface : GameInputProcessorInterface) {
        super(new BasicArrayListD(), new BasicArrayListD(), -1);
        this.name = name;
        this.gameInputProcessorInterface = gameInputProcessorInterface;
    }

    // synchronized
    public override function update() : Void {
        try {
            var list : BasicArrayList = this.getGameKeyEventList();
            this.gameInputProcessorInterface.onInput(list);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.UPDATE, e);
        }
    }

    private final NAME_LABEL : String = " GameInputProcessorInterface: ";
    public function toString() : String {
        return Std.string(new StringMaker().append(jre.lang.JavaObject.objectToString(this)).append(this.NAME_LABEL).append(this.name));
    }

}

