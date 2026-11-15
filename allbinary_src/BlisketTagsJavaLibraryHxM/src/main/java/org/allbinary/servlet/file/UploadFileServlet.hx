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
package org.allbinary.servlet.file;

//import java.io.IOException;
//import java.io.InputStream;
//import java.util.HashMap;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import admin.taghelpers.AuthenticationHelper;
import admin.taghelpers.AuthenticationHelperFactory;
import admin.taghelpers.AuthenticationHelperUtil;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.file.upload.FileUploadData;
import org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil;
import org.allbinary.logic.communication.http.request.HttpRequestUtil;
import org.allbinary.logic.communication.http.request.MultipartRequestParams;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.AbFileOutputStream;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.servlet.BlisketServletUtil;
import org.allbinary.string.CommonStrings;
import org.apache.commons.fileupload.FileItem;

class UploadFileServlet extends HttpServlet {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public var requestHashMap : HashMap = null;
    private var fileName : String = null;
    // throws ServletException, IOException
    public function processRequest(request : HttpServletRequest, response : HttpServletResponse) : Void {
        var isError : Bool = false;
        var inputStream : InputStream = null;
        try {
            BlisketServletUtil.getInstance().init(request);
            this.requestHashMap = new MultipartRequestParams(request).toHashMap();
            var filePath : String = (cast this.requestHashMap.get(FileUploadData.getInstance().UPLOAD_TO_FILE_PATH) : String);
            if (filePath == null) {
                isError = true;
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            var hashMap : HashMap = StdUtil.getInstance().createHashMap();
            var authenticationHelper : AuthenticationHelper = (cast new AuthenticationHelperFactory().getInstance(hashMap, request) : AuthenticationHelper);
            if (authenticationHelper.isAuthenticated()) {
                if (AuthenticationHelperUtil.getInstance().isAuthorized(authenticationHelper, filePath)) {
                    this.saveFile(filePath);
                    response.setContentType("text/plain");
                    response.getOutputStream().write(haxe.io.Bytes.ofString("OK!"));
                } else {
                    isError = true;
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "You are not Authorized");
                }
            } else {
                isError = true;
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Please Login");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "processRequest()", e);
            }
            isError = true;
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            if (!isError) {
                StreamUtil.getInstance().close(response.getOutputStream());
            }
            if (!StreamUtil.getInstance().close(inputStream)) {
            }
        }
    }

    // throws Exception
    private function saveFile(filePath : String) : Void {
        var fileOutputStream : AbFileOutputStream = null;
        try {
            var fileItem : FileItem = (cast this.requestHashMap.get(FileUploadData.getInstance().FILE_DATA) : FileItem);
            if (fileItem != null && fileItem.getSize() > 1) {
                this.fileName = HttpRequestUtil.getInstance().generateFileName(fileItem.getName());
                if (StringTools.endsWith(filePath, "/") || StringTools.endsWith(filePath, "\\")) {
                    filePath = filePath + this.fileName;
                }
                final file : AbFile = AbFile.createAbFile(URLGLOBALS.getWebappPath() + filePath);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                    final stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("Uploaded File: ");
                    stringBuffer.append(this.fileName);
                    stringBuffer.append(" New File: ");
                    stringBuffer.append(file.getPath());
                    this.logUtil.putF(stringBuffer.toString(), this, "saveFile()");
                }
                HttpFileUploadUtil.log(fileItem);
                final byteArray : haxe.ds.Vector<Int> = fileItem.get();
                if (file.isFile()) {
                    file.delete();
                    file.createNewFile();
                }
                fileOutputStream = AbFileOutputStream.createFromAbFile(file);
                fileOutputStream.write(byteArray);
            }
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            if (fileOutputStream != null) {
                fileOutputStream.close();
            }
        }
    }

    // throws ServletException, IOException
    public function doGet(request : HttpServletRequest, response : HttpServletResponse) : Void {
        this.processRequest(request, response);
    }

    // throws ServletException, IOException
    public function doPost(request : HttpServletRequest, response : HttpServletResponse) : Void {
        this.processRequest(request, response);
    }

    public function getServletInfo() : String {
        return "Upload Cloud Files";
    }

    public function new() {
        super();
    }
}

