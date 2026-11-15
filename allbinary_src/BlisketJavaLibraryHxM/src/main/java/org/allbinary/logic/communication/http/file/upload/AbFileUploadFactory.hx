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

//import java.util.ArrayList;
//import java.util.List;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.logic.communication.http.AbFileItemFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileItemUtil;

class AbFileUploadFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : AbFileUploadFactory = new AbFileUploadFactory();
    public static function getInstance() : AbFileUploadFactory {
        return AbFileUploadFactory.instance;
    }

    public function new() {
    }

    // throws Exception
    public function getFileItemStreamList(httpServletRequest : HttpServletRequest) : List {
        try {
            var fileUpload : AbFileUpload = new AbFileUpload(new AbFileItemFactory());
            var iterator : FileItemIterator = fileUpload.getItemIterator(httpServletRequest);
            var items : List = new ArrayList();
            while (iterator.hasNext()) {
                var fileItemStream : FileItemStream = iterator.next();
                HttpFileUploadUtil.log(fileItemStream);
                var fileItem : AbFileItem = new AbFileItem(fileItemStream.getName(), fileItemStream.getFieldName(), FileItemUtil.getInstance().getBytes(fileItemStream));
                items.add(fileItem);
            }
            return items;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put(commonStrings.EXCEPTION, this, "get()", e);
            }
            throw e;
        }
    }

    // throws Exception
    public function getFileItemList(httpServletRequest : HttpServletRequest) : List {
        try {
            var abFileUpload : AbFileUpload = new AbFileUpload(new AbFileItemFactory());
            return abFileUpload.parseRequest(httpServletRequest);
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "get()", e);
            }
            throw e;
        }
    }

}

