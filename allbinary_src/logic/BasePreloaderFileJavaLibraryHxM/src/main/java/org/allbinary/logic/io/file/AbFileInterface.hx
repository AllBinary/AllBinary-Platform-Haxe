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

import jre.io.FilenameFilter;
import jre.io.IOException;
import jre.net.URI;

interface AbFileInterface {
    function canRead() : Bool;

    function canWrite() : Bool;

    // throws IOException
    function createNewFile() : Bool;

    // throws IOException
    function delete() : Bool;

    function deleteOnExit() : Void;

    function exists() : Bool;

    function getAbsolutePath() : String;

    // throws IOException
    function getCanonicalPath() : String;

    function getParent() : String;

    function getPath() : String;

    function isAbsolute() : Bool;

    function isDirectory() : Bool;

    function isFile() : Bool;

    function isHidden() : Bool;

    function lastModified() : haxe.Int64;

    function length() : haxe.Int64;

    function list() : haxe.ds.Vector<String>;

    function listWithFilter(filter : FilenameFilter) : haxe.ds.Vector<String>;

    function mkdir() : Bool;

    function mkdirs() : Bool;

    function setLastModified(time : haxe.Int64) : Bool;

    function setReadOnly() : Bool;

    function toString() : String;

    function toURI() : URI;

}

