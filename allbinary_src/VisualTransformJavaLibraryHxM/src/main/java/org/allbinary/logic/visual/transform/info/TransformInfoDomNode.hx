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
package org.allbinary.logic.visual.transform.info;

import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.w3c.dom.Attr;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class TransformInfoDomNode {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var transformInfoInterface : TransformInfoInterface;
    private var mappedName : String;
    public function new(node : Node) {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Constructing TransformInfo From TransformInfoDomNode: " + node.getNodeName(), this, "TransformInfoDomNode(Node node)");
        }
        var transformInfoData : TransformInfoData = TransformInfoData.getInstance();
        var attributes : NamedNodeMap = node.getAttributes();
        var attrNode : Attr = (cast attributes.getNamedItem(transformInfoData.NAME) : Attr);
        var name : String = attrNode.getValue();
        var nodeList : NodeList = node.getChildNodes();
        if (nodeList.getLength() > 1) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Constructing Complete TransformInfo Node For: ");
                stringBuffer.append(name);
                stringBuffer.append(" with ");
                stringBuffer.appendint(Std.int(nodeList.getLength()));
                stringBuffer.append(" children");
                this.logUtil.putF(stringBuffer.toString(), this, "TransformInfoObjectConfigComponent(Node node)");
            }
            var objectFileNameNode : Node = DomSearchHelper.getNode(transformInfoData.OBJECTFILENAME, nodeList);
            var objectFileName : String = DomNodeHelper.getTextNodeValue(objectFileNameNode);
            var objectConfigFileNameNode : Node = DomSearchHelper.getNode(transformInfoData.OBJECTCONFIGFILENAME, nodeList);
            var objectConfigFileName : String = DomNodeHelper.getTextNodeValue(objectConfigFileNameNode);
            var templateFileNameNode : Node = DomSearchHelper.getNode(transformInfoData.TEMPLATEFILENAME, nodeList);
            var templateFileName : String = DomNodeHelper.getTextNodeValue(templateFileNameNode);
            var dataFileNameNode : Node = DomSearchHelper.getNode(transformInfoData.DATAFILENAME, nodeList);
            var dataFileName : String = DomNodeHelper.getTextNodeValue(dataFileNameNode);
            this.transformInfoInterface = (cast new TransformInfo(name, objectFileName, objectConfigFileName, templateFileName, dataFileName) : TransformInfoInterface);
        } else {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Constructing Partial TransformInfo Node For: ");
                stringBuffer.append(name);
                stringBuffer.append(" with ");
                stringBuffer.appendint(Std.int(nodeList.getLength()));
                stringBuffer.append(" children");
                this.logUtil.putF(stringBuffer.toString(), this, "TransformInfoObjectConfigComponent(Node node)");
            }
            this.transformInfoInterface = (cast new TransformInfo(name) : TransformInfoInterface);
        }
        var templateAttrNode : Attr = (cast attributes.getNamedItem(transformInfoData.MAPPED) : Attr);
        if (templateAttrNode != null) {
            this.mappedName = templateAttrNode.getValue();
        } else {
            this.mappedName = this.getTransformInfoInterface().getName();
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface) {
        this.transformInfoInterface = transformInfoInterface;
        this.mappedName = transformInfoInterface.getName();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, mappedName : String) {
        this.transformInfoInterface = transformInfoInterface;
        this.mappedName = mappedName;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(name : String, mappedName : String) {
        this.transformInfoInterface = new TransformInfo(name);
        this.mappedName = mappedName;
    }

    public function getTransformInfoInterface() : TransformInfoInterface {
        return this.transformInfoInterface;
    }

    public function getMappedName() : String {
        return this.mappedName;
    }

    public function getReplaceKey() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("<transform:component name=\"");
        stringBuffer.append("body");
        stringBuffer.append("\"/>");
        var key : String = stringBuffer.toString();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Component Key: " + key, this, "getReplaceKey()");
        }
        return key;
    }

}

