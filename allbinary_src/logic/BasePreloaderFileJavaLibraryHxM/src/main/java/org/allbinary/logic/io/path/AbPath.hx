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
import org.allbinary.logic.io.file.FilePathUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonSeps;

class AbPath {
    public static function createAbPath() : AbPath {
        try {
            final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
            return new AbPath(EMPTY_STRING, EMPTY_STRING);
        } catch (ex : haxe.Exception) {
            throw new haxe.Exception();
        }
    }

    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private final abPathData : AbPathData = AbPathData.getInstance();
    private final abPathUtil : PathUtil = PathUtil.getInstance();
    private final EMPTY_STRING : String = StringUtil.getInstance().EMPTY_STRING;
    public var schema : String = this.EMPTY_STRING;
    private var path : String = this.EMPTY_STRING;
    public var nameP : String = this.EMPTY_STRING;
    private var hasSchemaP : Bool = false;
    private var numberOfSeps : Int = 0;
    public function new(aPath : String, name : String) {
        final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (!stringValidationUtil.isEmpty(aPath)) {
            this.schema = this.getSchema(aPath);
            this.nameP = name;
            this.path = this.abPathUtil.adjustEnd(this.abPathUtil.adjust(this.getPathFromPath(aPath)));
        } else {
            this.init();
            if (!stringValidationUtil.isEmpty(name)) {
                this.nameP = name;
            }
        }
    }

    private function init() : Void {
        this.schema = this.EMPTY_STRING;
        this.setPath(this.abPathData.SEPARATOR);
        this.nameP = this.EMPTY_STRING;
    }

    public function getSchema(aPath : String) : String {
        var beginIndex : Int = aPath.indexOf(this.commonSeps.COLON);
        if (beginIndex >= 0) {
            this.hasSchemaP = true;
            return aPath.substring(0, beginIndex);
        }
        this.hasSchemaP = false;
        return this.EMPTY_STRING;
    }

    public function hasSchema() : Bool {
        return this.hasSchemaP;
    }

    // throws Exception
    public function getPathFromPath(aPath : String) : String {
        final filePathData : FilePathData = FilePathData.getInstance();
        var tempPath : String = aPath;
        if (!this.hasSchema()) {
            tempPath = this.abPathUtil.adjustStart(tempPath);
        } else {
            var beginIndex : Int = tempPath.indexOf(this.commonSeps.COLON);
            if (beginIndex >= 0) {
                beginIndex++;
                while (tempPath.charCodeAt(beginIndex) == this.abPathData.SEPARATORCHAR || tempPath.charCodeAt(beginIndex) == filePathData.SEPARATORCHAR) {
                    beginIndex++;
                    this.numberOfSeps++;
                    if (this.numberOfSeps > 2) {
                        throw new haxe.Exception("Should Not Have More Than Two Seps");
                    }
                }
                tempPath = tempPath.substring(beginIndex, tempPath.length);
            }
        }
        return tempPath;
    }

    public function setName(name : String) : Void {
        this.nameP = name;
    }

    public function getName() : String {
        return this.nameP;
    }

    private static final NETWORK_SEP : String = ":/";
    public function toString() : String {
        final stringBuffer : StringMaker = new StringMaker();
        if (this.hasSchema()) {
            stringBuffer.append(this.schema);
            stringBuffer.append(AbPath.NETWORK_SEP);
        }
        stringBuffer.append(this.getPath());
        stringBuffer.append(this.nameP);
        return stringBuffer.toString();
    }

    public function toFileSystemString() : String {
        if (this.hasSchema()) {
            final filePathData : FilePathData = FilePathData.getInstance();
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(this.schema);
            stringBuffer.append(this.commonSeps.COLON);
            stringBuffer.append(filePathData.PATH_START);
            stringBuffer.append(FilePathUtil.adjust(this.getPath()));
            stringBuffer.append(this.nameP);
            return stringBuffer.toString();
        } else {
            return FilePathUtil.adjust(this.getPath()) + this.nameP;
        }
    }

    public function getPath() : String {
        return this.path;
    }

    public function setPath(path : String) : Void {
        this.path = path;
    }

}

