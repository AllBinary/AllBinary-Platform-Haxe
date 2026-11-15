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
package org.allbinary.logic.io.file.directory;

import jre.io.FileFilter;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileFactory;
import org.allbinary.logic.io.file.FileWrapperUtil;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class Directory {
    private static final instance : Directory = new Directory();
    public static function getInstance() : Directory {
        return Directory.instance;
    }

    public function new() {
    }

    public function create(...args : Dynamic) : Dynamic {
        if (args.length == 1 && Std.isOfType(args[0], AbPath)) {
            return this.create_AbPath(args[0]);
        }
        if (args.length == 1) {
            return this.create_String(args[0]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: create");
    }

    public function create_AbPath(directoryAbPath : AbPath) : Bool {
        return this.create(directoryAbPath.toFileSystemString());
    }

    public function remove(...args : Dynamic) : Dynamic {
        if (args.length == 1 && Std.isOfType(args[0], AbPath)) {
            this.remove_AbPath(args[0]);
            return null;
        }
        if (args.length == 1) {
            this.remove_String(args[0]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: remove");
    }

    // throws Exception
    public function remove_AbPath(existingDirectoryAbPath : AbPath) : Void {
        this.remove(existingDirectoryAbPath.toFileSystemString());
    }

    private function create_String(directory : String) : Bool {
        try {
            final directoryFile : AbFile = FileFactory.getInstance().getInstance(directory);
            if (!directoryFile.isDirectory()) {
                PreLogUtil.put("Creating Directories: " + directory, this, "create");
                if (!directoryFile.mkdirs()) {
                    return false;
                }
            }
            return true;
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE("Error Creating Directories: " + directory, this, "create", e);
            return false;
        }
    }

    // throws Exception
    private function remove_String(existingDirectory : String) : Void {
        final existingDirectoryFile : AbFile = FileFactory.getInstance().getInstance(existingDirectory);
        if (existingDirectoryFile.isDirectory()) {
            if (existingDirectoryFile.list().length > 0) {
                throw new jre.lang.JavaException("Did not remove category: " + existingDirectory + " because files exist");
            } else if (existingDirectoryFile.delete()) {
                PreLogUtil.put("Successfully Removed: " + existingDirectory, "Directory", "remove");
            }
        } else {
            throw new jre.lang.JavaException("Category Directory Is Missing:" + existingDirectory);
        }
    }

    public function search(...args : Dynamic) : Dynamic {
        if (args.length == 2 && Std.isOfType(args[0], FileFilter) && Std.isOfType(args[0], AbFile)) {
            return this.search_FileFilter_AbFile(args[0], args[1]);
        }
        if (args.length == 3 && Std.isOfType(args[0], FileFilter) && Std.isOfType(args[0], AbFile) && Std.isOfType(args[0], Bool)) {
            return this.search_FileFilter_AbFile_boolean(args[0], args[1], args[2]);
        }
        if (args.length == 1) {
            return this.search_AbFile(args[0]);
        }
        if (args.length == 2 && Std.isOfType(args[0], AbFile) && Std.isOfType(args[0], Bool)) {
            return this.search_AbFile_boolean(args[0], args[1]);
        }
        if (args.length == 2 && Std.isOfType(args[0], String) && Std.isOfType(args[0], AbFile)) {
            return this.search_String_AbFile(args[0], args[1]);
        }
        if (args.length == 3 && Std.isOfType(args[0], String) && Std.isOfType(args[0], AbFile) && Std.isOfType(args[0], Bool)) {
            return this.search_String_AbFile_boolean(args[0], args[1], args[2]);
        }
        if (args.length == 2) {
            return this.search_int_AbFile(args[0], args[1]);
        }
        if (args.length == 3) {
            return this.search_int_AbFile_boolean(args[0], args[1], args[2]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: search");
    }

    public function search_FileFilter_AbFile(fileFilter : FileFilter, file : AbFile) : BasicArrayList {
        return this.search(fileFilter, file, false);
    }

    public function search_FileFilter_AbFile_boolean(fileFilter : FileFilter, file : AbFile, isRecursiveSearch : Bool) : BasicArrayList {
        final fileList : BasicArrayList = new BasicArrayListD();
        var recursiveFileList : BasicArrayList = null;
        if (file.isDirectory()) {
            final fileArray : haxe.ds.Vector<Any> = file.listFilesFileFilter(fileFilter);
            if (fileArray == null) {
                return fileList;
            }
            final files : haxe.ds.Vector<AbFile> = FileWrapperUtil.wrapFiles(fileArray);
            if (files == null) {
                return fileList;
            }
            final size : Int = files.length;
            for (index in 0...size) {
                fileList.add(files[index]);
                if (isRecursiveSearch) {
                    recursiveFileList = this.search(fileFilter, files[index], isRecursiveSearch);
                    fileList.addAllList(recursiveFileList);
                }
            }
        }
        return fileList;
    }

    public function search_AbFile(file : AbFile) : BasicArrayList {
        return this.search(file, false);
    }

    public function search_AbFile_boolean(file : AbFile, isRecursiveSearch : Bool) : BasicArrayList {
        final fileList : BasicArrayList = new BasicArrayListD();
        var recursiveFileList : BasicArrayList = null;
        if (file.isDirectory()) {
            final fileArray : haxe.ds.Vector<Any> = file.listFiles();
            if (fileArray == null) {
                return fileList;
            }
            final files : haxe.ds.Vector<AbFile> = FileWrapperUtil.wrapFiles(fileArray);
            if (files == null) {
                return fileList;
            }
            for (index in 0...files.length) {
                fileList.add(files[index]);
                if (isRecursiveSearch) {
                    recursiveFileList = this.search(files[index], isRecursiveSearch);
                    fileList.addAllList(recursiveFileList);
                }
            }
        }
        return fileList;
    }

    public function search_String_AbFile(searchValue : String, file : AbFile) : BasicArrayList {
        return this.search(searchValue, file, false);
    }

    public function search_String_AbFile_boolean(searchValue : String, file : AbFile, isRecursiveSearch : Bool) : BasicArrayList {
        final fileList : BasicArrayList = new BasicArrayListD();
        var recursiveFileList : BasicArrayList = null;
        if (file.isDirectory()) {
            final fileArray : haxe.ds.Vector<Any> = file.listFiles();
            if (fileArray == null) {
                return fileList;
            }
            final files : haxe.ds.Vector<AbFile> = FileWrapperUtil.wrapFiles(fileArray);
            if (files == null) {
                return fileList;
            }
            for (index in 0...files.length) {
                if (files[index].getPath().indexOf(searchValue) >= 0) {
                    fileList.add(files[index]);
                }
                if (isRecursiveSearch) {
                    recursiveFileList = this.search(searchValue, files[index], isRecursiveSearch);
                    fileList.addAllList(recursiveFileList);
                }
            }
        }
        return fileList;
    }

    public function search_int_AbFile(level : Int, file : AbFile) : BasicArrayList {
        return this.search(level, file, false);
    }

    public function search_int_AbFile_boolean(level : Int, file : AbFile, isRecursiveSearch : Bool) : BasicArrayList {
        final fileList : BasicArrayList = new BasicArrayListD();
        var recursiveFileList : BasicArrayList = null;
        if (file.isDirectory()) {
            final fileArray : haxe.ds.Vector<Any> = file.listFiles();
            if (fileArray == null) {
                return fileList;
            }
            final files : haxe.ds.Vector<AbFile> = FileWrapperUtil.wrapFiles(fileArray);
            if (files == null) {
                return fileList;
            }
            for (index in 0...files.length) {
                fileList.add(files[index]);
                if (level <= 0) {
                    return fileList;
                }
                recursiveFileList = this.search(level - 1, files[index], isRecursiveSearch);
                fileList.addAllList(recursiveFileList);
            }
        }
        return fileList;
    }

}

