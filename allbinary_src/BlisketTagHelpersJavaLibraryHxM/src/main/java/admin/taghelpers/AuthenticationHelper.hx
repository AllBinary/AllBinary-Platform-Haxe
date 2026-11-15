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

//import java.util.Calendar;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
//import javax.servlet.jsp.tagext.TagSupport;
import org.allbinary.business.user.UserInterface;
import org.allbinary.business.user.role.BasicUserRole;
import org.allbinary.business.user.role.UserRole;
import org.allbinary.business.user.role.UserRoleFactory;
import org.allbinary.data.tables.user.UserEntityFactory;
import org.allbinary.data.tables.user.UserEntityInterface;
import org.allbinary.globals.GLOBALS2;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.java.bool.BooleanFactory;
import org.allbinary.logic.java.bool.BooleanUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class AuthenticationHelper extends TagHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var weblisketSession : WeblisketSession;
    private var authenticated : String = null;
    private var sessionUserName : String = null;
    private var role : UserRole = null;
    private var timeout : String = null;
    private var attemptsInteger : Null<Int> = null;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        // this(hashMap, (cast pageContext.getRequest() : HttpServletRequest)) - Haxe has one constructor
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap, httpServletRequest : HttpServletRequest) {
        super();
        this.weblisketSession = new WeblisketSession(hashMap, httpServletRequest);
        this.getFormData();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATION)) {
            this.logUtil.putF(this.outputSessionInfo(), this, this.commonStrings.CONSTRUCTOR);
        }
    }

    // throws Exception
    private function getFormData() : Void {
        this.authenticated = this.weblisketSession.getAuthentication();
        this.sessionUserName = this.weblisketSession.getUserName();
        this.role = this.weblisketSession.getRole();
        this.attemptsInteger = this.weblisketSession.getAttempts();
        this.timeout = this.weblisketSession.getTimeout();
    }

    // throws Exception
    public function invalidateSession() : Null<Int> {
        try {
            this.weblisketSession.clear();
            return TagSupport.EVAL_BODY_INCLUDE;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "invalidateSession()", e);
            }
            return null;
        }
    }

    public function isSessionOld() : Null<Bool> {
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
    }

    private function isRarelyUsedSession() : Null<Bool> {
        if (this.role != null) {
            var timeCreated : haxe.Int64 = this.weblisketSession.getCreationTime();
            var lastAccess : haxe.Int64 = this.weblisketSession.getLastAccessedTime();
            var inactivityAllowed : haxe.Int64 = this.role.getSessionInactivityTimeout();
            var calendar : Calendar = Calendar.getInstance();
            var timeFirst : haxe.Int64 = calendar.getTimeInMillis() - lastAccess;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATION)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Session Is Rarely Used - Timeout: ");
                stringBuffer.appendlong(lastAccess);
                stringBuffer.append(" Eval: ");
                stringBuffer.appendlong(timeFirst);
                stringBuffer.append(" > ");
                stringBuffer.appendlong(inactivityAllowed);
                this.logUtil.putF(stringBuffer.toString(), this, "isRarelyUsedSession()");
            }
        } else {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATION)) {
                this.logUtil.putF("Role Is Not In Session", this, "isRarelyUsedSession()");
            }
        }
        return false;
    }

    public function validRole() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Trying New login<p/>");
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            var error : String = "Failed to set valid role";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "validRole()", e);
            }
            return error;
        }
    }

    public function invalidRole() : String {
        try {
            this.weblisketSession.setAuthenticated(false);
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Sorry your username and password is invalid on this page. ");
            stringBuffer.append("Trying New login<p/>");
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            var error : String = "Failed to set role invalid";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "invalidRole()", e);
            }
            return error;
        }
    }

    // throws Exception
    public function isAuthenticated() : Bool {
        if (BooleanUtil.getInstance().getFromString(this.authenticated)) {
            return true;
        } else {
            return false;
        }
    }

    public function isAuthenticationSessionValid(roles : BasicArrayList) : Null<Bool> {
        try {
            if (this.role != null) {
                if (this.isAuthenticated()) {
                    if (this.sessionUserName != null) {
                        var basicUserRole : BasicUserRole = this.role.getBasicUserRole();
                        final basicUserRoleArray : haxe.ds.Vector<Any> = roles.toArray();
                        final size : Int = basicUserRoleArray.length;
                        for (index in 0...size) {
                            var mustBeOfRole : BasicUserRole = (cast basicUserRoleArray[index] : BasicUserRole);
                            if (basicUserRole.equals(mustBeOfRole)) {
                                if (basicUserRole.equals(UserRoleFactory.getInstance().CUSTOMER)) {
                                    var userEntityInterface : UserEntityInterface = UserEntityFactory.getInstance();
                                    var userInterface : UserInterface = userEntityInterface.getUser(this.sessionUserName);
                                    if (!userInterface.isSessionValid()) {
                                        return false;
                                    }
                                }
                                return true;
                            }
                        }
                    }
                    return false;
                }
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATION)) {
                    this.logUtil.putF("Role Is Not In Session", this, "isAuthenticationSessionValid()");
                }
            }
            return false;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "isAuthenticatedSessionValid()", e);
            }
            return false;
        }
    }

    public function nextAttempt() : Void {
        if (this.attemptsInteger != null && Std.int(this.attemptsInteger) > 0) {
            this.weblisketSession.setAttempts(Std.int(this.attemptsInteger) + 1);
        } else {
            this.weblisketSession.setAttempts(1);
        }
    }

    public function processIfNewLogin(userName : String, password : String) : Null<Bool> {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR)) {
                this.logUtil.putF("Starting: " + userName, this, "processIfNewLogin()");
            }
            if (userName != null && Reflect.compare(userName, StringUtil.getInstance().EMPTY_STRING) != 0 && password != null && Reflect.compare(password, StringUtil.getInstance().EMPTY_STRING) != 0) {
                var login : String = null;
                var userEntityInterface : UserEntityInterface = UserEntityFactory.getInstance();
                login = userEntityInterface.login(userName, password);
                if (Reflect.compare(login, GLOBALS2.LOGINSUCCESS) == 0) {
                    var userInterface : UserInterface = userEntityInterface.getUser(userName);
                    if (userInterface.isSessionValid()) {
                        this.weblisketSession.setAttempts(0);
                        return true;
                    }
                }
                this.nextAttempt();
                return false;
            }
            this.nextAttempt();
            return false;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "processIfNewLogin()", e);
            }
            return false;
        }
    }

    public function processInvalidation() : Null<Bool> {
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
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().AUTHENTICATIONERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "processInvalidation()", e);
            }
            return false;
        }
    }

    public function outputSessionInfo() : String {
        try {
            var calendar : Calendar = Calendar.getInstance();
            var timeCreated : haxe.Int64 = this.weblisketSession.getCreationTime();
            var stringBuffer : StringMaker = new StringMaker();
            var lastAccess : haxe.Int64 = this.weblisketSession.getLastAccessedTime();
            stringBuffer.append("Time Since Last Access: " + (calendar.getTimeInMillis() - lastAccess) + "<br/>\n");
            if (this.role != null) {
                stringBuffer.append("Auth: ");
                stringBuffer.append(this.authenticated);
                stringBuffer.append(" UserName: ");
                stringBuffer.append(this.sessionUserName);
                stringBuffer.append(" Role: ");
                stringBuffer.append(this.role.toString());
                stringBuffer.append("<br/>\n");
                stringBuffer.append("Time Left: ");
                stringBuffer.appendlong(haxe.Int64.ofInt((this.role.getSessionTimeout() - (calendar.getTimeInMillis() - timeCreated))));
                stringBuffer.append("<br/>\n");
                stringBuffer.append("Inactivity Time Allowed: ");
                stringBuffer.appendlong(haxe.Int64.ofInt(this.role.getSessionTimeout()));
                stringBuffer.append("<br/>\n");
                stringBuffer.append("Inactivity Time Allowed: ");
                stringBuffer.appendlong(haxe.Int64.ofInt(this.role.getSessionInactivityTimeout()));
                stringBuffer.append("<br/>\n");
            } else {
                stringBuffer.append("Role Is Not Set<br/>\n");
            }
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            return "Error";
        }
    }

    public function getRole() : UserRole {
        return this.role;
    }

}

