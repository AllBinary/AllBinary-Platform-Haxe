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
package views.business.context.modules.storefront.customizer.generic.page;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.data.tables.transform.info.TransformInfoEntity;
import org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.info.TransformInfo;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface;
import org.allbinary.logic.visual.transform.template.customizer.page.PageValidation;
import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.customizer.CustomizerUtil;

class PageValidationView extends PageView implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("View Name: " + transformInfoInterface.getName(), this, "PageViewValidation()");
        }
    }

    public function isValid() : Null<Bool> {
        try {
            var isValid : Null<Bool> = true;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.IS_VALID);
            }
            var transformInfoEntityInterface : TransformInfoEntity = TransformInfoEntityBuilder.getInstance();
            var pageObjectConfigInterface : TransformInfoObjectConfigInterface = this.getTransformInfoInterface().getObjectConfigInterface();
            var allViewsToBeModifiedVector : BasicArrayList = pageObjectConfigInterface.getGroupTransforms();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Views To Be Modified: " + allViewsToBeModifiedVector.size(), this, "get(transformInfoInterface)");
            }
            final size : Int = allViewsToBeModifiedVector.size();
            for (index in 0...size) {
                var transformInfoInterface : TransformInfo = (cast allViewsToBeModifiedVector.get(index) : TransformInfo);
                var viewNameOfViewToBeModified : String = transformInfoInterface.getName();
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append(this.getTransformInfoInterface().getName());
                    stringBuffer.append(" is modifying view: ");
                    stringBuffer.append(viewNameOfViewToBeModified);
                    this.logUtil.putF(stringBuffer.toString(), this, "insert()");
                }
                var httpTransformInfoInterface : TransformInfoHttpInterface = (cast this.getTransformInfoInterface() : TransformInfoHttpInterface);
                var specifiedTransformInfoInterface : TransformInfoInterface = transformInfoEntityInterface.get(viewNameOfViewToBeModified, httpTransformInfoInterface.getPropertiesHashMap(), httpTransformInfoInterface.getPageContext());
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append(this.getTransformInfoInterface().getName());
                    stringBuffer.append(" is adding data to view: ");
                    stringBuffer.append(viewNameOfViewToBeModified);
                    this.logUtil.putF(stringBuffer.toString(), this, "insert()");
                }
                var hashMap : HashMap = StdUtil.getInstance().createHashMap();
                var title : String = specifiedTransformInfoInterface.getName().substring(this.getTransformInfoInterface().getStoreName().length());
                if (Reflect.compare(title, "index") == 0) {
                    hashMap.put(TitleData.getInstance().TEXT, this.getTransformInfoInterface().getStoreName() + " - Home Page");
                } else {
                    hashMap.put(TitleData.getInstance().TEXT, this.getTransformInfoInterface().getStoreName() + " -" + title);
                }
                var pageValidation : PageValidation = new PageValidation(hashMap);
                if (pageValidation.isValid() == false) {
                    isValid = false;
                }
                if (isValid == true) {
                    var document : Document = DomDocumentHelper.create();
                    document.appendChild(pageValidation.toXmlNode(document));
                    var documentString : String = XmlDocumentHelper.toString(document);
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                        var stringBuffer : StringMaker = new StringMaker();
                        stringBuffer.append(viewNameOfViewToBeModified);
                        stringBuffer.append(" is changing data in ");
                        stringBuffer.append(specifiedTransformInfoInterface.getDataFilePath().toString());
                        stringBuffer.append(" to the following data:\n");
                        stringBuffer.append(documentString);
                        this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.IS_VALID);
                    }
                    CustomizerUtil.getInstance().write(specifiedTransformInfoInterface, documentString);
                }
            }
            return isValid;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to validate", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            var transformInfoEntityInterface : TransformInfoEntity = TransformInfoEntityBuilder.getInstance();
            var objectConfig : TransformInfoObjectConfigInterface = this.getTransformInfoInterface().getObjectConfigInterface();
            var httpTransformInfoInterface : TransformInfoHttpInterface = (cast this.getTransformInfoInterface() : TransformInfoHttpInterface);
            var allViewsToBeModifiedVector : BasicArrayList = objectConfig.getGroupTransforms();
            final size : Int = allViewsToBeModifiedVector.size();
            for (index in 0...size) {
                var transformInfoInterface : TransformInfo = (cast allViewsToBeModifiedVector.get(index) : TransformInfo);
                var viewNameOfViewToBeModified : String = transformInfoInterface.getName();
                var specifiedTransformInfoInterface : TransformInfoInterface = transformInfoEntityInterface.get(viewNameOfViewToBeModified, httpTransformInfoInterface.getPropertiesHashMap(), httpTransformInfoInterface.getPageContext());
                var hashMap : HashMap = StdUtil.getInstance().createHashMap();
                var title : String = specifiedTransformInfoInterface.getName().substring(this.getTransformInfoInterface().getStoreName().length());
                if (Reflect.compare(title, "index") == 0) {
                    hashMap.put(TitleData.getInstance().TEXT, this.getTransformInfoInterface().getStoreName() + " - Home Page");
                } else {
                    hashMap.put(TitleData.getInstance().TEXT, this.getTransformInfoInterface().getStoreName() + " -" + title);
                }
                var pageValidation : PageValidation = new PageValidation(hashMap);
                if (pageValidation.isValid() == false) {
                    stringBuffer.append("TransformInfo Name for PageValidation:" + specifiedTransformInfoInterface.getName());
                    stringBuffer.append("PageValidation:" + hashMap);
                    stringBuffer.append("PageValidation Info:" + pageValidation.validationInfo());
                }
            }
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "An auto generated page name was invalid.";
        }
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

}

