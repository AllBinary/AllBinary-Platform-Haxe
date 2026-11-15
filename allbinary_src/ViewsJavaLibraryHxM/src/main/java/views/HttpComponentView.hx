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

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;
import org.allbinary.logic.visual.transform.BasicTransformer;
import org.allbinary.logic.visual.transform.TransformInterface;
import org.allbinary.logic.visual.transform.data.TransformDocumentInterface;
import org.allbinary.logic.visual.transform.data.TransformHttpRequestDocumentFactory;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpComposite;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class HttpComponentView extends TransformInfoHttpComposite implements TransformInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    private var domNodeInterfaceVector : BasicArrayList;
    private var transformDocumentInterface : TransformDocumentInterface = null;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("View Name: " + transformInfoInterface.getName(), this, this.commonStrings.CONSTRUCTOR);
        }
        this.domNodeInterfaceVector = new BasicArrayListD();
        this.setTransformDocumentInterface(TransformHttpRequestDocumentFactory.getInstance(this.getPageContext(), this.getWeblisketSession()));
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

    public function addDomNodeInterface(domNodeInterface : DomNodeInterface) : Void {
        this.domNodeInterfaceVector.add(domNodeInterface);
    }

    // throws Exception
    public function toXmlDoc() : Document {
        try {
            final size : Int = this.domNodeInterfaceVector.size();
            for (index in 0...size) {
                var domNodeInterface : DomNodeInterface = (cast this.domNodeInterfaceVector.get(index) : DomNodeInterface);
                this.transformDocumentInterface.getBaseNode().appendChild(domNodeInterface.toXmlNode(this.transformDocumentInterface.getDoc()));
            }
            return this.getTransformDocumentInterface().getDoc();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "toXmlDoc()", e);
            }
            throw e;
        }
    }

    // throws Exception
    public function getDoc() : Document {
        var document : Document = this.getTransformInfoInterface().getDataDocument();
        var node : Node = DomNodeHelper.getFirstChildElement(document);
        if (node != null) {
            var dataNode : Node = this.getTransformDocumentInterface().getDoc().importNode(node, true);
            if (dataNode != null) {
                this.getTransformDocumentInterface().getBaseNode().appendChild(dataNode);
            }
        }
        return this.getTransformDocumentInterface().getDoc();
    }

    // throws Exception
    public function view() : String {
        try {
            this.toXmlDoc();
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

