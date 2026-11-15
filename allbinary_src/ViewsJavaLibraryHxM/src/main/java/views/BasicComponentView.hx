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
package views;

import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;
import org.allbinary.logic.visual.transform.BasicTransformer;
import org.allbinary.logic.visual.transform.TransformInterface;
import org.allbinary.logic.visual.transform.data.TransformDocumentFactory;
import org.allbinary.logic.visual.transform.data.TransformDocumentInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class BasicComponentView implements TransformInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    private var transformDocumentInterface : TransformDocumentInterface = null;
    private var transformInfoInterface : TransformInfoInterface = null;
    public function new(transformInfoInterface : TransformInfoInterface) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("View Name: " + transformInfoInterface.getName(), this, this.commonStrings.CONSTRUCTOR);
        }
        this.setTransformInfoInterface(transformInfoInterface);
        this.setTransformDocumentInterface(TransformDocumentFactory.getInstance());
    }

    public var NO_TYPE : Int = 0;
    public function getTypeId() : Int {
        return this.NO_TYPE;
    }

    public function getTransformDocumentInterface() : TransformDocumentInterface {
        return this.transformDocumentInterface;
    }

    public function setTransformDocumentInterface(transformDocumentInterface : TransformDocumentInterface) : Void {
        this.transformDocumentInterface = transformDocumentInterface;
    }

    public function getTransformInfoInterface() : TransformInfoInterface {
        return this.transformInfoInterface;
    }

    public function setTransformInfoInterface(transformInfoInterface : TransformInfoInterface) : Void {
        this.transformInfoInterface = transformInfoInterface;
    }

    public function toXmlDoc() : Document {
        return this.transformDocumentInterface.getDoc();
    }

    // throws Exception
    public function getDoc() : Document {
        var document : Document = this.getTransformInfoInterface().getDataDocument();
        var dataNode : Node = this.getTransformDocumentInterface().getDoc().importNode(document.getFirstChild(), true);
        if (dataNode != null) {
            this.getTransformDocumentInterface().getBaseNode().appendChild(dataNode);
        }
        return this.getTransformDocumentInterface().getDoc();
    }

    // throws Exception
    public function view() : String {
        try {
            var success : String = XmlDocumentHelper.toString(this.getDoc());
            var result : String = new BasicTransformer(this.abeClientInformation, this.getTransformInfoInterface()).translate(success);
            return result;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view()", e);
            }
            throw e;
        }
    }

}

