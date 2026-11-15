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
package org.allbinary.logic.system.loader;

import org.allbinary.logic.NullUtil;

class WebappClassLoaderInfo {
    private static var classLoader : Any = NullUtil.getInstance().NULL_OBJECT;
    public function new() {
    }

    // synchronized
    public static function setLoader(classLoader : ClassLoader) : Void {
        WebappClassLoaderInfo.classLoader = classLoader;
    }

    // synchronized
    public static function getLoader() : ClassLoader {
        return (cast WebappClassLoaderInfo.classLoader : ClassLoader);
    }

}

