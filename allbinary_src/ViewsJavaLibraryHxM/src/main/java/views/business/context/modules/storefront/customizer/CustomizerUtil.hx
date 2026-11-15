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
package views.business.context.modules.storefront.customizer;

import org.allbinary.util.BasicArrayList;
import org.allbinary.data.tables.transform.info.TransformInfoEntity;
import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.info.TransformInfo;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface;
import org.w3c.dom.Document;

class CustomizerUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : CustomizerUtil = new CustomizerUtil();
    public static function getInstance() : CustomizerUtil {
        return CustomizerUtil.instance;
    }

    public function new() {
    }

    // throws Exception
    public function getTransformInfoInterfaceToCustomize(customizerTransformInfoInterface : TransformInfoInterface, transformInfoInterface : TransformInfoInterface) : TransformInfoInterface {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("View Name: " + customizerTransformInfoInterface.getName(), this, "getTransformInfoInterfaceToCustomize()");
        }
        var transformInfoEntityInterface : TransformInfoEntity = TransformInfoEntityBuilder.getInstance();
        var viewName : String = transformInfoInterface.getName();
        var httpTransformInfoInterface : TransformInfoHttpInterface = (cast customizerTransformInfoInterface : TransformInfoHttpInterface);
        var customizedTransformInfoInterface : TransformInfoInterface = transformInfoEntityInterface.get(viewName, httpTransformInfoInterface.getPropertiesHashMap(), httpTransformInfoInterface.getPageContext());
        return customizedTransformInfoInterface;
    }

    // throws Exception
    public function getTransformInfoObjectConfigComponentNodesToCustomize(customizerTransformInfoInterface : TransformInfoInterface, transformInfoInterface : TransformInfoInterface) : BasicArrayList {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("View Name: " + customizerTransformInfoInterface.getName(), this, "getTransformInfoObjectConfigComponentNodesToCustomize()");
        }
        var transformInfoEntityInterface : TransformInfoEntity = TransformInfoEntityBuilder.getInstance();
        var viewName : String = transformInfoInterface.getName();
        var httpTransformInfoInterface : TransformInfoHttpInterface = (cast customizerTransformInfoInterface : TransformInfoHttpInterface);
        var customizedTransformInfoInterface : TransformInfoInterface = transformInfoEntityInterface.get(viewName, httpTransformInfoInterface.getPropertiesHashMap(), httpTransformInfoInterface.getPageContext());
        return this.getTransformInfoObjectConfigComponentNodes(customizedTransformInfoInterface);
    }

    // throws Exception
    public function getTransformInfoObjectConfigComponentNodes(transformInfoInterface : TransformInfoInterface) : BasicArrayList {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("View Name: " + transformInfoInterface.getName(), this, "getTransformInfoObjectConfigComponentNodes()");
        }
        var transformInfoObjectConfigInterface : TransformInfoObjectConfigInterface = transformInfoInterface.getObjectConfigInterface();
        return transformInfoObjectConfigInterface.getTransforms();
    }

    // throws Exception
    public function getTransformInfoObjectConfigGroupComponentNodes(transformInfoInterface : TransformInfoInterface) : BasicArrayList {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("View Name: " + transformInfoInterface.getName(), this, "getTransformInfoObjectConfigComponentNodes()");
        }
        var transformInfoObjectConfigInterface : TransformInfoObjectConfigInterface = transformInfoInterface.getObjectConfigInterface();
        return transformInfoObjectConfigInterface.getGroupTransforms();
    }

    // throws Exception
    public function insert(transformInfoInterface : TransformInfoInterface, domNodeInterface : DomNodeInterface) : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("View Name: " + transformInfoInterface.getName(), this, "insert()");
        }
        var transformInfoEntityInterface : TransformInfoEntity = TransformInfoEntityBuilder.getInstance();
        var allViewsToBeModified : BasicArrayList = this.getTransformInfoObjectConfigGroupComponentNodes(transformInfoInterface);
        var document : Document = DomDocumentHelper.create();
        document.appendChild(domNodeInterface.toXmlNode(document));
        var documentString : String = XmlDocumentHelper.toString(document);
        var stringBuffer : StringMaker = new StringMaker();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            stringBuffer.append("Total Views For Modification: ");
            stringBuffer.appendint(allViewsToBeModified.size());
            stringBuffer.append(" New Xml/Data: ");
            stringBuffer.append(documentString);
            this.logUtil.putF(stringBuffer.toString(), this, "insert()");
        }
        transformInfoInterface.setData(documentString);
        final size : Int = allViewsToBeModified.size();
        for (index in 0...size) {
            var transformInfo : TransformInfo = (cast allViewsToBeModified.get(index) : TransformInfo);
            var viewNameOfViewToBeModified : String = transformInfo.getName();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append(transformInfoInterface.getName());
                stringBuffer.append(" is modifying view: ");
                stringBuffer.append(viewNameOfViewToBeModified);
                this.logUtil.putF(stringBuffer.toString(), this, "insert()");
            }
            var httpTransformInfoInterface : TransformInfoHttpInterface = (cast transformInfoInterface : TransformInfoHttpInterface);
            var specifiedTransformInfoInterface : TransformInfoInterface = transformInfoEntityInterface.get(viewNameOfViewToBeModified, httpTransformInfoInterface.getPropertiesHashMap(), httpTransformInfoInterface.getPageContext());
            if (specifiedTransformInfoInterface == null) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    stringBuffer.delete(0, stringBuffer.length());
                    stringBuffer.append(transformInfoInterface.getName());
                    stringBuffer.append(" is unable to add data to view: ");
                    stringBuffer.append(viewNameOfViewToBeModified);
                    stringBuffer.append(" since it does not exist");
                    this.logUtil.putF(stringBuffer.toString(), this, "insert()");
                }
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF(transformInfoInterface.getName() + " is adding data to view: " + viewNameOfViewToBeModified, this, "insert()");
                }
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    stringBuffer.delete(0, stringBuffer.length());
                    stringBuffer.append(viewNameOfViewToBeModified);
                    stringBuffer.append(" is changing data in ");
                    stringBuffer.append(specifiedTransformInfoInterface.getDataFilePath().toString());
                    stringBuffer.append(" to the following data:\n");
                    stringBuffer.append(documentString);
                    this.logUtil.putF(stringBuffer.toString(), this, "insert()");
                }
                this.write(specifiedTransformInfoInterface, documentString);
            }
        }
    }

    // throws Exception
    public function write(specifiedTransformInfoInterface : TransformInfoInterface, documentString : String) : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("View Name: " + specifiedTransformInfoInterface.getName(), this, "write()");
        }
        var transformInfoEntityInterface : TransformInfoEntity = TransformInfoEntityBuilder.getInstance();
        specifiedTransformInfoInterface.setData(documentString);
        transformInfoEntityInterface.update(specifiedTransformInfoInterface.toHashMap());
    }

    // throws Exception
    public function getViewDataForComponentsInObjectConfig(transformInfoInterface : TransformInfoInterface) : Document {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("View Name: " + transformInfoInterface.getName(), this, "getViewDataForComponentsInObjectConfig()");
        }
        var transformInfoObjectConfigInterface : TransformInfoObjectConfigInterface = transformInfoInterface.getObjectConfigInterface();
        var allViewsToBeModified : BasicArrayList = transformInfoObjectConfigInterface.getGroupTransforms();
        var transformInfoEntityInterface : TransformInfoEntity = TransformInfoEntityBuilder.getInstance();
        final size : Int = allViewsToBeModified.size();
        for (index in 0...size) {
            var nextTransformInfoInterface : TransformInfo = (cast allViewsToBeModified.get(index) : TransformInfo);
            var viewNameOfViewToBeModified : String = nextTransformInfoInterface.getName();
            var httpTransformInfoInterface : TransformInfoHttpInterface = (cast transformInfoInterface : TransformInfoHttpInterface);
            var specifiedTransformInfoInterface : TransformInfoInterface = transformInfoEntityInterface.get(viewNameOfViewToBeModified, httpTransformInfoInterface.getPropertiesHashMap(), httpTransformInfoInterface.getPageContext());
            return specifiedTransformInfoInterface.getDataDocument();
        }
        throw new haxe.Exception("No Components Specified in ObjectConfig");
    }

}

