/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2026 AllBinary 
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
package org.allbinary.logic.io.file.directory;


class TrackedStrings {
    private static final instance : TrackedStrings = new TrackedStrings();
    public static function getInstance() : TrackedStrings {
        return TrackedStrings.instance;
    }

    public final TARGET_PATH_WINDOWS : String = "\\target\\";
    public final TARGET_PATH_UNIX : String = "/target/";
    public final HTML_TEMP : String = "HTMLTemp";
    public final APPLICATION : String = "Application";
    public final APP : String = "\\app";
    public final GIT_COMMAND : String = "git";
    public final CHANGE_DIRECTORY_OPTION : String = "-C";
    public final LIST_FILES_COMMAND : String = "ls-files";
    public final ERROR_UNMATCH_OPTION : String = "--error-unmatch";
    public final PATHSPEC_SEPARATOR : String = "--";
    public final SEP_BY_NULL_CHAR_INSTEAD_OF_NEW_LINE : String = "-z";
    public function new() {
    }
}

