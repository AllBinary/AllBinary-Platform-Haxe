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

//import java.security.spec.KeySpec;
//import javax.crypto.spec.DESKeySpec;
//import javax.crypto.spec.DESedeKeySpec;
import org.allbinary.TsUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.string.CommonStrings;

class KeySpecFactory {
    private static final instance : KeySpecFactory = new KeySpecFactory();
    public static function getInstance() : KeySpecFactory {
        return KeySpecFactory.instance;
    }

    public final DES : String = "DES";
    public final DESEDE : String = "DESede";
    public final BLOWFISH : String = "Blowfish";
    public function new() {
    }

    public function getInstance(algorithm : String, keyData : haxe.ds.Vector<Int>) : KeySpec {
        try {
            final tsUtil : TsUtil = TsUtil.getInstance();
            if (tsUtil.compareTo(algorithm, this.DES) == 0) {
                return new DESKeySpec(keyData);
            } else if (tsUtil.compareTo(algorithm, this.DESEDE) == 0) {
                return new DESedeKeySpec(keyData);
            } else {
                throw new jre.lang.JavaException();
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.putOE(commonStrings.EXCEPTION, this, commonStrings.GET_INSTANCE, e);
            throw new jre.lang.JavaException();
        }
    }

}

