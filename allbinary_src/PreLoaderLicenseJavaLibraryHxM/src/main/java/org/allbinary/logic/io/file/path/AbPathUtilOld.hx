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
package org.allbinary.logic.io.file.path;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.FilePathData;
import org.allbinary.logic.io.path.AbFilePath;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;

//Used to correct user input for paths
class AbPathUtilOld {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : AbPathUtilOld = new AbPathUtilOld();
    public static function getInstance() : AbPathUtilOld {
        return AbPathUtilOld.instance;
    }

    private final abPathData : AbPathData = AbPathData.getInstance();
    private final filePathData : FilePathData = FilePathData.getInstance();
    private static final MIN : Int = 4;
    public function new() {
    }

    // throws Exception
    public function getExtension(abFilePath : AbFilePath) : String {
        return this.getExtension(abFilePath.toString());
    }

    // throws Exception
    public function getExtension(abPath : AbPath) : String {
        return this.getExtension(abPath.toString());
    }

    // throws Exception
    public function getExtension(filePath : String) : String {
        if (filePath.length < AbPathUtilOld.MIN) {
            throw new haxe.Exception("Could not be a file path since its less that 4 characters");
        }
        var beginIndex : Int = filePath.length - AbPathUtilOld.MIN;
        var extension : String = filePath.substring(beginIndex + 1);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("FileExtension: " + extension, this, "getExtension()");
        }
        return extension;
    }

    // throws Exception
    public function getWithoutExtension(abFilePath : AbFilePath) : String {
        return this.getWithoutExtension(abFilePath.toString());
    }

    // throws Exception
    public function getWithoutExtension(abPath : AbPath) : String {
        return this.getWithoutExtension(abPath.toString());
    }

    // throws Exception
    public function getWithoutExtension(filePath : String) : String {
        if (filePath.length < AbPathUtilOld.MIN) {
            throw new haxe.Exception("Could not be a file path since its less that 4 characters");
        }
        var endIndex : Int = filePath.length - AbPathUtilOld.MIN;
        var pathWithoutExtension : String = filePath.substring(0, endIndex);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("FileWithoutExtension: " + pathWithoutExtension, this, "getWithoutExtension()");
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
        if (path.charCodeAt(0) == this.abPathData.SEPARATORCHAR) {
            return true;
        } else {
            return false;
        }
    }

    private function isValidEnd(path : String) : Bool {
        if (StringValidationUtil.getInstance().isEmpty(path)) {
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
        if (StringValidationUtil.getInstance().isEmpty(path)) {
            return this.abPathData.SEPARATOR;
        }
        if (path.indexOf("\\") >= 0) {
            path = StringTools.replace(path, "\\".code, this.abPathData.SEPARATORCHAR);
        }
        return path;
    }

    // synchronized
    public function getNameFromPath(categoryPath : String) : String {
        var endIndex : Int = categoryPath.lastIndexOf(this.abPathData.SEPARATOR);
        if (endIndex < 0) {
            endIndex = categoryPath.lastIndexOf(this.filePathData.SEPARATORCHAR);
        }
        if (endIndex < 0) {
            return categoryPath;
        }
        if (categoryPath.length == endIndex + 1) {
            var categoryName : String = categoryPath.substring(0, endIndex);
            return this.getNameFromPath(categoryName);
        } else {
            var categoryName : String = categoryPath.substring(endIndex + 1);
            return categoryName;
        }
    }

    // throws Exception
    // synchronized
    public function removeNameFromPath(categoryPath : String) : AbPath {
        var endIndex : Int = categoryPath.lastIndexOf(this.abPathData.SEPARATOR);
        if (endIndex < 0) {
            endIndex = categoryPath.lastIndexOf(this.filePathData.SEPARATORCHAR);
        }
        if (endIndex < 0) {
            return AbPath.createAbPath();
        }
        if (categoryPath.length == endIndex + 1) {
            return this.removeNameFromPath(categoryPath.substring(0, endIndex - 1));
        } else {
            var categoryName : String = categoryPath.substring(0, endIndex);
            return new AbPath(categoryName, StringUtil.getInstance().EMPTY_STRING);
        }
    }

}

