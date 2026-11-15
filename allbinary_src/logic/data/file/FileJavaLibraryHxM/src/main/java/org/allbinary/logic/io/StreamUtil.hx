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
package org.allbinary.logic.io;

//import java.io.ByteArrayOutputStream;
//import java.io.Closeable;
//import java.io.InputStream;
//import java.io.OutputStream;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class StreamUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : StreamUtil = new StreamUtil();
    public static function getInstance() : StreamUtil {
        return StreamUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function get(inputStream : InputStream, outputStream : OutputStream, buffer : haxe.ds.Vector<Int>) : OutputStream {
        var len : Int = 0;
        while (true) {
            len = inputStream.read(buffer, 0, buffer.length);
            if (len != -1) {
            } else {
                break;
            }
            outputStream.write(buffer, 0, len);
        }
        return outputStream;
    }

    // throws Exception
    public function getByteArray(inputStream : InputStream, outputStream2 : ByteArrayOutputStream, byteArray : haxe.ds.Vector<Int>) : haxe.ds.Vector<Int> {
        final outputStream : ByteArrayOutputStream = outputStream2;
        try {
            this.get(inputStream, outputStream, byteArray);
            return outputStream.toByteArray();
        } catch (e : haxe.Exception) {
            throw e;
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            this.close(outputStream);
        }
    }

    public function close(closeable : Closeable) : Bool {
        try {
            if (closeable != null) {
                closeable.close();
            }
            return true;
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CLOSE, e);
            return false;
        }
    }

}

