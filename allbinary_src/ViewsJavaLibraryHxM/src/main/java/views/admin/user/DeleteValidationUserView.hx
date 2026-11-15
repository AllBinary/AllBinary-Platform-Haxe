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

//import java.util.HashMap;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.user.username.UserName;
import org.allbinary.data.tables.user.UserEntityFactory;
import org.allbinary.logic.communication.http.request.RequestParams;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.validate.ValidationComponentInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class DeleteValidationUserView extends UserView implements ValidationComponentInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var userName : String;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        var httpServletRequest : HttpServletRequest = (cast this.getPageContext().getRequest() : HttpServletRequest);
        var hashMap : HashMap = new RequestParams(httpServletRequest).toHashMap();
        this.userName = new UserName(hashMap).get();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("User Name: " + this.userName, this, this.commonStrings.CONSTRUCTOR);
        }
    }

    public function isValid() : Null<Bool> {
        try {
            if (UserName.getInstance().isValid(this.userName) == true) {
                this.user = UserEntityFactory.getInstance().getUser(this.userName);
                if (this.user == null) {
                    return false;
                }
            } else {
                return false;
            }
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put("Failed to validate form", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            if (UserName.getInstance().isValid(this.userName) == true) {
                this.user = UserEntityFactory.getInstance().getUser(this.userName);
                if (this.user == null) {
                    stringBuffer.append("User does not exist.<br />");
                }
            } else {
                stringBuffer.append("User Name is not valid.<br />");
            }
            return stringBuffer.toString();
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

}

