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
package org.allbinary.logic.io;

import jre.io.DataOutputStream;
import jre.io.FileOutputStream;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.AbFileSystem;
import org.allbinary.string.CommonStrings;

class SmallDelete {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var fileName : String;
    private var string : String;
    public function new(fileName : String) {
        this.fileName = fileName;
        this.string = AbFileSystem.getInstance().readAsString(fileName);
    }

    public function deleteAtStart(start : String, end : String) : Bool {
        try {
            var beginIndex : Int = 0;
            var endIndex : Int = 0;
            beginIndex = this.string.indexOf(start);
            endIndex = this.string.indexOf(end);
            if (endIndex > beginIndex && beginIndex >= 0 && endIndex >= 0 && beginIndex < 10 && endIndex < 525) {
                final text : String = this.string.substring(endIndex, this.string.length);
                var idFile : FileOutputStream = new FileOutputStream(this.fileName);
                var idOutData : DataOutputStream = new DataOutputStream(idFile);
                idOutData.writeBytes(text);
                return true;
            }
            return false;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().IDLOGGING)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "deleteAtStart", e);
            }
            return false;
        }
    }

    public function deleteBetween(start : String, end : String, newText : String) : Bool {
        try {
            var beginIndex : Int = 0;
            var endIndex : Int = 0;
            beginIndex = this.string.indexOf(start);
            endIndex = this.string.indexOf(end);
            if (endIndex > beginIndex && beginIndex >= 0 && endIndex >= 0 && beginIndex < 50 && endIndex < 425) {
                final newStart : String = this.string.substring(0, beginIndex);
                final text : String = this.string.substring(endIndex + end.length, this.string.length);
                var idFile : FileOutputStream = new FileOutputStream(this.fileName);
                var idOutData : DataOutputStream = new DataOutputStream(idFile);
                idOutData.writeBytes(newStart + newText + text);
                return true;
            }
            return false;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().IDLOGGING)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "deleteAtStart", e);
            }
            return false;
        }
    }

}

