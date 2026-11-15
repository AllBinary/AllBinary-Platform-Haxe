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
package admin.tags;

//import java.util.Calendar;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.JspTagException;
//import javax.servlet.jsp.tagext.TagSupport;
import org.allbinary.business.init.InstallerInfo;
import org.allbinary.business.user.role.BasicUserRole;
import org.allbinary.business.user.role.BasicUserRoleFactory;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.http.request.session.BasicWeblisketSession;
import org.allbinary.logic.communication.http.request.session.WeblisketSessionData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.java.bool.BooleanUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;
import tags.CustomTagSupport;

class FileAuthenticationTag extends CustomTagSupport {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var attemptsInteger : Null<Int> = null;
    private var weblisketSession : BasicWeblisketSession = null;
    private var request : HttpServletRequest = null;
    private var command : String = null;
    private var userName : String = null;
    private var password : String = null;
    private var newPassword : String = null;
    private var authenticated : String = null;
    private var sessionUserName : String = null;
    private var role : BasicUserRole = null;
    private var timeout : String = null;
    private var roles : BasicArrayList = null;
    public function new() {
        super();
    }

    public function setCommand(command : String) : Void {
        this.command = command;
    }

    public function setUserName(userName : String) : Void {
        this.userName = userName;
    }

    public function setPassword(value : String) : Void {
        this.password = value;
    }

    public function setNewPassword(value : String) : Void {
        this.newPassword = value;
    }

    public function setRoles(values : BasicArrayList) : Void {
        this.roles = values;
    }

    private function makeSessionValid(storedRole : BasicUserRole, userName : String) : Void {
        this.weblisketSession.setAuthenticated();
        this.weblisketSession.setRole(storedRole);
        this.weblisketSession.setUserName(userName);
        this.request.removeAttribute(WeblisketSessionData.REMOVABLEUSERNAME);
        this.request.removeAttribute(WeblisketSessionData.REMOVABLEPASSWORD);
    }

    private function getFormData() : Void {
        this.authenticated = this.weblisketSession.getAuthentication();
        this.sessionUserName = this.weblisketSession.getUserName();
        this.role = this.weblisketSession.getRole();
        this.attemptsInteger = this.weblisketSession.getAttempts();
        this.timeout = this.weblisketSession.getTimeout();
    }

    public function nextAttempt() : Void {
        if (this.attemptsInteger != null && Std.int(this.attemptsInteger) > 0) {
            this.weblisketSession.setAttempts(Std.int(this.attemptsInteger) + 1);
        } else {
            this.weblisketSession.setAttempts(1);
        }
    }

    // throws LicensingException
    private function changePassword() : Bool {
        try {
            var userName : String = this.request.getParameter(WeblisketSessionData.REMOVABLEUSERNAME);
            var password : String = this.request.getParameter(WeblisketSessionData.REMOVABLEPASSWORD);
            var newPassword : String = this.request.getParameter(WeblisketSessionData.REMOVABLENEWPASSWORD);
            var newReenteredPassword : String = this.request.getParameter(WeblisketSessionData.REMOVABLEREENTERNEWPASSWORD);
            if (Reflect.compare(newPassword, newReenteredPassword) != 0) {
                return false;
            }
            var installerInfo : InstallerInfo = new InstallerInfo();
            if (installerInfo.isValid(userName, password)) {
                installerInfo.setPassword(newPassword);
                installerInfo.write();
                this.weblisketSession.setUserName(userName);
                this.weblisketSession.setPassword(newPassword);
                return true;
            }
            return false;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "invalidateSession()", e);
            }
            return false;
        }
    }

    private function invalidateSession() : Int {
        try {
            this.weblisketSession.clear();
            return Std.int(TagSupport.EVAL_BODY_INCLUDE);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "invalidateSession()", e);
            }
            return TagSupport.SKIP_BODY;
        }
    }

    // throws LicensingException
    private function isSessionOld() : Bool {
        try {
            if (this.role != null) {
                var timeCreated : haxe.Int64 = this.weblisketSession.getCreationTime();
                var sessionTimout : haxe.Int64 = this.role.getSessionTimeout();
                var calendar : Calendar = Calendar.getInstance();
                var timeFirst : haxe.Int64 = calendar.getTimeInMillis() - sessionTimout;
                if (timeFirst > timeCreated) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATION)) {
                        var stringBuffer : StringMaker = new StringMaker();
                        stringBuffer.append("Session Is Old - Timeout: ");
                        stringBuffer.appendlong(sessionTimout);
                        stringBuffer.append(" Eval: ");
                        stringBuffer.appendlong(timeFirst);
                        stringBuffer.append(" > ");
                        stringBuffer.appendlong(timeCreated);
                        this.logUtil.putF(stringBuffer.toString(), this, "isSessionOld()");
                    }
                    return true;
                }
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATION)) {
                    this.logUtil.putF("Role Is Not In Session", this, "isSessionOld()");
                }
            }
            return this.isRarelyUsedSession();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "isSessionOld()", e);
            }
            return false;
        }
    }

    private function isRarelyUsedSession() : Null<Bool> {
        if (this.role != null) {
            var timeCreated : haxe.Int64 = this.weblisketSession.getCreationTime();
            var lastAccess : haxe.Int64 = this.weblisketSession.getLastAccessedTime();
            var timePassed : haxe.Int64 = this.role.getSessionInactivityTimeout();
            var calendar : Calendar = Calendar.getInstance();
            var timeFirst : haxe.Int64 = calendar.getTimeInMillis() - lastAccess;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATION)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Session Is Rarely Used - Timeout: ");
                stringBuffer.appendlong(lastAccess);
                stringBuffer.append(" Eval: ");
                stringBuffer.appendlong(timeFirst);
                stringBuffer.append(" > ");
                stringBuffer.appendlong(timePassed);
                this.logUtil.putF(stringBuffer.toString(), this, "isRarelyUsedSession()");
            }
        } else {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATION)) {
                this.logUtil.putF("Role Is Not In Session", this, "isRarelyUsedSession()");
            }
        }
        return false;
    }

    // throws LicensingException
    private function isRoleValid() : Bool {
        try {
            this.makeSessionValid(BasicUserRoleFactory.getInstance().INSTALLER, userName);
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "isRoleValid()", e);
            }
            return false;
        }
    }

    // throws LicensingException
    private function validRole() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Trying New login<p>");
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            var error : String = "Failed to set valid role";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "validRole()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    private function invalidRole() : String {
        try {
            this.weblisketSession.setAuthenticated(false);
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Sorry your username and password is invalid on this page.");
            stringBuffer.append("Trying New login<p>");
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            var error : String = "Failed to set role invalid";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "invalidRole()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    private function isAuthenticationSessionValid() : Bool {
        try {
            if (BooleanUtil.getInstance().getFromString(this.authenticated)) {
                final size : Int = this.roles.size();
                for (index in 0...size) {
                    var mustBeOfRole : BasicUserRole = (cast this.roles.get(index) : BasicUserRole);
                    if (this.sessionUserName != null && this.role.equals(mustBeOfRole)) {
                        return true;
                    }
                }
                return false;
            }
            return false;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "isAuthenticationSessionValid()", e);
            }
            return false;
        }
    }

    // throws LicensingException
    private function processIfNewLogin() : Bool {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPERERROR)) {
                this.logUtil.putF("Starting for User: " + this.userName + " Attempt: " + this.weblisketSession.getAttempts(), this, "processIfNewLogin()");
            }
            if (this.userName != null && Reflect.compare(this.userName, StringUtil.getInstance().EMPTY_STRING) != 0 && this.password != null && Reflect.compare(this.password, StringUtil.getInstance().EMPTY_STRING) != 0) {
                var login : String = null;
                var installerInfo : InstallerInfo = new InstallerInfo();
                if (installerInfo.isValid(this.userName, this.password)) {
                    login = org.allbinary.globals.GLOBALS2.LOGINSUCCESS;
                } else {
                    login = org.allbinary.globals.GLOBALS2.LOGINFAILED;
                }
                if (Reflect.compare(login, org.allbinary.globals.GLOBALS2.LOGINSUCCESS) == 0) {
                    this.weblisketSession.setAttempts(0);
                    return true;
                }
                this.nextAttempt();
                return false;
            }
            this.nextAttempt();
            return false;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "processIfNewLogin()", e);
            }
            return false;
        }
    }

    // throws LicensingException
    private function processInvalidation() : Bool {
        try {
            if (BooleanUtil.getInstance().getFromString(this.timeout)) {
                this.invalidateSession();
                return true;
            }
            {
                this.weblisketSession.setTimeout(BooleanFactory.getInstance().TRUE_STRING);
                return false;
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "isSetToInvalidate()", e);
            }
            return false;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            final stringUtil : StringUtil = StringUtil.getInstance();
            this.request = (cast pageContext.getRequest() : HttpServletRequest);
            this.weblisketSession = new BasicWeblisketSession(pageContext);
            this.getFormData();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                this.logUtil.putF("Started", this, this.tagStrings.DO_START_TAG);
            }
            if (this.command != null) {
                if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.CHANGEPASSWORD) == 0) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                        this.logUtil.putF("Change Password", this, this.tagStrings.DO_START_TAG);
                    }
                    if (!this.changePassword()) {
                        pageContext.getOut().print("Password Change Attempt Failed.<p>");
                        return EVAL_BODY_INCLUDE;
                    } else {
                        pageContext.getOut().print("Password Changed Successfully.<p>");
                        return SKIP_BODY;
                    }
                } else if (Reflect.compare(this.command, WeblisketSessionData.INVALIDATESESSION) == 0) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                        this.logUtil.putF("INVALIDATESESSION", this, this.tagStrings.DO_START_TAG);
                    }
                    return this.invalidateSession();
                } else {
                    if (this.isSessionOld()) {
                        if (this.processInvalidation()) {
                            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                                this.logUtil.putF("Processing Invalidation", this, this.tagStrings.DO_START_TAG);
                            }
                            pageContext.getOut().print("Please login again.<p>");
                            if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED) == 0) {
                                return TagSupport.SKIP_BODY;
                            } else {
                                return TagSupport.EVAL_BODY_INCLUDE;
                            }
                        } else {
                            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                                this.logUtil.putF("Preparing session for invalidation", this, this.tagStrings.DO_START_TAG);
                            }
                            if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED) == 0) {
                                return TagSupport.SKIP_BODY;
                            } else {
                                return TagSupport.EVAL_BODY_INCLUDE;
                            }
                        }
                    }
                    if ((this.userName == null || Reflect.compare(this.userName, stringUtil.EMPTY_STRING) == 0) && (this.password == null || Reflect.compare(this.password, stringUtil.EMPTY_STRING) == 0) && this.roles != null && this.isAuthenticationSessionValid()) {
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                            this.logUtil.putF("Authenticated session is valid", this, this.tagStrings.DO_START_TAG);
                        }
                        if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED) == 0) {
                            return TagSupport.EVAL_BODY_INCLUDE;
                        } else {
                            return TagSupport.SKIP_BODY;
                        }
                    }
                    if (this.userName != null && this.password != null && this.processIfNewLogin()) {
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                            this.logUtil.putF("Processing new login.", this, this.tagStrings.DO_START_TAG);
                        }
                        if (this.isRoleValid()) {
                            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                                this.logUtil.putF("Role is valid - Processing new login", this, this.tagStrings.DO_START_TAG);
                            }
                            pageContext.getOut().print(validRole());
                            if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED) == 0) {
                                return EVAL_BODY_INCLUDE;
                            } else {
                                return SKIP_BODY;
                            }
                        } else {
                            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                                this.logUtil.putF("Role is not valid - Processing new login", this, this.tagStrings.DO_START_TAG);
                            }
                            pageContext.getOut().print(invalidRole());
                            if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED) == 0) {
                                return SKIP_BODY;
                            } else {
                                return EVAL_BODY_INCLUDE;
                            }
                        }
                    } else {
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                            this.logUtil.putF("Invalid Login", this, this.tagStrings.DO_START_TAG);
                        }
                        if (this.userName != null && Reflect.compare(this.userName, StringUtil.getInstance().EMPTY_STRING) != 0 && this.password != null && Reflect.compare(this.password, StringUtil.getInstance().EMPTY_STRING) != 0) {
                            pageContext.getOut().print("Sorry your username and/or password is invalid.<p>");
                        }
                    }
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                        var stringBuffer : StringMaker = new StringMaker();
                        stringBuffer.append("Major authentication error - userName: ");
                        stringBuffer.append(this.userName);
                        stringBuffer.append(" Password: ");
                        stringBuffer.append(this.password);
                        stringBuffer.append(" Command: ");
                        stringBuffer.append(this.command);
                        this.logUtil.putF(stringBuffer.toString(), this, this.tagStrings.DO_START_TAG);
                    }
                    if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED) == 0) {
                        return TagSupport.SKIP_BODY;
                    } else {
                        return TagSupport.EVAL_BODY_INCLUDE;
                    }
                }
            }
            return SKIP_BODY;
        } catch (e : LicensingException) {
            AbResponseHandler.sendJspTagLicensingRedirect(this.pageContext, e);
            return SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

