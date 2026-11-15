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


class FileData {
    private static final instance : FileData = new FileData();
    public static function getInstance() : FileData {
        return FileData.instance;
    }

    public function new() {
    }

    public final NAME : String = "FILE_NAME";
    public final ISFILE : String = "FILE_ISFILE";
    public final ISDIRECTORY : String = "FILE_ISDIRECTORY";
    public final ISHIDDEN : String = "FILE_ISHIDDEN";
    public final ISABSOLUTE : String = "FILE_ISABSOLUTE";
    public final ROOT_NAME : String = "FILE_ROOT_NAME";
    public final PATH : String = "FILE_PATH";
    public final ABSOLUTE_PATH : String = "FILE_ABSOLUTE_PATH";
    public final CANONICAL_PATH : String = "FILE_CANONICAL_PATH";
    public final PARENT : String = "FILE_PARENT";
    public final MINLEN : Int = 1;
    public final MAXLEN : Int = 120;
    public final MAXIMAGEFILESIZE : Int = 1048576;
    public final MINIMAGEFILESIZE : Int = 32;
    public final MAXDOWNLOADABLEFILESIZE : Int = 1048576 * 20;
    public final MINDOWNLOADABLEFILESIZE : Int = 1;
}

