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

//import java.io.InputStream;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.AbFile;

class CloudStreamUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : CloudStreamUtil = new CloudStreamUtil();
    public static function getInstance() : CloudStreamUtil {
        return CloudStreamUtil.instance;
    }

    // throws Exception
    public function getFile(file : AbFile) : InputStream {
        var inputStream : InputStream = new AbFileInputStream(file);
        var available : Int = inputStream.available();
        if (available > 0) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Cloud File Bytes: " + available, this, "processRequest()");
            }
        }
        return inputStream;
    }

    // throws Exception
    public function getFileAnyWhere(file : AbFile) : InputStream {
        var inputStream : InputStream = new AbFileLocalInputStream(file);
        var available : Int = inputStream.available();
        if (available > 0) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Local File Bytes: " + available, this, "processRequest()");
            }
        } else {
            inputStream = new AbFileInputStream(file);
            available = inputStream.available();
            if (available > 0) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                    this.logUtil.putF("Cloud File Bytes: " + available, this, "processRequest()");
                }
            }
        }
        return inputStream;
    }

    // throws Exception
    public function getFileLocal(file : AbFile) : InputStream {
        var inputStream : InputStream = new AbFileLocalInputStream(file);
        var available : Int = inputStream.available();
        if (available > 0) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Local File Bytes: " + available, this, "processRequest()");
            }
        }
        return inputStream;
    }

    public function new() {
    }
}

