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
package org.allbinary.game.ag.ai;

import org.allbinary.ai.ArtificialIntelligenceInterface;
import org.allbinary.game.input.GameInput;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.ABHashtable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class NumberOnOwnGroupSequenceAIFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    // throws Exception
    public function getInstance(hashtable : ABHashtable<Any, Any>, artificialIntelligenceInterface : haxe.ds.Vector<ArtificialIntelligenceInterface>, ownerLayerInterface : AllBinaryLayer, gameInput : GameInput) : ArtificialIntelligenceInterface {
        final integerArray : haxe.ds.Vector<Null<Int>> = NumberInSameGroupSequence.getInstance().NUMBER_ON_SAME_TEAM_SEQUENCE;
        final list : BasicArrayList = new BasicArrayListD();
        for (index in 0...integerArray.length) {
            var integerCanBeNull : Any = hashtable.get((cast integerArray[index] : Any));
            if (integerCanBeNull == null) {
                break;
            }
            list.add(integerCanBeNull);
        }
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Total AI Properties: ");
        stringBuffer.appendint(list.size());
        stringBuffer.append(" == Total AI: ");
        stringBuffer.appendint(artificialIntelligenceInterface.length);
        stringBuffer.append(" + 1");
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        this.logUtil.putF(Std.string(stringBuffer), this, commonStrings.GET_INSTANCE);
        if (artificialIntelligenceInterface.length - 1 > list.size()) {
            throw new jre.lang.JavaException("Not enough AI properties.");
        }
        if (artificialIntelligenceInterface.length - 1 < list.size()) {
            throw new jre.lang.JavaException("Too Many AI properties.");
        }
        var numberOnSameTeam : haxe.ds.Vector<Null<Int>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...list.size()) null]);
        for (index in 0...numberOnSameTeam.length) {
            numberOnSameTeam[index] = (cast list.objectArray[index] : Null<Int>);
        }
        return new NumberOnOwnGroupSequenceAI(numberOnSameTeam, artificialIntelligenceInterface, ownerLayerInterface, gameInput);
    }

    public function new() {
    }
}

