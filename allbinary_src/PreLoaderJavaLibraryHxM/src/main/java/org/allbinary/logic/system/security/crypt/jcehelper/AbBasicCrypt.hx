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

import jre.security.Provider;
import jre.security.Security;
//import java.security.spec.KeySpec;
//import javax.crypto.Cipher;
//import javax.crypto.SecretKey;
//import javax.crypto.SecretKeyFactory;
import org.allbinary.init.crypt.jcehelper.CryptInterface;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.string.CommonStrings;

class AbBasicCrypt implements CryptInterface {
    private var cipher : Cipher = null;
    private var secretKey : SecretKey = null;
    private var algorithm : String = null;
    private var key : haxe.ds.Vector<Int> = null;
    public function new(algorithm : String, key : String) {
        try {
            this.algorithm = algorithm;
            this.key = key.getBytes();
            this.init();
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.putOE(commonStrings.EXCEPTION, this, "AbCrypt(alg,key)", e);
        }
    }

    private function init() : Void {
        try {
            var sunJce : Provider = new com.sun.crypto.provider.SunJCE();
            Security.addProvider(sunJce);
            var keySpec : KeySpec = KeySpecFactory.getInstance().getInstanceFor(this.algorithm, this.key);
            var keyFactory : SecretKeyFactory = SecretKeyFactory.getInstance(this.algorithm);
            this.secretKey = keyFactory.generateSecret(keySpec);
            this.cipher = Cipher.getInstance(this.algorithm);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            PreLogUtil.putOE("init Failed", this, commonStrings.INIT, e);
        }
    }

    public function encrypt(array : haxe.ds.Vector<Int>) : haxe.ds.Vector<Int> {
        try {
            this.cipher.init(Cipher.ENCRYPT_MODE, secretKey);
            var ivArray : haxe.ds.Vector<Int> = this.secretKey.getEncoded();
            var encrypted : haxe.ds.Vector<Int> = this.cipher.doFinal(array);
            var result : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...ivArray.length + encrypted.length) 0]);
            PreLogUtil.put("ivArray Length: " + ivArray.length, this, "encrypt");
            for (index in 0...ivArray.length) {
                result[index] = ivArray[index];
            }
            for (index in 0...encrypted.length) {
                result[index + ivArray.length] = encrypted[index];
            }
            return result;
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE("Encrypt Failed", this, "encrypt", e);
            return null;
        }
    }

    public function decrypt(array : haxe.ds.Vector<Int>) : haxe.ds.Vector<Int> {
        try {
            this.cipher.init(Cipher.DECRYPT_MODE, secretKey);
            var ivArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...8) 0]);
            for (index in 0...8) {
                ivArray[index] = array[index];
            }
            PreLogUtil.put("ivArray Length: " + ivArray.length, this, "encrypt");
            var result : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...array.length - ivArray.length) 0]);
            for (index in ivArray.length...array.length) {
                result[index - ivArray.length] = array[index];
            }
            var decrypted : haxe.ds.Vector<Int> = this.cipher.doFinal(result);
            return result;
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE("decrypt Failed", this, "decrypt", e);
            return null;
        }
    }

}

