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
import org.allbinary.string.CommonSeps;

class AbPathData {
    private static final instance : AbPathData = new AbPathData();
    public static function getInstance() : AbPathData {
        return AbPathData.instance;
    }

    public final EXTENSION_SEP : String = CommonSeps.getInstance().PERIOD;
    public final SEPARATORCHAR : Int = "/".code;
    public final SEPARATOR : String = CommonSeps.getInstance().FORWARD_SLASH;
    public function new() {
    }

    public function getExtensionIndex(filePath : String) : Int {
        final indexOfFileExtensionDelmiter : Int = filePath.lastIndexOf(this.EXTENSION_SEP);
        final indexOfLatDelimiter : Int = filePath.lastIndexOf(String.fromCharCode(this.SEPARATORCHAR));
        if (indexOfFileExtensionDelmiter < 0) {
            return -1;
        }
        if (indexOfFileExtensionDelmiter < indexOfLatDelimiter) {
            return -1;
        }
        return indexOfFileExtensionDelmiter;
    }

    public function getExtensionWithDot(filePath : String) : String {
        final indexOfFileExtensionDelmiter : Int = this.getExtensionIndex(filePath);
        var extension : String = StringUtil.getInstance().EMPTY_STRING;
        if (indexOfFileExtensionDelmiter >= 0) {
            extension = filePath.substring(indexOfFileExtensionDelmiter);
        }
        return extension;
    }

    public function getExtension(filePath : String) : String {
        final indexOfFileExtensionDelmiter : Int = this.getExtensionIndex(filePath);
        var extension : String = StringUtil.getInstance().EMPTY_STRING;
        if (indexOfFileExtensionDelmiter >= 0) {
            extension = filePath.substring(indexOfFileExtensionDelmiter + 1);
        }
        return extension;
    }

    public function getNameFromPath(path : String) : String {
        var endIndex : Int = path.lastIndexOf(String.fromCharCode(this.SEPARATORCHAR));
        if (endIndex < 0) {
            endIndex = path.lastIndexOf(jre.lang.JavaString.text(FilePathData.getInstance().SEPARATORCHAR));
        }
        if (endIndex < 0) {
            return path;
        }
        if (path.length == endIndex + 1) {
            var categoryName : String = path.substring(0, endIndex);
            return this.getNameFromPath(categoryName);
        } else {
            var categoryName : String = path.substring(endIndex + 1);
            return categoryName;
        }
    }

    public function removeNameFromPath(path : String) : String {
        var endIndex : Int = path.lastIndexOf(String.fromCharCode(this.SEPARATORCHAR));
        if (endIndex < 0) {
            endIndex = path.lastIndexOf(jre.lang.JavaString.text(FilePathData.getInstance().SEPARATORCHAR));
        }
        if (endIndex < 0) {
            return StringUtil.getInstance().EMPTY_STRING;
        }
        if (path.length == endIndex + 1) {
            return this.removeNameFromPath(path.substring(0, endIndex - 1));
        } else {
            var pathWithoutName : String = path.substring(0, endIndex);
            return pathWithoutName;
        }
    }

}

