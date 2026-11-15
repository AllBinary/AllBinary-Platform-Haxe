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
package views.business.context.modules.storefront.customizer.includes.style.theme;

import org.allbinary.business.category.CategoryFactoryInterface;
import org.allbinary.business.category.CategoryInterface;
import org.allbinary.business.category.store.theme.StoreThemeCategoryFactory;
import org.allbinary.business.category.store.theme.StoreThemeCategoryInterface;
import org.allbinary.business.category.store.theme.StoreThemeCategoryPathValidationView;
import org.allbinary.data.tree.category.CategoryLoaderFactory;
import org.allbinary.data.tree.category.CategoryLoaderInterface;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class EditThemeValidationView extends ThemeCustomizerView implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    public function isValid() : Null<Bool> {
        try {
            var isValid : Null<Bool> = true;
            var categoryFactoryInterface : CategoryFactoryInterface = new StoreThemeCategoryFactory(this.getTransformInfoInterface());
            var categoryLoaderInterface : CategoryLoaderInterface = CategoryLoaderFactory.getInstance(categoryFactoryInterface);
            var rootStoreThemeCategoryInterface : StoreThemeCategoryInterface = (cast categoryFactoryInterface.getRootInstance() : StoreThemeCategoryInterface);
            var storeThemeCategoryInterface : StoreThemeCategoryInterface = (cast categoryLoaderInterface.getAll((cast rootStoreThemeCategoryInterface : CategoryInterface)) : StoreThemeCategoryInterface);
            this.validationInterface = new StoreThemeCategoryPathValidationView((cast storeThemeCategoryInterface : StoreThemeCategoryInterface));
            isValid = this.validationInterface.isValid();
            var domNodeInterface : DomNodeInterface = (cast this.validationInterface : DomNodeInterface);
            var document : Document = DomDocumentHelper.create();
            document.appendChild(domNodeInterface.toXmlNode(document));
            var documentString : String = XmlDocumentHelper.toString(document);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.putF("Setting Data: " + documentString, this, this.commonStrings.CONSTRUCTOR);
            }
            this.getTransformInfoInterface().setData(documentString);
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
            stringBuffer.append(this.validationInterface.validationInfo());
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Getting Validation Info";
        }
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

}

