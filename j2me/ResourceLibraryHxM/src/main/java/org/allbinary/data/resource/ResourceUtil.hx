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

import jre.io.InputStream;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

//J2SE - J2ME
class ResourceUtil {
    private static var classLoader : Any = NullUtil.getInstance().NULL_OBJECT;
    private static final instance : ResourceUtil = new ResourceUtil();
    public static function getInstance() : ResourceUtil {
        return ResourceUtil.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
    }

    public function setLoadingPaths(path : String, ext : String) : Void {
        this.logUtil.putF(CommonStrings.getInstance().NOT_IMPLEMENTED, this, "setLoadingPaths");
    }

    public function setClassLoader(classLoader : ClassLoader) : Void {
        this.logUtil.putF(Std.string(new StringMaker().append("Resource Loader: ").append(Type.getClassName(Type.getClass(classLoader)))), this, "setClassLoader");
        ResourceUtil.classLoader = classLoader;
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
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final index : Int = resource.indexOf(commonSeps.COLON);
        final resourcePath : String = resource.substring(index + startIndex);
        var inputStream : InputStream = Type.getClass(resource).getResourceAsStream(resourcePath);
        if (inputStream != null) {
            return inputStream;
        }
        final classLoader : ClassLoader = (cast ResourceUtil.classLoader : ClassLoader);
        inputStream = classLoader.getResourceAsStream(resourcePath);
        if (inputStream != null) {
            return inputStream;
        }
        inputStream = Thread.currentThread().getContextClassLoader().getResourceAsStream(resourcePath);
        if (inputStream != null) {
            return inputStream;
        }
        return inputStream;
    }

    public function addResource(resource : String, value : Null<Int>) : Void {
    }

}

