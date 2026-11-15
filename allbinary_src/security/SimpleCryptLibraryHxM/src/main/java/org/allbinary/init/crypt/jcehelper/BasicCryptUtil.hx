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
package org.allbinary.init.crypt.jcehelper;

import jre.io.ByteArrayInputStream;
import jre.io.ByteArrayOutputStream;
import jre.io.InputStream;
import org.allbinary.TsUtil;
import org.allbinary.logic.communication.log.LogUtil;

class BasicCryptUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : BasicCryptUtil = new BasicCryptUtil();
    public static function getInstance() : BasicCryptUtil {
        return BasicCryptUtil.instance;
    }

    private final tsUtil : TsUtil = TsUtil.getInstance();
    private final XML_START : String = "<?xml";
    // throws Exception
    public function getDecryptedInputStream(inputStream : InputStream, cryptInterface : CryptInterface) : InputStream {
        var buffer : ByteArrayOutputStream = new ByteArrayOutputStream();
        var ch : Int = 0;
        while (true) {
            ch = inputStream.read();
            if (ch == -1) {
                break;
            }
            buffer.write(ch);
        }
        var decrypted : haxe.ds.Vector<Int> = cryptInterface.decrypt(buffer.toByteArray());
        var decryptedString : String = haxe.io.Bytes.ofData(decrypted).toString();
        var index : Int = decryptedString.indexOf(this.XML_START);
        if (index > 0) {
            decryptedString = decryptedString.substring(index);
        }
        return new ByteArrayInputStream(this.tsUtil.getByteArray(decryptedString));
    }

    public function new() {
    }
}

