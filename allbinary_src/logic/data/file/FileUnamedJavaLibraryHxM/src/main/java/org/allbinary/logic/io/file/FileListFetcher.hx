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

import org.allbinary.logic.io.file.directory.DirectoryBooleanFileVisitor;
import org.allbinary.logic.io.file.directory.DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor;
import org.allbinary.logic.io.file.directory.DirectoryOrIncludeFileExtensionBooleanFileVisitor;
import org.allbinary.logic.io.file.directory.SubDirectory;
import org.allbinary.logic.io.file.filter.VisitorFileFilter;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class FileListFetcher {
    private static final instance : FileListFetcher = new FileListFetcher();
    public static function getInstance() : FileListFetcher {
        return FileListFetcher.instance;
    }

    private final subDirectory : SubDirectory = SubDirectory.getInstance();
    public function getFiles(...args : Dynamic) : Dynamic {
        if (args.length == 1) {
            return this.getFiles_String(args[0]);
        }
        if (args.length == 2 && Std.isOfType(args[0], String)) {
            return this.getFiles_String_StringArray(args[0], args[1]);
        }
        if (args.length == 2) {
            return this.getFiles_String_String(args[0], args[1]);
        }
        if (args.length == 3) {
            return this.getFiles_String_String_String(args[0], args[1], args[2]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: getFiles");
    }

    public function getFiles_String(path : String) : BasicArrayList {
        try {
            final files : BasicArrayList = this.subDirectory.search(AbFile.createAbFile(path));
            return files;
        } catch (e : haxe.Exception) {
            trace(e.details());
            trace("Error: " + e + "\nMsg: " + e.message);
        }
        return null;
    }

    public function getFiles_String_StringArray(path : String, includeExtensions : haxe.ds.Vector<String>) : BasicArrayList {
        try {
            final includeExtensionBasicArrayList : BasicArrayList = new BasicArrayListD();
            final size : Int = includeExtensions.length;
            for (index in 0...size) {
                includeExtensionBasicArrayList.add(includeExtensions[index]);
            }
            final visitorFileFilter : VisitorFileFilter = new VisitorFileFilter(new DirectoryOrIncludeFileExtensionBooleanFileVisitor(includeExtensionBasicArrayList));
            final files : BasicArrayList = this.subDirectory.search(visitorFileFilter, AbFile.createAbFile(path));
            return files;
        } catch (e : haxe.Exception) {
            trace(e.details());
            trace("Error: " + e + "\nMsg: " + e.message);
        }
        return null;
    }

    public function getFiles_String_String(path : String, includeExtension : String) : BasicArrayList {
        try {
            final includeExtensionBasicArrayList : BasicArrayList = new BasicArrayListD();
            includeExtensionBasicArrayList.add(includeExtension);
            final visitorFileFilter : VisitorFileFilter = new VisitorFileFilter(new DirectoryOrIncludeFileExtensionBooleanFileVisitor(includeExtensionBasicArrayList));
            final files : BasicArrayList = this.subDirectory.search(visitorFileFilter, AbFile.createAbFile(path));
            return files;
        } catch (e : haxe.Exception) {
            trace(e.details());
            trace("Error: " + e + "\nMsg: " + e.message);
        }
        return null;
    }

    public function getFiles_String_String_String(path : String, pathIncludes : String, includeExtension : String) : BasicArrayList {
        try {
            final includeExtensionBasicArrayList : BasicArrayList = new BasicArrayListD();
            includeExtensionBasicArrayList.add(includeExtension);
            final visitorFileFilter : VisitorFileFilter = new VisitorFileFilter(new DirectoryOrIncludeFileExtensionBooleanFileVisitor(includeExtensionBasicArrayList, pathIncludes));
            final files : BasicArrayList = this.subDirectory.search(visitorFileFilter, AbFile.createAbFile(path));
            return files;
        } catch (e : haxe.Exception) {
            trace(e.details());
            trace("Error: " + e + "\nMsg: " + e.message);
        }
        return null;
    }

    public function getTrackedFiles(...args : Dynamic) : Dynamic {
        if (args.length == 2 && Std.isOfType(args[0], String)) {
            return this.getTrackedFiles_String_StringArray(args[0], args[1]);
        }
        if (args.length == 2) {
            return this.getTrackedFiles_String_String(args[0], args[1]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: getTrackedFiles");
    }

    public function getTrackedFiles_String_StringArray(path : String, includeExtensions : haxe.ds.Vector<String>) : BasicArrayList {
        try {
            final includeExtensionBasicArrayList : BasicArrayList = new BasicArrayListD();
            final size : Int = includeExtensions.length;
            for (index in 0...size) {
                includeExtensionBasicArrayList.add(includeExtensions[index]);
            }
            final visitorFileFilter : VisitorFileFilter = new VisitorFileFilter(new DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor(includeExtensionBasicArrayList));
            final files : BasicArrayList = this.subDirectory.search(visitorFileFilter, AbFile.createAbFile(path));
            return files;
        } catch (e : haxe.Exception) {
            trace(e.details());
            trace("Error: " + e + "\nMsg: " + e.message);
        }
        return null;
    }

    public function getTrackedFiles_String_String(path : String, includeExtension : String) : BasicArrayList {
        try {
            final includeExtensionBasicArrayList : BasicArrayList = new BasicArrayListD();
            includeExtensionBasicArrayList.add(includeExtension);
            final visitorFileFilter : VisitorFileFilter = new VisitorFileFilter(new DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor(includeExtensionBasicArrayList));
            final files : BasicArrayList = this.subDirectory.search(visitorFileFilter, AbFile.createAbFile(path));
            return files;
        } catch (e : haxe.Exception) {
            trace(e.details());
            trace("Error: " + e + "\nMsg: " + e.message);
        }
        return null;
    }

    public function getDirectories(path : String) : BasicArrayList {
        try {
            final visitorFileFilter : VisitorFileFilter = new VisitorFileFilter(new DirectoryBooleanFileVisitor());
            final files : BasicArrayList = this.subDirectory.search(visitorFileFilter, AbFile.createAbFile(path));
            return files;
        } catch (e : haxe.Exception) {
            trace(e.details());
            trace("Error: " + e + "\nMsg: " + e.message);
        }
        return null;
    }

    public function new() {
    }
}

