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
package org.allbinary.logic.visual.transform.info.objectConfig;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.InputOutputTypeData;
import org.allbinary.logic.io.OutputTypeData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.info.TransformInfoData;
import org.allbinary.logic.visual.transform.info.TransformInfoDomNode;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.TransformInfosData;
import org.allbinary.logic.visual.transform.template.XslData;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class TransformInfoObjectConfig implements TransformInfoObjectConfigInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final ownerTransformInfoInterface : TransformInfoInterface;
    private var document : Document;
    private var outputTypeName : String = null;
    public function new(transformInfoInterface : TransformInfoInterface) {
        this.ownerTransformInfoInterface = transformInfoInterface;
        this.createDocument();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("TransformInfo: ");
            if (this.ownerTransformInfoInterface != null) {
                stringBuffer.append(this.ownerTransformInfoInterface.getName());
            } else {
                stringBuffer.append("No Owner!?#@");
            }
            stringBuffer.append("\nConstructed with document: ");
            stringBuffer.append(this.toString());
            this.logUtil.putF(stringBuffer.toString(), this, "Constructor(TransformInfoInterface)");
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, document : Document) {
        this.ownerTransformInfoInterface = transformInfoInterface;
        this.document = document;
        var node : Node = DomSearchHelper.getNodeNoThrow(OutputTypeData.getInstance().NAME, this.getRootNode().getChildNodes());
        if (node != null) {
            this.setOutputTypeName(DomNodeHelper.getTextNodeValue(node));
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("TransformInfo: ");
            if (this.ownerTransformInfoInterface != null) {
                stringBuffer.append(this.ownerTransformInfoInterface.getName());
            } else {
                stringBuffer.append("No Owner!?#@");
            }
            stringBuffer.append("\nConstructed with document: ");
            stringBuffer.append(this.toString());
            this.logUtil.putF(stringBuffer.toString(), this, "Constructor(TransformInfoInterface, Document)");
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, name : String, type : String) {
        this.ownerTransformInfoInterface = transformInfoInterface;
        this.createDocument();
        var configNameAttr : Attr = this.document.createAttribute(TransformInfoObjectConfigData.getInstance().NAME);
        configNameAttr.setValue(name);
        var objectConfigNode : Node = this.document.getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME).item(0);
        objectConfigNode.appendChild(configNameAttr);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("TransformInfo: ");
            if (this.ownerTransformInfoInterface != null) {
                stringBuffer.append(this.ownerTransformInfoInterface.getName());
            } else {
                stringBuffer.append("No Owner!?#@");
            }
            stringBuffer.append("\nConstructed with document: ");
            stringBuffer.append(this.toString());
            this.logUtil.putF(stringBuffer.toString(), this, "Constructor(TransformInfoInterface, name, type)");
        }
    }

    private function createDocument() : Void {
        this.document = DomDocumentHelper.create();
        var objectConfigNode : Node = this.document.createElement(TransformInfoObjectConfigData.getInstance().NAME);
        this.document.appendChild(objectConfigNode);
    }

    public function getTransformInfoInterface() : TransformInfoInterface {
        return this.ownerTransformInfoInterface;
    }

    // throws Exception
    public function toXmlDoc() : Document {
        return this.document;
    }

    public function setDocument(document : Document) : Void {
        this.document = document;
    }

    public function containsView(transformInfoInterface : TransformInfoInterface) : Bool {
        var objectConfigNode : Node = this.document.getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME).item(0);
        var viewNodeList : NodeList = objectConfigNode.getChildNodes();
        var numberOfViews : Int = viewNodeList.getLength();
        for (index in 0...numberOfViews) {
            var viewNode : Node = viewNodeList.item(index);
            var viewAttributes : NamedNodeMap = viewNode.getAttributes();
            var attrNode : Attr = (cast viewAttributes.getNamedItem(TransformInfoData.getInstance().NAME) : Attr);
            if (transformInfoInterface.getName().compareTo(attrNode.getValue()) == 0) {
                return true;
            }
        }
        return false;
    }

    // throws Exception
    private function getTemplateAttributes() : NamedNodeMap {
        var componentNode : Node = this.document.getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME).item(0);
        return componentNode.getAttributes();
    }

    // throws Exception
    public function getName() : String {
        var attrNode : Attr = (cast this.getTemplateAttributes().getNamedItem(TransformInfoObjectConfigData.getInstance().NAME) : Attr);
        return attrNode.getValue();
    }

    // throws Exception
    public function setName(name : String) : Void {
        var attrNode : Attr = (cast this.getTemplateAttributes().getNamedItem(TransformInfoObjectConfigData.getInstance().NAME) : Attr);
        attrNode.setValue(name);
    }

    // throws Exception
    private function getNodeVector(nodeName : String) : BasicArrayList {
        var componentsNodeList : NodeList = this.document.getElementsByTagName(nodeName);
        if (componentsNodeList != null && componentsNodeList.getLength() > 0) {
            var viewNodeVector : BasicArrayList = DomSearchHelper.getAllNodes(TransformInfoData.getInstance().NAME, componentsNodeList.item(0).getChildNodes());
            var numberOfViews : Int = viewNodeVector.size();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Number Of ");
                stringBuffer.append(nodeName);
                stringBuffer.append(" Nodes: ");
                stringBuffer.appendint(numberOfViews);
                this.logUtil.putF(stringBuffer.toString(), this, "getNodeVector(nodename)");
            }
            return viewNodeVector;
        }
        return new BasicArrayListD();
    }

    // throws Exception
    private function getTransformDomNodes(nodeName : String) : BasicArrayList {
        var viewVector : BasicArrayList = new BasicArrayListD();
        var viewNodeVector : BasicArrayList = this.getNodeVector(nodeName);
        final size : Int = viewNodeVector.size();
        for (index in 0...size) {
            var viewNode : Node = (cast viewNodeVector.get(index) : Node);
            viewVector.add(new TransformInfoDomNode(viewNode));
        }
        return viewVector;
    }

    // throws Exception
    public function getTransforms(nodeName : String) : BasicArrayList {
        var viewVector : BasicArrayList = new BasicArrayListD();
        var viewNodeVector : BasicArrayList = this.getNodeVector(nodeName);
        final size : Int = viewNodeVector.size();
        for (index in 0...size) {
            var viewNode : Node = (cast viewNodeVector.get(index) : Node);
            viewVector.add(new TransformInfoDomNode(viewNode).getTransformInfoInterface());
        }
        return viewVector;
    }

    // throws Exception
    public function getTransformsGroup(group : String) : BasicArrayList {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Started: " + group, this, "getTransformsGroup()");
        }
        var viewVector : BasicArrayList = new BasicArrayListD();
        final GROUP : String = TransformInfosData.getInstance().GROUP;
        var componentsNodeList : NodeList = this.document.getElementsByTagName(GROUP);
        if (componentsNodeList != null && componentsNodeList.getLength() > 0) {
            var componentsNode : Node = componentsNodeList.item(0);
            var length : Int = componentsNodeList.getLength();
            for (index in 0...length) {
                var node : Node = componentsNodeList.item(index);
                var attributes : NamedNodeMap = node.getAttributes();
                var attrNode : Attr = (cast attributes.getNamedItem(GROUP) : Attr);
                var value : String = attrNode.getValue();
                if (Reflect.compare(value, group) == 0) {
                    componentsNode = node;
                    break;
                }
            }
            var viewNodeVector : BasicArrayList = DomSearchHelper.getAllNodes(TransformInfoData.getInstance().NAME, componentsNode.getChildNodes());
            var numberOfViews : Int = viewNodeVector.size();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Number Of Nodes: " + numberOfViews, this, "getTransformsGroup()");
            }
            final size : Int = viewNodeVector.size();
            for (index in 0...size) {
                var viewNode : Node = (cast viewNodeVector.get(index) : Node);
                viewVector.add(new TransformInfoDomNode(viewNode));
            }
        } else {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                if (componentsNodeList == null) {
                    this.logUtil.putF("Number Of Nodes: NULL", this, "getTransformsGroup()");
                } else {
                    this.logUtil.putF("Number Of Nodes: 0", this, "getTransformsGroup()");
                }
            }
        }
        return viewVector;
    }

    // throws Exception
    public function getTransformDomNodes() : BasicArrayList {
        return this.getTransformDomNodes(TransformInfosData.getInstance().GROUP);
    }

    // throws Exception
    public function getTransforms() : BasicArrayList {
        return this.getTransforms(TransformInfosData.getInstance().NAME);
    }

    // throws Exception
    public function getGroupTransforms() : BasicArrayList {
        return this.getTransforms(TransformInfosData.getInstance().GROUP);
    }

    // throws Exception
    public function getParentTransforms() : BasicArrayList {
        return this.getTransforms(TransformInfoData.getInstance().PARENT);
    }

    private function getRootNode() : Node {
        return this.document.getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME).item(0);
    }

    public function setOutputTypeName(outputTypeName : String) : Void {
        this.outputTypeName = outputTypeName;
    }

    // throws Exception
    public function getOutputTypeName() : String {
        return this.outputTypeName;
    }

    // throws Exception
    public function getInputOutputTypeName() : String {
        var node : Node = DomSearchHelper.getNode(InputOutputTypeData.getInstance().NAME, this.getRootNode().getChildNodes());
        return DomNodeHelper.getTextNodeValue(node);
    }

    // throws Exception
    public function getInputOutputTypeFile() : String {
        var node : Node = DomSearchHelper.getNode(InputOutputTypeData.getInstance().FILE, this.getRootNode().getChildNodes());
        return DomNodeHelper.getTextNodeValue(node);
    }

    // throws Exception
    public function getImportUriPath() : String {
        var node : Node = DomSearchHelper.getNode(XslData.getInstance().ROOT_IMPORT_URI, this.getRootNode().getChildNodes());
        return DomNodeHelper.getTextNodeValue(node);
    }

    public function toString() : String {
        try {
            if (this.document != null) {
                return XmlDocumentHelper.toString(this.document);
            } else {
                return null;
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.putF("DOM Document error", this, this.commonStrings.TOSTRING);
            }
            return null;
        }
    }

}

