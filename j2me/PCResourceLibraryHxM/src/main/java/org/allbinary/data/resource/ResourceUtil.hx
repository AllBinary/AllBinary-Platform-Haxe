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
package org.allbinary.data.resource;

import jre.io.ByteArrayInputStream;
import jre.io.ByteArrayOutputStream;
import jre.io.FileInputStream;
import jre.io.InputStream;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

//J2SE - PC
class ResourceUtil {
    private static final instance : ResourceUtil = new ResourceUtil();
    public static function getInstance() : ResourceUtil {
        return ResourceUtil.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    private var path : String = StringUtil.getInstance().EMPTY_STRING;
    private var ext : String = StringUtil.getInstance().EMPTY_STRING;
    public function new() {
    }

    public function setLoadingPaths(path : String, ext : String) : Void {
        this.path = path;
        this.ext = ext;
    }

    public function setClassLoader(classLoader : ClassLoader) : Void {
    }

    // throws Exception
    public function getResourceAsStream(resource : String) : InputStream {
        var inputStream : InputStream = this.getResourceAsStreamAtStart(resource, 2);
        if (inputStream == null) {
            inputStream = this.getResourceAsStreamAtStart(resource, 1);
            if (inputStream == null) {
                throw new jre.lang.JavaException(Std.string(new StringMaker().append("Unable to obtain: ").append(resource)));
            }
        }
        return inputStream;
    }

    // throws Exception
    private function getResourceAsStreamAtStart(resource : String, startIndex : Int) : InputStream {
        var inputStream : InputStream = new FileInputStream(Std.string(new StringMaker().append(this.path).append(resource).append(this.ext)));
        if (inputStream != null) {
            final byteArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...inputStream.available()) 0]);
            StreamUtil.getInstance().getByteArray(inputStream, new ByteArrayOutputStream(), byteArray);
            return new ByteArrayInputStream(byteArray);
        }
        return inputStream;
    }

    public function addResource(resource : String, value : Null<Int>) : Void {
    }

}

