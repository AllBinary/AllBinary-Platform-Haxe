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
package org.allbinary.logic.system.security.licensing;

import jre.io.InputStream;
import jre.io.OutputStream;
import org.allbinary.business.init.LicenseInitInfoUtil;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.FileStreamFactory;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.FileFactory;
import org.allbinary.logic.io.file.SimpleFileUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class LicenseServerInitFileUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final NULL_OUTPUT_STREAM : OutputStream = SimpleFileUtil.nullOutputStream();
    public function init() : Void {
        try {
            final filePath : String = LicenseInitInfoUtil.getInstance().INITFILENAME;
            LicenseInitInfoUtil.getInstance().setFilePath(StringUtil.getInstance().EMPTY_STRING);
            if (FileFactory.getInstance().isFile(filePath)) {
                this.logUtil.putF("Using Existing License File", this, this.commonStrings.INIT);
            } else {
                this.write();
            }
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.INIT, e);
        }
    }

    private function write() : Void {
        var fileOutputStream : OutputStream = this.NULL_OUTPUT_STREAM;
        try {
            final resourceUtil : ResourceUtil = ResourceUtil.getInstance();
            final filePath : String = LicenseInitInfoUtil.getInstance().INITFILENAME;
            final inputStream : InputStream = jre.lang.ClassLoader.getSystemResourceAsStream(filePath);
            this.logUtil.putF("Writing Default License File", this, this.commonStrings.INIT);
            final fileStreamFactory : FileStreamFactory = FileStreamFactory.getInstance();
            fileOutputStream = fileStreamFactory.getFileOutputStreamInstance(StringUtil.getInstance().EMPTY_STRING, filePath);
            var b : Int = 0;
            var index : Int = 0;
            while (true) {
                b = inputStream.read();
                if (b == -1) {
                    break;
                }
                fileOutputStream.write(b);
                index++;
            }
            this.logUtil.putF("Wrote Bytes: " + index, this, this.commonStrings.INIT);
            fileOutputStream.flush();
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.INIT, e);
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            StreamUtil.getInstance().close(fileOutputStream);
        }
    }

    public function new() {
    }
}

