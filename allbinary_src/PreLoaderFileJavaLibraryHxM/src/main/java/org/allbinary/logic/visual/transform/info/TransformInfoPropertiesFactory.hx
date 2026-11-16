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
import org.allbinary.string.CommonLabels;
import org.w3c.dom.Attr;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class TransformInfoPropertiesFactory {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : TransformInfoPropertiesFactory = new TransformInfoPropertiesFactory();
    public static function getInstance() : TransformInfoPropertiesFactory {
        return TransformInfoPropertiesFactory.instance;
    }

    public function new() {
    }

    // throws Exception
    public function getInstanceFor(node : Node) : TransformInfoProperties {
        final transformInfoChildNodeList : NodeList = node.getChildNodes();
        final transformInfoData : TransformInfoData = TransformInfoData.getInstance();
        final attributes : NamedNodeMap = node.getAttributes();
        final attrNode : Attr = (cast attributes.getNamedItem(transformInfoData.NAME) : Attr);
        final name : String = attrNode.getValue();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstanceFor().VIEW)) {
            this.logUtil.putF(CommonLabels.getInstance().NEXT + " View Name: " + name, this, "toTransformInfoPropertiesHashMap()");
        }
        final labelNode : Node = DomSearchHelper.getNodeNoThrow(transformInfoData.LABEL, transformInfoChildNodeList);
        var label : String = DomNodeHelper.getTextNodesValue(labelNode);
        if (label == null) {
            label = name;
        }
        final descriptionNode : Node = DomSearchHelper.getNode(transformInfoData.DESCRIPTION, transformInfoChildNodeList);
        final description : String = DomNodeHelper.getTextNodesValue(descriptionNode);
        final objectFileNode : Node = DomSearchHelper.getNode(transformInfoData.OBJECTFILENAME, transformInfoChildNodeList);
        final objectFileName : String = DomNodeHelper.getTextNodeValue(objectFileNode);
        final objectConfigFileNode : Node = DomSearchHelper.getNode(transformInfoData.OBJECTCONFIGFILENAME, transformInfoChildNodeList);
        final objectConfigFileName : String = DomNodeHelper.getTextNodeValue(objectConfigFileNode);
        final templateFileNode : Node = DomSearchHelper.getNode(transformInfoData.TEMPLATEFILENAME, transformInfoChildNodeList);
        final templateFileName : String = DomNodeHelper.getTextNodeValue(templateFileNode);
        final transformInfoProperties : TransformInfoProperties = new TransformInfoProperties(name, label, description, objectFileName, objectConfigFileName, templateFileName);
        return transformInfoProperties;
    }

}

