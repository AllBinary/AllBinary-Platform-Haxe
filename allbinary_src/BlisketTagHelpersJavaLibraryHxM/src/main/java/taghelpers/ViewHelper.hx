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
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;
import org.allbinary.logic.visual.transform.TransformFactory;
import org.allbinary.logic.visual.transform.TransformInterface;
import org.allbinary.logic.visual.transform.data.TransformDocumentInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;

class ViewHelper implements TransformInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    private var componentInterface : TransformInterface;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        this.componentInterface = TransformFactory.getInstance().getInstance(this.abeClientInformation, hashMap, pageContext);
    }

    public var NO_TYPE : Int = 0;
    public function getTypeId() : Int {
        return this.NO_TYPE;
    }

    // throws Exception
    public function view() : String {
        try {
            return this.componentInterface.view();
        } catch (e : haxe.Exception) {
            var error : String = "Failed to View: ";
            if (this.componentInterface != null) {
                error += Type.getClassName(Type.getClass(this.componentInterface));
            } else {
                error += "Unknown";
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view()", e);
            }
            throw e;
        }
    }

    // throws Exception
    public function toXmlDoc() : Document {
        try {
            throw new haxe.Exception("Hmm: " + this.componentInterface.getTransformDocumentInterface().getDoc());
        } catch (e : haxe.Exception) {
            var error : String = "Failed to View: ";
            if (this.componentInterface != null) {
                error += Type.getClassName(Type.getClass(this.componentInterface));
            } else {
                error += "Unknown";
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view()", e);
            }
            throw e;
        }
    }

    public function getViewObject() : TransformInterface {
        return this.componentInterface;
    }

    // throws Exception
    public function getTransformInfoInterface() : TransformInfoInterface {
        return this.componentInterface.getTransformInfoInterface();
    }

    public function getTransformDocumentInterface() : TransformDocumentInterface {
        return null;
    }

    public function setTransformDocumentInterface(viewDocumentInterface : TransformDocumentInterface) : Void {
        return;
    }

}

