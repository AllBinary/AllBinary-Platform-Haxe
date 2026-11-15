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
package org.allbinary.logic.system.security.crypt;

import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.tokens.Tokenizer;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class DatabaseEncoder {
    public function new() {
    }

    public static function encode(value : haxe.ds.Vector<Int>) : String {
        try {
            var array : haxe.ds.Vector<Int> = value;
            final stringBuffer : StringMaker = new StringMaker();
            for (index in 0...array.length) {
                stringBuffer.append(array[index].toString());
                if (index < array.length - 1) {
                    stringBuffer.append(CommonSeps.getInstance().SPACE);
                }
            }
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.putOE(commonStrings.EXCEPTION, "DatabaseEncoder", "decode", e);
            return StringUtil.getInstance().EMPTY_STRING;
        }
    }

    public static function decode(value : String) : haxe.ds.Vector<Int> {
        try {
            final tokenizer : Tokenizer = new Tokenizer(CommonSeps.getInstance().SPACE);
            final vector : BasicArrayList = tokenizer.getTokensFromString(value, new BasicArrayListD());
            final byteVector : BasicArrayList = new BasicArrayListD();
            final size : Int = vector.size();
            var byteOfData : String = null;
            for (index in 0...size) {
                byteOfData = (cast vector.objectArray[index] : String);
                byteVector.add(byteOfData);
            }
            final decode : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...byteVector.size()) 0]);
            var decodeIndex : Int = 0;
            var aByte : Null<Int> = null;
            for (index in 0...size) {
                aByte = (cast byteVector.objectArray[index] : Null<Int>);
                decode[decodeIndex] = Std.int(aByte);
                decodeIndex++;
            }
            return decode;
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.putSE(commonStrings.EXCEPTION, "DatabaseEncoder", "decode", e);
            return NullUtil.getInstance().NULL_BYTE_ARRAY;
        }
    }

}

