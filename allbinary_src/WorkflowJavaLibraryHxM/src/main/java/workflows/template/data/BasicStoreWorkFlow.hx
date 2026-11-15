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
package workflows.template.data;

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.logic.control.workflow.StoreWorkFlowInterface;

class BasicStoreWorkFlow extends BasicWorkFlow implements StoreWorkFlowInterface {
    public function new(propertiesHashMap : HashMap, pageContext : PageContext) {
        super(propertiesHashMap, pageContext);
    }

    // throws Exception
    public function getStoreName() : String {
        return (cast this.getPropertiesHashMap().get(StoreFrontData.getInstance().NAME) : String);
    }

}

