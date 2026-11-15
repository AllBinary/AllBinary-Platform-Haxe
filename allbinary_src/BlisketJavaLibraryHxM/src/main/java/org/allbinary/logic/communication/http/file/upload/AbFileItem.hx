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
package org.allbinary.logic.communication.http.file.upload;

//import java.io.File;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.OutputStream;
//import java.io.UnsupportedEncodingException;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonStrings;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemHeaders;
import org.apache.commons.fileupload.FileItemUtil;

class AbFileItem implements FileItem {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final name : String;
    private var fieldName : String;
    private final byteArray : haxe.ds.Vector<Int>;
    public function new(name : String, fieldName : String, byteArray : haxe.ds.Vector<Int>) {
        this.name = name;
        this.fieldName = fieldName;
        this.byteArray = byteArray;
    }

    // throws IOException
    public function getInputStream() : InputStream {
        throw new IOException(this.commonStrings.NOT_IMPLEMENTED);
    }

    public function getContentType() : String {
        return null;
    }

    public function getName() : String {
        return this.name;
    }

    public function isInMemory() : Bool {
        return true;
    }

    public function getSize() : haxe.Int64 {
        return haxe.Int64.ofInt(this.byteArray.length);
    }

    public function get() : haxe.ds.Vector<Int> {
        return this.byteArray;
    }

    // throws UnsupportedEncodingException
    public function getString(encoding : String) : String {
        return haxe.io.Bytes.ofData(this.byteArray, encoding).toString();
    }

    public function getString() : String {
        try {
            return FileItemUtil.getInstance().getString(this.byteArray);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getString", e);
            }
            return StringUtil.getInstance().EMPTY_STRING;
        }
    }

    // throws Exception
    public function write(file : File) : Void {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    // throws Exception
    public function write(file : AbFile) : Void {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    public function delete() : Void {
        ForcedLogUtil.log(this.commonStrings.NOT_IMPLEMENTED, "delete()");
    }

    public function getFieldName() : String {
        return this.fieldName;
    }

    public function setFieldName(name : String) : Void {
        this.fieldName = name;
    }

    public function isFormField() : Bool {
        if (StringValidationUtil.getInstance().isEmpty(this.fieldName)) {
            return false;
        } else {
            return true;
        }
    }

    public function setFormField(state : Bool) : Void {
    }

    // throws IOException
    public function getOutputStream() : OutputStream {
        throw new IOException(this.commonStrings.NOT_IMPLEMENTED);
    }

    public function getHeaders() : FileItemHeaders {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

    public function setHeaders(fih : FileItemHeaders) : Void {
        throw new haxe.Exception(this.commonStrings.NOT_IMPLEMENTED);
    }

}

