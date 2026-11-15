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
import org.allbinary.logic.visual.transform.info.TransformInfoHttpFactory;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface;
import views.admin.payment.PaymentProcessorComponent;

class PaymentProcessHelper extends TagHelper {
    private var paymentProcessorComponent : PaymentProcessorComponent;
    public function new(propertiesHashMap : HashMap, pageContext : PageContext) {
        super();
        var transformInfoInterface : TransformInfoHttpInterface = (cast TransformInfoHttpFactory.getInstance(propertiesHashMap, pageContext) : TransformInfoHttpInterface);
        this.paymentProcessorComponent = new PaymentProcessorComponent(transformInfoInterface);
    }

    // throws Exception
    public function process() : String {
        return this.paymentProcessorComponent.view();
    }

}

