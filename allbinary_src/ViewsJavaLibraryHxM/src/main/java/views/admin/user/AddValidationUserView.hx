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
package views.admin.user;

import org.allbinary.business.user.NewUserFactory;
import org.allbinary.business.user.UserInterface;
import org.allbinary.data.tables.user.UserEntityFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import views.business.context.HttpContextView;

class AddValidationUserView extends HttpContextView implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public var user : UserInterface;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.user = NewUserFactory.getInstance(transformInfoInterface);
    }

    public function isValid() : Null<Bool> {
        try {
            if (UserEntityFactory.getInstance().getUser(this.user.getUserName()) != null) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("User already in existance.", this, this.commonStrings.IS_VALID);
                }
                return false;
            }
            if (this.user.isValid() == false) {
                return false;
            }
            return true;
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
            if (UserEntityFactory.getInstance().getUser(this.user.getUserName()) != null) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                    this.logUtil.putF("User already exists", this, "validationInfo()");
                }
                stringBuffer.append("The User Name you selected is already in use.<br/>  Please select another User Name.<br />");
            }
            if (this.user.isValid() == false) {
                stringBuffer.append(this.user.validationInfo());
            }
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

    // throws Exception
    public function view() : String {
        return views.ValidationOnlyTempUtil.getInstance().view(this);
    }

}

