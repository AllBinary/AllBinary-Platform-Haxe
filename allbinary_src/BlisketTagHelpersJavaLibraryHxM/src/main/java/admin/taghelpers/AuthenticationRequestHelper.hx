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
package admin.taghelpers;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.UserInterface;
import org.allbinary.business.user.password.Password;
import org.allbinary.business.user.role.BasicUserRole;
import org.allbinary.data.tables.user.UserEntityFactory;
import org.allbinary.data.tables.user.UserEntityInterface;
import org.allbinary.globals.GLOBALS2;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.http.request.session.WeblisketSessionData;
import org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.smtp.email.NewPasswordEmail;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;

class AuthenticationRequestHelper extends TagHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    private var weblisketSession : WeblisketSession;
    private var request : HttpServletRequest;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.weblisketSession = new WeblisketSession(hashMap, pageContext);
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap, httpServletRequest : HttpServletRequest) {
        super();
        this.weblisketSession = new WeblisketSession(hashMap, httpServletRequest);
        this.request = httpServletRequest;
    }

    // throws Exception
    private function generateNewPassword() : String {
        if (this.weblisketSession != null && this.weblisketSession.getId() != null) {
            var startIndex : Int = this.weblisketSession.getId().length();
            if (startIndex >= 8) {
                return this.weblisketSession.getId().substring(startIndex - 8);
            } else {
                throw new haxe.Exception("Error Generating New Password");
            }
        } else {
            throw new haxe.Exception("No Session Available For Generating New Password");
        }
    }

    public function newPassword() : Null<Bool> {
        try {
            var userName : String = this.request.getParameter(WeblisketSessionData.REMOVABLEUSERNAME);
            var email : String = this.request.getParameter(UserData.MAINEMAIL);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                this.logUtil.putF("Generating New Password For: " + userName, this, "newPassword()");
            }
            var userEntityInterface : UserEntityInterface = UserEntityFactory.getInstance();
            var userInterface : UserInterface = userEntityInterface.getUser(userName);
            if (userInterface.getMainEmail().compareTo(email) != 0) {
                if (userInterface.getSecondaryEmail() != null && userInterface.getSecondaryEmail().compareTo(email) != 0) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                        this.logUtil.putF("Requested Email Is Not In User Profile", this, "newPassword()");
                    }
                    return false;
                }
            }
            var newPassword : String = this.generateNewPassword();
            userInterface.setPassword(newPassword);
            var newPasswordHashMap : HashMap = userInterface.toPasswordHashMap();
            UserEntityFactory.getInstance().update(userName, newPasswordHashMap);
            new NewPasswordEmail(this.abeClientInformation, userInterface, newPassword).process();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                this.logUtil.putF("Generated New Password For: " + userName, this, "newPassword()");
            }
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "newPassword()", e);
            }
            return false;
        }
    }

    public function changePassword() : Null<Bool> {
        try {
            var userName : String = this.request.getParameter(WeblisketSessionData.REMOVABLEUSERNAME);
            var passwordString : String = this.request.getParameter(WeblisketSessionData.REMOVABLEPASSWORD);
            var newPassword : String = this.request.getParameter(WeblisketSessionData.REMOVABLENEWPASSWORD);
            var newReenteredPassword : String = this.request.getParameter(WeblisketSessionData.REMOVABLEREENTERNEWPASSWORD);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                this.logUtil.putF("Changing Password For User: " + userName, this, "changePassword()");
            }
            var password : Password = new Password(newPassword);
            if (!password.isValid()) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                    this.logUtil.putF("New Password Is Not Valid", this, "changePassword()");
                }
                return false;
            }
            if (Reflect.compare(newPassword, newReenteredPassword) != 0) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                    this.logUtil.putF("New Password Fields Do Not Match", this, "changePassword()");
                }
                return false;
            }
            var sessionPassword : String = this.weblisketSession.getPassword();
            var userEntityInterface : UserEntityInterface = UserEntityFactory.getInstance();
            var userInterface : UserInterface = userEntityInterface.getUser(userName);
            var login : String = userEntityInterface.login(userName, passwordString);
            if (Reflect.compare(login, GLOBALS2.LOGINSUCCESS) == 0) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                    this.logUtil.putF("Authentication Successful", this, "changePassword()");
                }
                var newPasswordHashMap : HashMap = password.toHashMap(null);
                UserEntityFactory.getInstance().update(userName, newPasswordHashMap);
                new NewPasswordEmail(this.abeClientInformation, userInterface, newPassword).process();
                return true;
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                this.logUtil.putF("Authentication Failed", this, "changePassword()");
            }
            return false;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put("Authentication Failed", this, "changePassword()", e);
            }
            return false;
        }
    }

    public function isRoleValid(userName : String, password : String, roles : BasicArrayList) : Null<Bool> {
        try {
            var userEntityInterface : UserEntityInterface = UserEntityFactory.getInstance();
            var userInterface : UserInterface = userEntityInterface.getUser(userName);
            if (userInterface.getRole() == null) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                    this.logUtil.putF("Role is null: " + userInterface.getRole() + " Valid Roles: " + roles.toString(), this, "isRoleValid()");
                }
                return false;
            }
            final basicUserRoleArray : haxe.ds.Vector<Any> = roles.toArray();
            final size : Int = basicUserRoleArray.length;
            for (index in 0...size) {
                var nextRole : BasicUserRole = (cast basicUserRoleArray[index] : BasicUserRole);
                if (userInterface.getRole().getBasicUserRole().equals(nextRole)) {
                    userInterface.validateSession((cast this.weblisketSession : WeblisketSessionInterface));
                    this.request.removeAttribute(WeblisketSessionData.REMOVABLEUSERNAME);
                    this.request.removeAttribute(WeblisketSessionData.REMOVABLEPASSWORD);
                    return true;
                }
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Role is not valid: ");
                stringBuffer.append(userInterface.getRole().toString());
                stringBuffer.append(" Valid Roles: ");
                stringBuffer.append(roles.toString());
                this.logUtil.putF(stringBuffer.toString(), this, "isRoleValid()");
            }
            return false;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "isRoleValid()", e);
            }
            return false;
        }
    }

}

