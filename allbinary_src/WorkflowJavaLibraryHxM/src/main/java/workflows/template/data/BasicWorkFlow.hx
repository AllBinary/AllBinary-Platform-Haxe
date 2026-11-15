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
//import javax.servlet.jsp.tagext.TagSupport;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.control.workflow.WorkFlowData;
import org.allbinary.logic.control.workflow.WorkFlowInterface;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;
import org.allbinary.logic.visual.transform.TransformFactory;
import org.allbinary.string.CommonStrings;

class BasicWorkFlow implements WorkFlowInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    private var validationDomNodeInterface : ValidationComponentInterface;
    private var propertiesHashMap : HashMap;
    private var pageContext : PageContext;
    public function new(propertiesHashMap : HashMap, pageContext : PageContext) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().WORKFLOW)) {
            this.logUtil.putF("Properties: " + Std.string(propertiesHashMap), this, "BasicWorkFlow()");
        }
        this.propertiesHashMap = propertiesHashMap;
        this.pageContext = pageContext;
        this.validationDomNodeInterface = (cast TransformFactory.getInstance().getInstance(this.abeClientInformation, propertiesHashMap, pageContext) : ValidationComponentInterface);
    }

    // throws Exception
    public function getName() : String {
        return (cast this.getPropertiesHashMap().get(WorkFlowData.getInstance().NAME) : String);
    }

    public function getPropertiesHashMap() : HashMap {
        return this.propertiesHashMap;
    }

    public function getPageContext() : PageContext {
        return this.pageContext;
    }

    // throws Exception
    public function process() : Null<Int> {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().WORKFLOW)) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.PROCESS);
        }
        if (this.validationDomNodeInterface.isValid()) {
            this.pageContext.getOut().print(this.validationDomNodeInterface.view());
            return Std.string(TagSupport.EVAL_BODY_INCLUDE);
        } else {
            this.pageContext.getOut().print(this.validationDomNodeInterface.validationInfo());
            return Std.string(TagSupport.SKIP_BODY);
        }
    }

}

