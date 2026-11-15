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
package views.business.context.modules.storefront.customizer.bodies.generic;

//import java.util.HashMap;
import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.logic.communication.http.request.RequestParams;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.template.customizer.bodies.GenericBodyValidation;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.modules.storefront.customizer.CustomizerUtil;
import views.business.context.modules.storefront.customizer.StoreCustomizerComponentUtil;

class InsertGenericBodyValidationView extends GenericBodyCustomizerView implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        var requestHashMap : HashMap = new RequestParams(this.getPageContext()).toHashMap();
        this.body = new GenericBodyValidation(requestHashMap);
    }

    // throws Exception
    public function toXmlDoc() : Document {
        return null;
    }

    public function isValid() : Null<Bool> {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                this.logUtil.putF("Started Validation", this, this.commonStrings.IS_VALID);
            }
            var isValid : Null<Bool> = this.body.isValid();
            if (isValid == true) {
                CustomizerUtil.getInstance().insert(this.getTransformInfoInterface(), (cast this.body : DomNodeInterface));
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
            stringBuffer.append(this.body.validationInfo());
            return Std.string(stringBuffer);
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

    // throws Exception
    public function view() : String {
        try {
            return StoreCustomizerComponentUtil.getInstance().generate(this.abeClientInformation, this.getTransformInfoInterface());
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view()", e);
            }
            throw e;
        }
    }

    // throws Exception
    public override function getTransformInfoInterface() : TransformInfoInterface {
        return super.getTransformInfoInterface();
    }

}

