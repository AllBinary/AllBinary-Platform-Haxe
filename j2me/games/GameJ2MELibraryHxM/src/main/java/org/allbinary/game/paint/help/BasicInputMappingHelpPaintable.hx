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
package org.allbinary.game.paint.help;

import org.allbinary.game.input.GameKey;
import org.allbinary.game.input.GameKeyFactory;
import org.allbinary.game.input.Input;
import org.allbinary.game.input.PlatformInputMappingFactory;
import org.allbinary.game.input.mapping.GameInputMapping;
import org.allbinary.game.input.mapping.PersistentInputMapping;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;

class BasicInputMappingHelpPaintable extends HelpPaintable {
    private var gameInputMappingArray : haxe.ds.Vector<GameInputMapping>;
    private final NONE : GameKey = GameKeyFactory.getInstance().NONE;
    public function new(gameInputMappingArray : haxe.ds.Vector<GameInputMapping>, basicColor : BasicColor) {
        super("Help Screen", BasicColorFactory.getInstance().BLACK, basicColor);
        this.gameInputMappingArray = gameInputMappingArray;
        this.update(this.NONE, this.NONE);
    }

    public function update(selectedGameKey : GameKey, selectedInput : Input) : Void {
        final gameKeyMapping : PersistentInputMapping = PlatformInputMappingFactory.getInstance().getPersistentInputMappingInstance();
        final EQUAL : String = " = ";
        final stringMaker : StringMaker = new StringMaker();
        final size : Int = this.gameInputMappingArray.length;
        final keyInfo : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy([for (index in 0...size) null]);
        var gameInputMapping : GameInputMapping = null;
        var gameKey : GameKey = null;
        var list : BasicArrayList = null;
        for (index in 0...size) {
            gameInputMapping = this.gameInputMappingArray[index];
            gameKey = gameInputMapping.getGameKey();
            list = gameKeyMapping.getInputMapping().getMappedInput(gameKey);
            stringMaker.delete(0, stringMaker.length());
            keyInfo[index] = Std.string(stringMaker.append(gameInputMapping.getName()).append(EQUAL).append(this.get(list)));
        }
        super.setInputInfoP(keyInfo);
    }

    private function get(keyList : BasicArrayList) : String {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        final AND : String = "and ";
        var key : Input = null;
        final size : Int = keyList.size();
        for (index in 0...size) {
            key = (cast keyList.objectArray[index] : Input);
            stringBuffer.append(key.getName());
            if (index + 1 < keyList.size()) {
                if (keyList.size() == 2) {
                    stringBuffer.append(commonSeps.SPACE).append(AND);
                } else {
                    if (index + 2 == keyList.size()) {
                        stringBuffer.append(commonSeps.COMMA_SEP);
                        stringBuffer.append(AND);
                    } else {
                        stringBuffer.append(commonSeps.COMMA_SEP);
                    }
                }
            }
        }
        return Std.string(stringBuffer);
    }

}

