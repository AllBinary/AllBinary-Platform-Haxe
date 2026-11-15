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
package org.allbinary.util;

import jsinterop.annotations.JsType;
import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonPhoneStrings;
import jsinterop.annotations.JsMethod;
import jsinterop.annotations.JsProperty;

class BasicArrayListUtil {
    private static final instance : BasicArrayListUtil = new BasicArrayListUtil();
    public static function getInstance() : BasicArrayListUtil {
        return BasicArrayListUtil.instance;
    }

    public final NULL_ARRAY_OF_ARRAY : haxe.ds.Vector<haxe.ds.Vector<BasicArrayList>> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...0) null])]);
    private final myRandomFactory : MyRandomFactory = MyRandomFactory.getInstance();
    private final immutableInstance : BasicArrayList = new ImmutableBasicArrayList("Immutable", 0);
    public function getRandom(list : BasicArrayList) : Any {
        var i_random : Int = this.getRandomIndex(list);
        return list.objectArray[i_random];
    }

    public function getRandomIndex(list : BasicArrayList) : Int {
        return this.myRandomFactory.getAbsoluteNextInt(list.size());
    }

    public function reverse(list : BasicArrayList) : Void {
        final lastMinusOneIndex : Int = list.size() - 2;
        var temp : Any = null;
        final size : Int = Std.int(lastMinusOneIndex / 2);
        var secondSwapIndex : Int = 0;
        for (index in 0...size + 1) {
            secondSwapIndex = lastMinusOneIndex - index;
            temp = list.removeAt(index);
            list.addAt(index, list.removeAt(secondSwapIndex));
            list.addAt(secondSwapIndex + 1, temp);
        }
    }

    public function log(list : BasicArrayList) : String {
        final S_LABEL : String = " s: ";
        final size : Int = list.size();
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(CommonLabels.getInstance().TOTAL_LABEL);
        stringBuffer.appendint(size);
        {
            var index : Int = size - 1;
            while (index >= 0) {
            var usedList : BasicArrayList = (cast list.objectArray[index] : BasicArrayList);
            stringBuffer.append(S_LABEL);
            stringBuffer.appendint(usedList.size());
                index--;
            }
        }
        return stringBuffer.toString();
    }

    public function getImmutableInstance() : BasicArrayList {
        return this.immutableInstance;
    }

    public static function main(args : haxe.ds.Vector<String>) : Void {
        final commonPhoneStrings : CommonPhoneStrings = CommonPhoneStrings.getInstance();
        final list : BasicArrayList = new BasicArrayListD();
        list.add(commonPhoneStrings.ONE);
        list.add(commonPhoneStrings.TWO);
        list.add(commonPhoneStrings.THREE);
        list.add(commonPhoneStrings.FOUR);
        list.add(commonPhoneStrings.FIVE);
        list.add(commonPhoneStrings.SIX);
        list.add(commonPhoneStrings.SEVEN);
        list.add(commonPhoneStrings.EIGHT);
        list.add(commonPhoneStrings.NINE);
        BasicArrayListUtil.getInstance().reverse(list);
        trace(list.toString());
    }

    public function new() {
    }
}

