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
package org.allbinary.business.init;

import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.io.path.AbPath;

class InitInfo2 {
    private static final instance : InitInfo2 = new InitInfo2();
    public static function getInstance() : InitInfo2 {
        return InitInfo2.instance;
    }

    private final directory : Directory = Directory.getInstance();
    public function isTestHtmlPathValid(value : AbPath) : Bool {
        return this.directory.create(value);
    }

    public function isMainPathValid(value : AbPath) : Bool {
        return this.directory.create(value);
    }

    public function new() {
    }
}

