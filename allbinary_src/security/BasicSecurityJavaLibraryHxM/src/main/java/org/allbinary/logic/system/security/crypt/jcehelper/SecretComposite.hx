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
package org.allbinary.logic.system.security.crypt.jcehelper;

//import javax.crypto.Cipher;
//import javax.crypto.SecretKey;
import org.allbinary.logic.java.byteutil.ByteUtil;

class SecretComposite extends BaseSecretComposite {
    private final byteUtil : ByteUtil = ByteUtil.getInstance();
    private final cipher : Cipher;
    private final secretKey : SecretKey;
    private var key : haxe.ds.Vector<Int>;
    public function new(secretKey : SecretKey, cipher : Cipher, key : haxe.ds.Vector<Int>) {
        super();
        this.secretKey = secretKey;
        this.cipher = cipher;
        this.key = key;
    }

    // throws Exception
    public override function encrypt(array : haxe.ds.Vector<Int>) : haxe.ds.Vector<Int> {
        array = this.mutilate(array);
        this.cipher.init(Cipher.ENCRYPT_MODE, this.secretKey);
        return this.cipher.doFinal(array);
    }

    // throws Exception
    public override function decrypt(array : haxe.ds.Vector<Int>) : haxe.ds.Vector<Int> {
        this.cipher.init(Cipher.DECRYPT_MODE, this.secretKey);
        return this.mutilate(this.cipher.doFinal(array));
    }

    private function mutilate(array : haxe.ds.Vector<Int>) : haxe.ds.Vector<Int> {
        for (index in 0...this.key.length) {
            var value : Int = this.key[index];
            if (value < 8 && value > 0) {
                array = this.byteUtil.xorByte(array, value);
            }
        }
        return array;
    }

}

