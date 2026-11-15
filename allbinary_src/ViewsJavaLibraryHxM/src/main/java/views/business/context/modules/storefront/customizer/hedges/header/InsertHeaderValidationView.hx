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
package views.business.context.modules.storefront.customizer.hedges.header;

//import java.util.HashMap;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.http.request.MultipartRequestParams;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.template.customizer.hedges.heading.HeadingValidation;
import org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoData;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.customizer.CustomizerUtil;

class InsertHeaderValidationView extends TopBarView implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final LOGOPATH : String = "logo/";
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        var multipartRequestHashMap : HashMap = new MultipartRequestParams(this.getPageContext()).toHashMap();
        var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(this.getWeblisketSession().getStoreName());
        var fullPath : String = URLGLOBALS.getWebappPath() + storeFrontInterface.getCurrentHostNamePath() + this.LOGOPATH;
        multipartRequestHashMap.put(LogoData.getInstance().IMAGEPATH, fullPath);
        this.heading = new HeadingValidation(multipartRequestHashMap);
    }

    // throws Exception
    public function toXmlDoc() : Document {
        return null;
    }

    public function isValid() : Null<Bool> {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("topbarValidation", this, this.commonStrings.IS_VALID);
            }
            var isValid : Null<Bool> = this.heading.isValid();
            if (isValid == true) {
                CustomizerUtil.getInstance().insert(this.getTransformInfoInterface(), (cast this : DomNodeInterface));
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
            stringBuffer.append(this.heading.validationInfo());
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

