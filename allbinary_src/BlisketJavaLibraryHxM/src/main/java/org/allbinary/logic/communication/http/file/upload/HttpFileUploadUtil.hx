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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.anyType.clazz.ClassUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemStream;

class HttpFileUploadUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : HttpFileUploadUtil = new HttpFileUploadUtil();
    public static function getInstance() : HttpFileUploadUtil {
        return HttpFileUploadUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function isValid(anyType : Any) : Bool {
        if (anyType != null && !(Std.isOfType(anyType, String))) {
            if (Std.isOfType(anyType, FileItem)) {
                return true;
            } else {
                throw new haxe.Exception("Object Not Instance Of FileItem but is: " + ClassUtil.viewAll(anyType, CommonSeps.getInstance().NEW_LINE));
            }
        }
        return false;
    }

    // throws Exception
    public static function log(fileItem : FileItemStream) : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        stringBuffer.append("FileItem Log:");
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append("Content Type:");
        stringBuffer.append(fileItem.getContentType());
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append("Field Name:");
        stringBuffer.append(fileItem.getFieldName());
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append("Name:");
        stringBuffer.append(fileItem.getName());
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append("Size:");
        stringBuffer.append(" Not Calculated Yet");
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTP)) {
            logUtil.putF(stringBuffer.toString(), getInstance(), "log()");
        }
    }

    public static function log(fileItem : FileItem) : Void {
        final logUtil : LogUtil = LogUtil.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        stringBuffer.append("FileItem Log:");
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append("Content Type:");
        stringBuffer.append(fileItem.getContentType());
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append("Field Name:");
        stringBuffer.append(fileItem.getFieldName());
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append("Name:");
        stringBuffer.append(fileItem.getName());
        stringBuffer.append(commonSeps.NEW_LINE);
        stringBuffer.append("Size:");
        stringBuffer.appendlong(haxe.Int64.ofInt(fileItem.getSize()));
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            logUtil.putF(stringBuffer.toString(), getInstance(), "log()");
        }
    }

}

