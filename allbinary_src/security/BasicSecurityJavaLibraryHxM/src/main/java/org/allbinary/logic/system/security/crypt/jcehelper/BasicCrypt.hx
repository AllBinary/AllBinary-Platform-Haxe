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
package org.allbinary.logic.system.security.crypt.jcehelper;

import org.allbinary.TsUtil;
import org.allbinary.init.crypt.jcehelper.CryptInterface;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.java.byteutil.ByteUtil;
import org.allbinary.string.CommonStrings;

class BasicCrypt implements CryptInterface {
    private final byteUtil : ByteUtil = ByteUtil.getInstance();
    private final key : haxe.ds.Vector<Int>;
    public function new(keyAsString : String) {
        var key : haxe.ds.Vector<Int> = NullUtil.getInstance().NULL_BYTE_ARRAY;
        try {
            key = TsUtil.getInstance().getByteArray(keyAsString);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.putOE(commonStrings.EXCEPTION, this, "AbCrypt(alg,key)", e);
        }
        this.key = key;
    }

    public function encrypt(array : haxe.ds.Vector<Int>) : haxe.ds.Vector<Int> {
        try {
            return this.mutilate(array);
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE("Encrypt Failed", this, "encrypt", e);
            return NullUtil.getInstance().NULL_BYTE_ARRAY;
        }
    }

    public function decrypt(array : haxe.ds.Vector<Int>) : haxe.ds.Vector<Int> {
        try {
            return this.mutilate(array);
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE("decrypt Failed", this, "decrypt", e);
            return NullUtil.getInstance().NULL_BYTE_ARRAY;
        }
    }

    public function mutilate(array : haxe.ds.Vector<Int>) : haxe.ds.Vector<Int> {
        var value : Int = 0;
        for (index in 0...this.key.length) {
            value = this.key[index];
            array = this.byteUtil.xor(array, value);
        }
        return array;
    }

}

