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
package org.allbinary.logic.system.security.licensing.registration;

//import java.io.DataInputStream;
//import java.io.InputStream;
//import java.io.OutputStream;
import org.allbinary.logic.io.AbDataOutputStream;
import org.allbinary.logic.io.FileStreamFactory;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.FileFactory;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;

class RegistrationConfiguration {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final SINGLETON : RegistrationConfiguration = new RegistrationConfiguration();
    private var registrationCode : String = "No Registration Code";
    public final NAME : String = "registrationid";
    private final FILE : String = "Registration.dat";
    public function new() {
        try {
            if (FileFactory.getInstance().isFile(this.FILE)) {
                this.read();
            } else {
                this.write();
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
        }
    }

    public static function getInstance() : RegistrationConfiguration {
        return RegistrationConfiguration.SINGLETON;
    }

    // throws Exception
    private function read() : Void {
        var fileInputStreamFactory : FileStreamFactory = FileStreamFactory.getInstance();
        var fileInputStream : InputStream = fileInputStreamFactory.getFileInputStreamInstance(StringUtil.getInstance().EMPTY_STRING, this.FILE);
        var dataInputStream : DataInputStream = new DataInputStream(fileInputStream);
        this.setRegistrationCode(dataInputStream.readUTF());
        PreLogUtil.put(new StringMaker().append("Read Configuration: ").append(this.toString()).toString(), this, "read");
    }

    // throws Exception
    public function write() : Void {
        var dataOutputStream : AbDataOutputStream = null;
        try {
            this.logUtil.putF(new StringMaker().append("Write Configuration: ").append(this.toString()).toString(), this, "write");
            var fileInputStreamFactory : FileStreamFactory = FileStreamFactory.getInstance();
            var fileOutputStream : OutputStream = fileInputStreamFactory.getFileOutputStreamInstance(StringUtil.getInstance().EMPTY_STRING, this.FILE);
            dataOutputStream = new AbDataOutputStream(fileOutputStream);
            dataOutputStream.writeUTF(this.getRegistrationCode());
            dataOutputStream.flush();
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            StreamUtil.getInstance().close(dataOutputStream);
        }
    }

    public function toString() : String {
        return new StringMaker().append("Registration Code: ").append(this.getRegistrationCode()).toString();
    }

    public function setRegistrationCode(registrationCode : String) : Void {
        this.registrationCode = registrationCode;
    }

    public function getRegistrationCode() : String {
        return this.registrationCode;
    }

}

