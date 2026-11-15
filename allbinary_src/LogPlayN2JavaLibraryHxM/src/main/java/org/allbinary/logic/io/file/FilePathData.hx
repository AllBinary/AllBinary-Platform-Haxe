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
package org.allbinary.logic.io.file;


class FilePathData {
    private static final instance : FilePathData = new FilePathData();
    public static function getInstance() : FilePathData {
        return FilePathData.instance;
    }

    public final SEPARATORCHAR : Int = "\\".code;
    public var PATH_START : String = "\\\\";
    public function new() {
    }

}

