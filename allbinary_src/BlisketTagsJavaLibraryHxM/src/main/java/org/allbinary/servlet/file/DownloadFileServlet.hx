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
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.CloudStreamUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.servlet.BlisketServletUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class DownloadFileServlet extends HttpServlet {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final DOWNLOAD : String = "download";
    private final DEFAULT_BUFFER_SIZE : Int = 16384;
    // throws ServletException, IOException
    public function processRequest(request : HttpServletRequest, response : HttpServletResponse) : Void {
        var inputStream : InputStream = null;
        try {
            BlisketServletUtil.getInstance().init(request);
            var requestPath : String = request.getRequestURI();
            if (requestPath == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            var beginIndex : Int = requestPath.indexOf(this.DOWNLOAD);
            var filePath : String = StringUtil.getInstance().EMPTY_STRING;
            if (beginIndex >= 0) {
                filePath = requestPath.substring(beginIndex + this.DOWNLOAD.length);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
            var file : AbFile = AbFile.createAbFile(URLGLOBALS.getWebappPath() + filePath);
            if (!file.exists()) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            var hashMap : HashMap = StdUtil.getInstance().createHashMap();
            var authenticationHelper : AuthenticationHelper = (cast new AuthenticationHelperFactory().getInstance(hashMap, request) : AuthenticationHelper);
            if (authenticationHelper.isAuthenticated()) {
                if (AuthenticationHelperUtil.getInstance().isAuthorized(authenticationHelper, filePath)) {
                    inputStream = CloudStreamUtil.getInstance().getFile(file);
                    var contentType : String = getServletContext().getMimeType(file.getName());
                    if (contentType == null) {
                        contentType = "application/octet-stream";
                    }
                    response.reset();
                    response.setBufferSize(this.DEFAULT_BUFFER_SIZE);
                    response.setContentType(contentType);
                    response.setHeader("Content-Length", Std.string(file.length()));
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("attachment; filename=\"");
                    stringBuffer.append(file.getName());
                    stringBuffer.append(CommonSeps.getInstance().QUOTE);
                    response.setHeader("Content-Disposition", stringBuffer.toString());
                    StreamUtil.getInstance().get(inputStream, response.getOutputStream(), haxe.ds.Vector.fromArrayCopy([for (index in 0...16348) 0]));
                } else {
                    response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "You are not Authorized");
                }
            } else {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Please Login");
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "processRequest()", e);
            }
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            StreamUtil.getInstance().close(response.getOutputStream());
            if (!StreamUtil.getInstance().close(inputStream)) {
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
        return "Serves Up Cloud Files";
    }

    public function new() {
        super();
    }
}

