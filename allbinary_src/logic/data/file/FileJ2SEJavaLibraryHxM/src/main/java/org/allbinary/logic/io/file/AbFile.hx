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

import jre.io.File;
import jre.io.FileFilter;
import jre.io.FilenameFilter;
import jre.io.IOException;
import jre.net.URI;
import org.allbinary.TsUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringUtil;

class AbFile implements AbFileInterface {
    public static final NULL_FILE : AbFile = AbFile.createAbFileFromRawPath(StringUtil.getInstance().EMPTY_STRING);
    // throws Exception
    public static function createAbFileWithChild(file : AbFile, childPathName : String) : AbFile {
        return new AbFile(new File(file.getFile(), childPathName));
    }

    // throws Exception
    public static function createAbFile(filePath : String) : AbFile {
        return new AbFile(new File(new AbPath(filePath, StringUtil.getInstance().EMPTY_STRING).toFileSystemString()));
    }

    // throws Exception
    public static function createAbFilePathAndName(filePath : String, fileName : String) : AbFile {
        return new AbFile(new File(new AbPath(filePath, StringUtil.getInstance().EMPTY_STRING).toFileSystemString(), fileName));
    }

    public static function createAbFileFromAbPath(abPath : AbPath) : AbFile {
        return new AbFile(new File(abPath.toFileSystemString()));
    }

    public static function createAbFileFromRawPath(filePath : String) : AbFile {
        return new AbFile(new File(filePath));
    }

    private final file : File;
    public function new(file : File) {
        this.file = file;
    }

    public function getFile() : File {
        return this.file;
    }

    public function getName() : String {
        return this.file.getName();
    }

    public function getParent() : String {
        return this.file.getParent();
    }

    public function getParentFile() : Any {
        return this.file.getParentFile();
    }

    public function getPath() : String {
        return this.file.getPath();
    }

    public function isAbsolute() : Bool {
        return this.file.isAbsolute();
    }

    public function getAbsolutePath() : String {
        return this.file.getAbsolutePath();
    }

    public function getAbsoluteFile() : Any {
        return this.file.getAbsoluteFile();
    }

    // throws IOException
    public function getCanonicalPath() : String {
        return this.file.getCanonicalPath();
    }

    // throws IOException
    public function getCanonicalFile() : Any {
        return this.file.getCanonicalFile();
    }

    public function toURI() : URI {
        return this.file.toURI();
    }

    public function canRead() : Bool {
        return this.file.canRead();
    }

    public function canWrite() : Bool {
        return this.file.canWrite();
    }

    public function exists() : Bool {
        return this.file.exists();
    }

    public function isDirectory() : Bool {
        return this.file.isDirectory();
    }

    public function isFile() : Bool {
        return this.file.isFile();
    }

    public function isHidden() : Bool {
        return this.file.isHidden();
    }

    public function lastModified() : haxe.Int64 {
        return this.file.lastModified();
    }

    public function length() : haxe.Int64 {
        return jre.lang.JavaNumber.toInt64(this.file.length());
    }

    // throws IOException
    public function createNewFile() : Bool {
        return this.file.createNewFile();
    }

    // throws IOException
    public function delete() : Bool {
        return this.file.delete();
    }

    public function deleteOnExit() : Void {
        this.file.deleteOnExit();
    }

    public function list() : haxe.ds.Vector<String> {
        return this.file.list();
    }

    public function listWithFilter(filter : FilenameFilter) : haxe.ds.Vector<String> {
        return this.file.list(filter);
    }

    public function listFiles() : haxe.ds.Vector<Any> {
        return (cast this.file.listFiles() : haxe.ds.Vector<Any>);
    }

    public function listFilesFileNameFilter(filter : FilenameFilter) : haxe.ds.Vector<Any> {
        return (cast this.file.listFiles(filter) : haxe.ds.Vector<Any>);
    }

    public function listFilesFileFilter(filter : FileFilter) : haxe.ds.Vector<Any> {
        return (cast this.file.listFiles(filter) : haxe.ds.Vector<Any>);
    }

    public function mkdir() : Bool {
        return this.file.mkdir();
    }

    public function mkdirs() : Bool {
        return this.file.mkdirs();
    }

    public function renameTo(dest : AbFile) : Bool {
        return this.file.renameTo(dest.getFile());
    }

    public function setLastModified(time : haxe.Int64) : Bool {
        return this.file.setLastModified(time);
    }

    public function setReadOnly() : Bool {
        return this.file.setReadOnly();
    }

    public function setWritable(...args : Dynamic) : Dynamic {
        if (args.length == 2) {
            return this.setWritable_boolean_boolean(args[0], args[1]);
        }
        if (args.length == 1) {
            return this.setWritable_boolean(args[0]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: setWritable");
    }

    public function setWritable_boolean_boolean(writable : Bool, ownerOnly : Bool) : Bool {
        return this.file.setExecutable(writable, ownerOnly);
    }

    public function setWritable_boolean(writable : Bool) : Bool {
        return this.file.setWritable(writable);
    }

    public function setReadable(...args : Dynamic) : Dynamic {
        if (args.length == 2) {
            return this.setReadable_boolean_boolean(args[0], args[1]);
        }
        if (args.length == 1) {
            return this.setReadable_boolean(args[0]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: setReadable");
    }

    public function setReadable_boolean_boolean(readable : Bool, ownerOnly : Bool) : Bool {
        return this.file.setReadable(readable, ownerOnly);
    }

    public function setReadable_boolean(readable : Bool) : Bool {
        return this.file.setReadable(readable);
    }

    public function setExecutable(...args : Dynamic) : Dynamic {
        if (args.length == 2) {
            return this.setExecutable_boolean_boolean(args[0], args[1]);
        }
        if (args.length == 1) {
            return this.setExecutable_boolean(args[0]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: setExecutable");
    }

    public function setExecutable_boolean_boolean(executable : Bool, ownerOnly : Bool) : Bool {
        return this.file.setExecutable(executable, ownerOnly);
    }

    public function setExecutable_boolean(executable : Bool) : Bool {
        return this.file.setExecutable(executable);
    }

    public function canExecute() : Bool {
        return this.file.canExecute();
    }

    public function getTotalSpace() : haxe.Int64 {
        return this.file.getTotalSpace();
    }

    public function getFreeSpace() : haxe.Int64 {
        return this.file.getFreeSpace();
    }

    public function getUsableSpace() : haxe.Int64 {
        return this.file.getUsableSpace();
    }

    public function compareTo(pathname : File) : Int {
        return this.file.compareTo(pathname);
    }

    public function equals(obj : Any) : Bool {
        return TsUtil.getInstance().equalsNotstring(this.file, obj);
    }

    public function hashCode() : Int {
        return jre.lang.JavaObject.hashCode(this.file);
    }

    public function toString() : String {
        return Std.string(this.file);
    }

}

