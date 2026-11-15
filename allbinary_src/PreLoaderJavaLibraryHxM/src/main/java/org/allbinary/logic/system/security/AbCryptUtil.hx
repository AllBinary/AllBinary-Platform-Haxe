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
package org.allbinary.logic.system.security;

import jre.io.ByteArrayOutputStream;
import jre.io.InputStream;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.system.security.crypt.jcehelper.AbCrypt;
import org.allbinary.logic.system.security.crypt.jcehelper.KeySpecFactory;

class AbCryptUtil {
    private static final instance : AbCryptUtil = new AbCryptUtil();
    public static function getInstance() : AbCryptUtil {
        return AbCryptUtil.instance;
    }

    private final streamUtil : StreamUtil = StreamUtil.getInstance();
    public function new() {
    }

    // throws Exception
    public function decrypt(inputStream : InputStream, key : String) : haxe.ds.Vector<Int> {
        var outputStream : ByteArrayOutputStream = null;
        try {
            outputStream = (cast this.streamUtil.get(inputStream, new ByteArrayOutputStream(), haxe.ds.Vector.fromArrayCopy([for (index in 0...16384) 0])) : ByteArrayOutputStream);
            final abCrypt : AbCrypt = new AbCrypt(KeySpecFactory.getInstance().DESEDE);
            abCrypt.init(key);
            return abCrypt.decrypt(outputStream.toByteArray());
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            this.streamUtil.close(outputStream);
            this.streamUtil.close(inputStream);
        }
    }

}

