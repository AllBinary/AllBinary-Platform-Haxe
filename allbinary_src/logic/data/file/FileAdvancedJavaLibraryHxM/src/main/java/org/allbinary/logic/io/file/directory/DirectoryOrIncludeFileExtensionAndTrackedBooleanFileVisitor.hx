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
    private final trackedStrings : TrackedStrings = TrackedStrings.getInstance();
    private final gitProcessHelper : GitProcessHelper = GitProcessHelper.getInstance();
    private final includesString : String;
    public function new(filterStringBasicArrayList : BasicArrayList) {
        super(filterStringBasicArrayList);
        this.includesString = null;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(filterStringBasicArrayList : BasicArrayList, includesString : String) {
        super(filterStringBasicArrayList);
        this.includesString = includesString;
    }

    public override function visit(file : AbFile) : Null<Bool> {
        if (file.isDirectory()) {
            return true;
        }
        if (this.includesString == null || file.getAbsolutePath().indexOf(this.includesString) >= 0) {
            return super.visit(file);
        } else {
            return false;
        }
    }

    public override function visit(file : AbFile, fileNameString : String) : Null<Bool> {
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

