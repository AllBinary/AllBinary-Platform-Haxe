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
package servlet.request;

//import java.io.*;
//import java.net.*;
//import javax.servlet.*;
//import javax.servlet.http.*;
import org.allbinary.logic.system.security.licensing.LicensingException;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.workflow.WorkFlowInterface;
import org.allbinary.logic.control.workflow.RequestWorkFlowFactory;

class RequestHandler extends HttpServlet {
    public final logUtil : LogUtil = LogUtil.getInstance();
    // throws ServletException
    public function init(config : ServletConfig) : Void {
        super.init(config);
    }

    public function destroy() : Void {
    }

    // throws ServletException, IOException
    public function processRequest(request : HttpServletRequest, response : HttpServletResponse) : Void {
        try {
            response.setContentType("text/html");
            var out : PrintWriter = response.getWriter();
            var workflowInterface : WorkFlowInterface = RequestWorkFlowFactory.getInstance((cast request : ServletRequest), (cast response : ServletResponse), this.getServletConfig(), this.getServletContext());
            if (workflowInterface != null) {
                out.print(workflowInterface.process());
            }
            out.flush();
            out.close();
        } catch (e : LicensingException) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SERVLETERROR)) {
                this.logUtil.put("Servlet LicensingException", this, "processRequest()", e);
            }
            response.sendRedirect(abcs.globals.URLGLOBALS.LICENSEERRORPAGE);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SERVLETERROR)) {
                this.logUtil.put("Servlet Exception", this, "processRequest()", e);
            }
            response.sendRedirect(abcs.globals.URLGLOBALS.ERRORPAGE);
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
        return "WorkFlow Request Handler";
    }

    public function new() {
        super();
    }
}

