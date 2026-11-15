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

//import java.security.Security;
//import java.security.spec.KeySpec;
//import javax.crypto.Cipher;
//import javax.crypto.SecretKey;
//import javax.crypto.SecretKeyFactory;
import org.allbinary.TsUtil;
import org.allbinary.init.crypt.jcehelper.CryptInterface;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.string.CommonStrings;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

class AbCrypt implements CryptInterface {
    private final tsUtil : TsUtil = TsUtil.getInstance();
    private var secretComposite : BaseSecretComposite = BaseSecretComposite.NULL_SECRET_COMPOSITE;
    private var algorithm : String;
    public function new(algorithm : String) {
        this.algorithm = algorithm;
    }

    public function init(keyAsString : String) : Void {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        try {
            try {
                Security.addProvider(new BouncyCastleProvider());
            } catch (e : haxe.Exception) {
                PreLogUtil.putOE(commonStrings.EXCEPTION, this, commonStrings.INIT, e);
            }
            final key : haxe.ds.Vector<Int> = this.tsUtil.getByteArray(keyAsString);
            final keySpec : KeySpec = KeySpecFactory.getInstance().getInstance(this.algorithm, key);
            final keyFactory : SecretKeyFactory = SecretKeyFactory.getInstance(this.algorithm);
            final secretKey : SecretKey = keyFactory.generateSecret(keySpec);
            final cipher : Cipher = Cipher.getInstance(this.algorithm);
            this.secretComposite = new SecretComposite(secretKey, cipher, key);
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE("init Failed", this, commonStrings.INIT, e);
        }
    }

    public function encrypt(array : haxe.ds.Vector<Int>) : haxe.ds.Vector<Int> {
        try {
            return this.secretComposite.encrypt(array);
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE("Encrypt Failed", this, "encrypt", e);
            return NullUtil.getInstance().NULL_BYTE_ARRAY;
        }
    }

    public function decrypt(array : haxe.ds.Vector<Int>) : haxe.ds.Vector<Int> {
        try {
            return this.secretComposite.decrypt(array);
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE("decrypt Failed", this, "decrypt", e);
            return NullUtil.getInstance().NULL_BYTE_ARRAY;
        }
    }

}

