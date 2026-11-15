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
package org.allbinary.servlet;

//import java.io.ByteArrayOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.CloudStreamUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.string.CommonStrings;

class MagicalImageServlet extends HttpServlet {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    // throws ServletException, IOException
    public function processRequest(request : HttpServletRequest, response : HttpServletResponse) : Void {
        var inputStream : InputStream = null;
        try {
            BlisketServletUtil.getInstance().init(request);
            final requestURI : String = request.getRequestURI();
            final file : AbFile = AbFile.createAbFile(URLGLOBALS.getWebappPath() + requestURI);
            inputStream = CloudStreamUtil.getInstance().getFileAnyWhere(file);
            final outputStream : ByteArrayOutputStream = new ByteArrayOutputStream(8000);
            final byteArray : haxe.ds.Vector<Int> = StreamUtil.getInstance().getByteArray(inputStream, outputStream, haxe.ds.Vector.fromArrayCopy([for (index in 0...16384) 0]));
            response.setContentType("image/jpeg;charset=utf-8");
            response.getOutputStream().write(byteArray);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "processRequest()", e);
            }
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            StreamUtil.getInstance().close(response.getOutputStream());
            if (!StreamUtil.getInstance().close(inputStream)) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
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
        return "Serves Up Image From Local or Cloud";
    }

    public function new() {
        super();
    }
}

