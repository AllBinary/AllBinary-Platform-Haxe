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
package admin.taghelpers;

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import org.allbinary.logic.system.security.licensing.LicensingException;
//import javax.servlet.http.HttpServletRequest;

class AuthenticationRequestHelperFactory implements TagHelperFactoryInterface {
    private static final CLASSNAME : String = "admin.taghelpers.AuthenticationRequestHelper";
    private static final FACTORYNAME : String = "AuthenticationRequestHelperFactory";
    public function new() {
    }

    // throws LicensingException
    public function getInstance(hashMap : HashMap, pageContext : PageContext) : Any {
        return HelperFactory.getInstance(AuthenticationRequestHelperFactory.FACTORYNAME, AuthenticationRequestHelperFactory.CLASSNAME, hashMap, pageContext);
    }

    // throws LicensingException
    public function getInstance(hashMap : HashMap, httpServletRequest : HttpServletRequest) : Any {
        return HelperFactory.getInstance(AuthenticationRequestHelperFactory.FACTORYNAME, AuthenticationRequestHelperFactory.CLASSNAME, hashMap, httpServletRequest);
    }

}

