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
package org.allbinary.logic.control.workflow;

//import java.util.HashMap;
//import javax.servlet.ServletConfig;
//import javax.servlet.ServletContext;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.data.tables.workflow.WorkFlowEntityFactory;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.system.security.licensing.LicensingException;

class RequestWorkFlowFactory {
    public function new() {
    }

    // throws Exception, LicensingException
    public static function getInstance(request : ServletRequest, response : ServletResponse, servletConfig : ServletConfig, servletContext : ServletContext) : WorkFlowInterface {
        var httpRequest : HttpServletRequest = (cast request : HttpServletRequest);
        var requestCommand : String = httpRequest.getPathInfo();
        var index : Int = requestCommand.indexOf(AbPathData.getInstance().SEPARATOR);
        var storeName : String = requestCommand.substring(0, index);
        var requestName : String = requestCommand.substring(index, requestCommand.length);
        return WorkFlowEntityFactory.getInstance().create2().get(requestName, storeName);
    }

    // throws Exception, LicensingException
    public static function getInstance(hashMap : HashMap, pageContext : PageContext) : WorkFlowInterface {
        var workFlowName : String = (cast pageContext.getRequest().getParameter(WorkFlowData.getInstance().NAME) : String);
        var weblisketSession : WeblisketSession = new WeblisketSession(hashMap, pageContext);
        var storeName : String = weblisketSession.getStoreName();
        return WorkFlowEntityFactory.getInstance().create2().get(workFlowName, storeName);
    }

}

