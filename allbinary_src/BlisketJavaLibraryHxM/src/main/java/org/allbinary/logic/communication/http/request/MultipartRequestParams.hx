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
package org.allbinary.logic.communication.http.request;

//import java.util.HashMap;
//import java.util.List;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.file.upload.AbFileUploadFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase.InvalidContentTypeException;

class MultipartRequestParams extends RequestParams {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var special : Bool = false;
    public function new(request : HttpServletRequest) {
        super();
        this.processMultipartRequest(request);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(pageContext : PageContext) {
        super();
        this.processMultipartRequest((cast pageContext.getRequest() : HttpServletRequest));
    }

    public function setSpecial() : Void {
        this.special = true;
    }

    private function processMultipartRequest(request : HttpServletRequest) : Void {
        try {
            var specialRequest : HashMap = StdUtil.getInstance().createHashMap();
            var multipartRequestList : List = AbFileUploadFactory.getInstance().getFileItemStreamList(request);
            if (multipartRequestList != null) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                    this.logUtil.putF("FileItem List Size: " + multipartRequestList.size(), this, "processMultipartRequest()");
                }
                final fileItemArray : haxe.ds.Vector<Any> = multipartRequestList.toArray();
                final size : Int = fileItemArray.length;
                for (index in 0...size) {
                    var fileItem : FileItem = (cast fileItemArray[index] : FileItem);
                    var name : String = fileItem.getName();
                    if (StringValidationUtil.getInstance().isEmpty(name)) {
                        specialRequest.put(fileItem.getFieldName(), fileItem.getString());
                    } else {
                        specialRequest.put(fileItem.getFieldName(), fileItem);
                    }
                }
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                    this.logUtil.putF("Special Request Data: " + specialRequest.toString(), this, "processMultipartRequest()");
                }
                this.setSpecial();
                this.setMap(specialRequest);
            }
        } catch (e : InvalidContentTypeException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                this.logUtil.putF("Using Normal RequestParams", this, "processMultipartRequest()");
            }
            super.setMap(request.getParameterMap());
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUESTERROR)) {
                this.logUtil.putF("Should Not Occur", this, "processMultipartRequest()");
            }
            super.setMap(request.getParameterMap());
        }
    }

    // throws Exception
    public function toHashMap() : HashMap {
        if (this.special) {
            return (cast this.getMap() : HashMap);
        } else {
            return super.toHashMap();
        }
    }

}

