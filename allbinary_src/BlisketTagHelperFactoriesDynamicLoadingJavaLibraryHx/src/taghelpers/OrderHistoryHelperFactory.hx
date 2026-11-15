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
package taghelpers;

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import org.allbinary.logic.system.security.licensing.LicensingException;
import admin.taghelpers.HelperFactory;

class OrderHistoryHelperFactory {
    private static final CLASSNAME : String = "taghelpers.OrderHistoryHelper";
    private static final FACTORYNAME : String = "taghelpers.OrderHistoryHelperFactory";
    public function new() {
    }

    // throws LicensingException
    public static function getInstance(hashMap : HashMap, pageContext : PageContext) : Any {
        return HelperFactory.getInstance(FACTORYNAME, CLASSNAME, hashMap, pageContext);
    }

}

