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

//import java.io.File;
import org.allbinary.logic.communication.log.PreLogUtil;

class FileWrapperUtil {
    public static function wrapFiles(files : haxe.ds.Vector<Any>) : haxe.ds.Vector<AbFile> {
        try {
            final abFileArray : haxe.ds.Vector<AbFile> = haxe.ds.Vector.fromArrayCopy([for (index in 0...files.length) null]);
            {
                var index : Int = files.length - 1;
                while (index >= 0) {
                abFileArray[index] = new AbFile((cast files[index] : File));
                    index--;
                }
            }
            return abFileArray;
        } catch (e : haxe.Exception) {
            PreLogUtil.putSE("Exception Wrapping Files", "FileWrapperUtil", "wrapFiles", e);
            return haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
        }
    }

    public static function wrapFile(file : File) : AbFile {
        try {
            return new AbFile(file);
        } catch (e : haxe.Exception) {
            PreLogUtil.putSE("Exception Wrapping File", "FileWrapperUtil", "wrapFile", e);
            return AbFile.NULL_FILE;
        }
    }

    public function new() {
    }
}

