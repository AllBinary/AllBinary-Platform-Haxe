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
package org.allbinary.logic.io.path;

import org.allbinary.logic.io.file.FilePathData;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;

//Used to correct user input for paths
class PathUtil {
    private static final instance : PathUtil = new PathUtil();
    public static function getInstance() : PathUtil {
        return PathUtil.instance;
    }

    private final abPathData : AbPathData = AbPathData.getInstance();
    private final filePathData : FilePathData = FilePathData.getInstance();
    public function new() {
    }

    public function getExtensionWithAbFilePath(abFilePath : AbFilePath) : String {
        return this.abPathData.getExtension(Std.string(abFilePath));
    }

    public function getExtensionWithAbPath(abPath : AbPath) : String {
        return this.abPathData.getExtension(Std.string(abPath));
    }

    // throws Exception
    public function getWithoutExtensionWithAbFilePath(abFilePath : AbFilePath) : String {
        return this.getWithoutExtension(Std.string(abFilePath));
    }

    // throws Exception
    public function getWithoutExtensionWithAbPath(abPath : AbPath) : String {
        return this.getWithoutExtension(Std.string(abPath));
    }

    // throws Exception
    public function getWithoutExtension(filePath : String) : String {
        var indexOfFileExtensionDelmiter : Int = this.abPathData.getExtensionIndex(filePath);
        var pathWithoutExtension : String = filePath;
        if (indexOfFileExtensionDelmiter >= 0) {
            pathWithoutExtension = filePath.substring(0, indexOfFileExtensionDelmiter);
        }
        return pathWithoutExtension;
    }

    public function isValid(path : String) : Bool {
        if (this.isValidStart(path)) {
            if (this.isValidEnd(path)) {
                return true;
            }
        }
        return false;
    }

    private function isValidStart(path : String) : Bool {
        if (path.charCodeAt(0) == this.abPathData.SEPARATORCHAR || path.charCodeAt(0) == ".".code) {
            return true;
        } else {
            return false;
        }
    }

    private function isValidEnd(path : String) : Bool {
        final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (stringValidationUtil.isEmpty(path)) {
            return false;
        }
        if (path.charCodeAt(path.length - 1) == this.abPathData.SEPARATORCHAR) {
            return true;
        } else {
            return false;
        }
    }

    public function adjustStart(path : String) : String {
        if (!this.isValidStart(path)) {
            path = this.abPathData.SEPARATOR + path;
        }
        return path;
    }

    public function adjustEnd(path : String) : String {
        if (!this.isValidEnd(path)) {
            path = path + this.abPathData.SEPARATOR;
        }
        return path;
    }

    public function adjust(path : String) : String {
        final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (stringValidationUtil.isEmpty(path)) {
            return this.abPathData.SEPARATOR;
        }
        if (path.indexOf("\\") >= 0) {
            path = StringTools.replace(path, "\\".code, this.abPathData.SEPARATORCHAR);
        }
        return path;
    }

    // throws Exception
    public function removeNameFromPath(path : String) : AbPath {
        var endIndex : Int = path.lastIndexOf(jre.lang.JavaString.text(this.abPathData.SEPARATOR));
        if (endIndex < 0) {
            endIndex = path.lastIndexOf(jre.lang.JavaString.text(this.filePathData.SEPARATORCHAR));
        }
        if (endIndex < 0) {
            return AbPath.createAbPath();
        }
        if (path.length == endIndex + 1) {
            return this.removeNameFromPath(path.substring(0, endIndex - 1));
        } else {
            final pathWithoutName : String = path.substring(0, endIndex);
            return new AbPath(pathWithoutName, StringUtil.getInstance().EMPTY_STRING);
        }
    }

}

