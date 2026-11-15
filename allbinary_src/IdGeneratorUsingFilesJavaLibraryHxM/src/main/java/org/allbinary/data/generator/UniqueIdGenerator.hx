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
package org.allbinary.data.generator;

//import java.io.IOException;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.AbDataInputStream;
import org.allbinary.logic.io.AbDataOutputStream;
import org.allbinary.logic.io.AbFileInputStream;
import org.allbinary.logic.io.AbFileOutputStream;
import org.allbinary.logic.io.DataOutputStreamFactory;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.string.CommonStrings;

class UniqueIdGenerator implements IdGeneratorInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public static final EXT : String = ".unq";
    private var newFile : AbFile = null;
    private var id : haxe.Int64 = 0;
    public function new() {
    }

    public function initialize(value : Int) : Void {
        try {
            this.newFile.createNewFile();
            final idData : AbDataOutputStream = DataOutputStreamFactory.getInstance().getInstanceForAbFile(this.newFile);
            idData.writeLong(value);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().IDLOGGING)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, "initialize", e);
            }
        }
    }

    // throws Exception
    // synchronized
    public function setFile(filePathName : String, name : String) : Void {
        this.newFile = AbFile.createAbFile(filePathName);
    }

    // throws IOException
    // synchronized
    public function getNext() : String {
        var idData : AbDataInputStream = null;
        var idOutData : AbDataOutputStream = null;
        try {
            final idFile : AbFileInputStream = new AbFileInputStream(this.newFile);
            idData = new AbDataInputStream(idFile);
            this.id = idData.readLong();
            final idOutFile : AbFileOutputStream = AbFileOutputStream.createFromAbFile(this.newFile);
            idOutData = new AbDataOutputStream(idOutFile);
            idOutData.writeLong(this.id + 1);
            final idLong : Null<haxe.Int64> = this.id;
            return idLong.toString();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().IDLOGGING)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, "getNext", e);
            }
            return "Error";
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            StreamUtil.getInstance().close(idData);
            StreamUtil.getInstance().close(idOutData);
        }
    }

}

