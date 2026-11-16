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

class SmallInsert {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var fileName : String;
    private var string : String;
    public function new(fileName : String) {
        this.fileName = fileName;
        this.string = AbFileSystem.getInstance().readAsString(fileName);
    }

    public function atBeginning(text : String) : Bool {
        try {
            var idFile : FileOutputStream = new FileOutputStream(this.fileName);
            var idOutData : DataOutputStream = new DataOutputStream(idFile);
            idOutData.writeBytes(text + this.string);
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().IDLOGGING)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "insertAtBeginning", e);
            }
            return false;
        }
    }

    public function after(text : String, after : String) : Bool {
        try {
            var index : Int = this.string.indexOf(after);
            if (index < 0) {
                trace("No such start: " + after + " in: " + this.string);
                return false;
            }
            index = index + after.length;
            var start : String = this.string.substring(0, index);
            var end : String = this.string.substring(index + 1, this.string.length);
            var idFile : FileOutputStream = new FileOutputStream(this.fileName);
            var idOutData : DataOutputStream = new DataOutputStream(idFile);
            idOutData.writeBytes(start + text + end);
            idOutData.close();
            idFile.close();
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().IDLOGGING)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "after", e);
            }
            return false;
        }
    }

    public function atEnd(text : String) : Bool {
        try {
            var idFile : FileOutputStream = new FileOutputStream(this.fileName);
            var idOutData : DataOutputStream = new DataOutputStream(idFile);
            idOutData.writeBytes(this.string + text);
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().IDLOGGING)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "insertAtEnd", e);
            }
            return false;
        }
    }

}

