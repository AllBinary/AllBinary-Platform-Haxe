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

import org.allbinary.java.runtime.process.git.GitProcessHelper;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.CommonDataFileStrings;
import org.allbinary.logic.io.file.visitor.IncludeFileExtensionsBooleanFileVisitor;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor extends IncludeFileExtensionsBooleanFileVisitor {
    private var trackedStrings : TrackedStrings = TrackedStrings.getInstance();
    private var gitProcessHelper : GitProcessHelper = GitProcessHelper.getInstance();
    private var includesString : String;
    public function new(...args : Dynamic) {
        if (args.length == 1) {
            final filterStringBasicArrayList : BasicArrayList = args[0];
            super(filterStringBasicArrayList);
            this._newDirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor0(filterStringBasicArrayList);
        }
        else if (args.length == 2) {
            final filterStringBasicArrayList : BasicArrayList = args[0];
            final includesString : String = args[1];
            super(filterStringBasicArrayList);
            this._newDirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor1(filterStringBasicArrayList, includesString);
        }
    }

    private function _newDirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor0(filterStringBasicArrayList : BasicArrayList) : Void {
        this.includesString = null;
    }

    private function _newDirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor1(filterStringBasicArrayList : BasicArrayList, includesString : String) : Void {
        this.includesString = includesString;
    }

    public override function visit(...args : Dynamic) : Dynamic {
        if (args.length == 1) {
            return this.visit_AbFile(args[0]);
        }
        if (args.length == 2) {
            return this.visit_AbFile_String(args[0], args[1]);
        }
        return super.visit(...args);
    }

    public override function visit_AbFile(file : AbFile) : Null<Bool> {
        if (file.isDirectory()) {
            return true;
        }
        if (this.includesString == null || file.getAbsolutePath().indexOf(this.includesString) >= 0) {
            return super.visit(file);
        } else {
            return false;
        }
    }

    public override function visit_AbFile_String(file : AbFile, fileNameString : String) : Null<Bool> {
        final filePath : String = file.getPath();
        if (super.visit(file, fileNameString)) {
            if (!(StringTools.contains(filePath, this.trackedStrings.APPLICATION) || StringTools.contains(filePath, this.trackedStrings.APP) || StringTools.contains(filePath, this.trackedStrings.HTML_TEMP))) {
                if (!(StringTools.contains(filePath, this.trackedStrings.TARGET_PATH_WINDOWS) || StringTools.contains(filePath, this.trackedStrings.TARGET_PATH_UNIX))) {
                    if (this.gitProcessHelper.isTracked(file)) {
                        return true;
                    } else {
                    }
                } else {
                }
            } else {
            }
        }
        return false;
    }

    public static function main(args : haxe.ds.Vector<String>) : Void {
        final commonFileStrings : CommonDataFileStrings = CommonDataFileStrings.getInstance();
        final list : BasicArrayList = new BasicArrayListD();
        list.add(commonFileStrings.JAVA);
        final filePath : String = "G:\\mnt\\bc\\mydev\\games\\ZeptoRacer\\platform\\j2se\\ZeptoRacerStaticPathsJ2SEM\\target\\dependency\\org\\allbinary\\logic\\system\\security\\licensing\\ZeptoRacerPCClientInformation.java";
        final result : Bool = new DirectoryOrIncludeFileExtensionAndTrackedBooleanFileVisitor(list).visit(AbFile.createAbFileFromRawPath(filePath));
        trace(filePath + " is Tracked: " + result);
    }

}

