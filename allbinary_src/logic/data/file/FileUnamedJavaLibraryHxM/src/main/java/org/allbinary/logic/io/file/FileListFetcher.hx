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
    public function getFiles(path : String) : BasicArrayList {
        try {
            final files : BasicArrayList = this.subDirectory.search(AbFile.createAbFile(path));
            return files;
        } catch (e : haxe.Exception) {
            trace(e.details());
            trace("Error: " + e + "\nMsg: " + e.message);
        }
        return null;
    }

    public function getFiles(path : String, includeExtensions : haxe.ds.Vector<String>) : BasicArrayList {
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

    public function getFiles(path : String, includeExtension : String) : BasicArrayList {
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

    public function getFiles(path : String, pathIncludes : String, includeExtension : String) : BasicArrayList {
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

    public function getTrackedFiles(path : String, includeExtensions : haxe.ds.Vector<String>) : BasicArrayList {
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

    public function getTrackedFiles(path : String, includeExtension : String) : BasicArrayList {
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

