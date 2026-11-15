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
package views.admin.storefront;

//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.context.modules.storefront.StoreFront;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.HttpContextView;

class AddValidationStoreFrontView extends HttpContextView implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public var newStoreFrontInterface : StoreFrontInterface;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.newStoreFrontInterface = (cast new StoreFront((cast this.getPageContext().getRequest() : HttpServletRequest)) : StoreFrontInterface);
        if (this.newStoreFrontInterface.getName() == null) {
            this.newStoreFrontInterface.setName(this.getWeblisketSession().getStoreName());
        }
    }

    public function isValid() : Null<Bool> {
        try {
            var valid : Null<Bool> = true;
            if (this.newStoreFrontInterface.isValid() == false) {
                valid = false;
            }
            if (StoreFrontFactory.getInstance(this.newStoreFrontInterface.getName()) != null) {
                valid = false;
            }
            if (AbFile.createAbFileFromAbPath(new AbPath(this.getStoreViewsPath(), StringUtil.getInstance().EMPTY_STRING)).isFile()) {
                valid = false;
            }
            return valid;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to validate form", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    // throws Exception
    private function getStoreViewsPath() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(URLGLOBALS.getMainPath());
        stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH);
        stringBuffer.append(this.newStoreFrontInterface.getName());
        return Std.string(stringBuffer);
    }

    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            if (this.newStoreFrontInterface.isValid() == false) {
                stringBuffer.append(this.newStoreFrontInterface.validationInfo());
            }
            if (StoreFrontFactory.getInstance(this.newStoreFrontInterface.getName()) != null) {
                stringBuffer.append("Store name already used<br/>");
            }
            if (AbFile.createAbFileFromAbPath(new AbPath(this.getStoreViewsPath(), StringUtil.getInstance().EMPTY_STRING)).isFile()) {
                stringBuffer.append("Store name clashes with template name<br/>");
            }
            return Std.string(stringBuffer);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Validating Form";
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
        return views.ValidationOnlyTempUtil.getInstance().view(this);
    }

    // throws Exception
    public override function getTransformInfoInterface() : TransformInfoInterface {
        return super.getTransformInfoInterface();
    }

}

