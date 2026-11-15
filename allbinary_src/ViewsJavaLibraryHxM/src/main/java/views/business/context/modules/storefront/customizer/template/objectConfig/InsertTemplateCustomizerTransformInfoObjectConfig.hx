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
package views.business.context.modules.storefront.customizer.template.objectConfig;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoDomNodeView;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.TransformInfosData;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigData;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

class InsertTemplateCustomizerTransformInfoObjectConfig extends NoTemplateTransformInfoObjectConfig {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, document : Document) {
        super(transformInfoInterface, document);
        this.setDocument(this.generate(this.toXmlDoc()));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, name : String, type : String) {
        super(transformInfoInterface, name, type);
        this.setDocument(this.generate(this.toXmlDoc()));
    }

    // throws Exception
    public function set(aParentViewName : String) : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Setting: " + aParentViewName, this, "set()");
        }
        var document : Document = this.toXmlDoc();
        var parentComponentsNodeList : NodeList = document.getElementsByTagName(TransformInfosData.getInstance().NAME);
        if (parentComponentsNodeList != null && parentComponentsNodeList.getLength() > 0) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Replacing", this, "set()");
            }
            var componentNode : Node = parentComponentsNodeList.item(0).getChildNodes().item(0);
            if (componentNode != null) {
                document.removeChild(componentNode);
            }
            parentComponentsNodeList.item(0).appendChild(new TransformInfoDomNodeView(aParentViewName).toXmlNode(document));
        } else {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Setting", this, "set()");
            }
            var objectConfigNode : Node = document.getElementsByTagName(TransformInfoObjectConfigData.getInstance().NAME).item(0);
            var parentComponentsNode : Node = document.createElement(TransformInfosData.getInstance().NAME);
            objectConfigNode.appendChild(parentComponentsNode);
            var transformInfoDomNodeView : TransformInfoDomNodeView = new TransformInfoDomNodeView(aParentViewName);
            parentComponentsNode.appendChild(transformInfoDomNodeView.toXmlNode(document));
        }
    }

}

