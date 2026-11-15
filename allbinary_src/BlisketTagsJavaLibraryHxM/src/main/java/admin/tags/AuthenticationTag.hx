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

//import java.lang.reflect.Method;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.JspTagException;
//import javax.servlet.jsp.tagext.TagSupport;
import admin.taghelpers.AuthenticationHelperFactory;
import admin.taghelpers.AuthenticationRequestHelperFactory;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.http.request.session.WeblisketSessionData;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;
import tags.CustomTagSupport;

class AuthenticationTag extends CustomTagSupport {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var command : String = null;
    private var userName : String;
    private var password : String;
    private var newPassword : String = null;
    private var roles : BasicArrayList = null;
    private var propertiesHashMap : HashMap = null;
    public function new() {
        super();
        final stringUtil : StringUtil = StringUtil.getInstance();
        this.userName = stringUtil.EMPTY_STRING;
        this.password = stringUtil.EMPTY_STRING;
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

    // throws LicensingException
    private function changePassword() : Bool {
        try {
            var anyType : Any = new AuthenticationRequestHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("changePassword", null);
            var result : Null<Bool> = (cast method.invoke(anyType, null) : Null<Bool>);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "changePassword()", e);
            }
            return false;
        }
    }

    // throws LicensingException
    private function newPassword() : Bool {
        try {
            var anyType : Any = new AuthenticationRequestHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("newPassword", null);
            var result : Null<Bool> = (cast method.invoke(anyType, null) : Null<Bool>);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "newPassword()", e);
            }
            return false;
        }
    }

    // throws LicensingException
    private function invalidateSession() : Int {
        try {
            var anyType : Any = new AuthenticationHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("invalidateSession", null);
            var resultInteger : Null<Int> = (cast method.invoke(anyType, null) : Null<Int>);
            return Std.int(resultInteger);
        } catch (e : LicensingException) {
            throw e;
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
            var anyType : Any = new AuthenticationHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var helperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = helperClass.getMethod("isSessionOld", null);
            var resultBoolean : Null<Bool> = (cast method.invoke(anyType, null) : Null<Bool>);
            return resultBoolean;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "isSessionOld()", e);
            }
            return false;
        }
    }

    // throws LicensingException
    private function isRoleValid() : Bool {
        try {
            var anyType : Any = new AuthenticationRequestHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var methodParams : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([Type.getClass(this.userName), Type.getClass(this.password), Type.getClass(this.roles)]);
            var method : Method = addressHelperClass.getMethod("isRoleValid", methodParams);
            var methodArgs : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([this.userName, this.password, this.roles]);
            var resultBoolean : Null<Bool> = (cast method.invoke(anyType, methodArgs) : Null<Bool>);
            return resultBoolean;
        } catch (e : LicensingException) {
            throw e;
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
            var anyType : Any = new AuthenticationHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("validRole", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
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
            var anyType : Any = new AuthenticationHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("invalidRole", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
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
            var anyType : Any = new AuthenticationHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var methodParams : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([Type.getClass(this.roles)]);
            var method : Method = addressHelperClass.getMethod("isAuthenticationSessionValid", methodParams);
            var methodArgs : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([this.roles]);
            var resultBoolean : Null<Bool> = (cast method.invoke(anyType, methodArgs) : Null<Bool>);
            return resultBoolean;
        } catch (e : LicensingException) {
            throw e;
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
            var anyType : Any = new AuthenticationHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var helperClass : Class<Dynamic> = Type.getClass(anyType);
            var methodParams : haxe.ds.Vector<Class<Dynamic>> = haxe.ds.Vector.fromArrayCopy([Type.getClass(this.userName), Type.getClass(this.password)]);
            var method : Method = helperClass.getMethod("processIfNewLogin", methodParams);
            var methodArgs : haxe.ds.Vector<Any> = haxe.ds.Vector.fromArrayCopy([this.userName, this.password]);
            var resultBoolean : Null<Bool> = (cast method.invoke(anyType, methodArgs) : Null<Bool>);
            return resultBoolean;
        } catch (e : LicensingException) {
            throw e;
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
            var anyType : Any = new AuthenticationHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("processInvalidation", null);
            var resultBoolean : Null<Bool> = (cast method.invoke(anyType, null) : Null<Bool>);
            return resultBoolean;
        } catch (e : LicensingException) {
            throw e;
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
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                var request : HttpServletRequest = (cast this.pageContext.getRequest() : HttpServletRequest);
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append(" Request URI: ");
                stringBuffer.append(request.getRequestURI());
                this.logUtil.putF(Std.string(stringBuffer), this, tagStrings.DO_START_TAG);
            }
            if (this.command != null) {
                this.propertiesHashMap = StdUtil.getInstance().createHashMap();
                if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.NEWPASSWORD) == 0) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                        this.logUtil.putF("New Password", this, tagStrings.DO_START_TAG);
                    }
                    if (!this.newPassword()) {
                        pageContext.getOut().print("New Password Request Failed.<p/>");
                        return EVAL_BODY_INCLUDE;
                    } else {
                        pageContext.getOut().print("New Password Was Sent.<p/>");
                        return SKIP_BODY;
                    }
                } else if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.CHANGEPASSWORD) == 0) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                        this.logUtil.putF("Change Password", this, tagStrings.DO_START_TAG);
                    }
                    if (!this.changePassword()) {
                        pageContext.getOut().print("Password Change Attempt Failed.<p/>");
                        return EVAL_BODY_INCLUDE;
                    } else {
                        pageContext.getOut().print("Password Changed Successfully.<p/>");
                        return SKIP_BODY;
                    }
                } else if (Reflect.compare(this.command, WeblisketSessionData.INVALIDATESESSION) == 0) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                        this.logUtil.putF("INVALIDATESESSION", this, tagStrings.DO_START_TAG);
                    }
                    return this.invalidateSession();
                } else {
                    if (this.isSessionOld()) {
                        if (this.processInvalidation()) {
                            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                                this.logUtil.putF("Processing Invalidation", this, tagStrings.DO_START_TAG);
                            }
                            pageContext.getOut().print("Please login again.<p>");
                            if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED) == 0) {
                                return TagSupport.SKIP_BODY;
                            } else {
                                return TagSupport.EVAL_BODY_INCLUDE;
                            }
                        } else {
                            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                                this.logUtil.putF("Preparing session for invalidation", this, tagStrings.DO_START_TAG);
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
                            this.logUtil.putF("Authenticated session is valid", this, tagStrings.DO_START_TAG);
                        }
                        if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED) == 0) {
                            return TagSupport.EVAL_BODY_INCLUDE;
                        } else {
                            return TagSupport.SKIP_BODY;
                        }
                    }
                    if (this.userName != null && this.password != null && this.processIfNewLogin()) {
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                            this.logUtil.putF("Processing new login.", this, tagStrings.DO_START_TAG);
                        }
                        if (this.isRoleValid()) {
                            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                                this.logUtil.putF("Role is valid - Processing new login", this, tagStrings.DO_START_TAG);
                            }
                            pageContext.getOut().print(validRole());
                            if (Reflect.compare(this.command, org.allbinary.globals.GLOBALS2.PROCESSBODYIFAUTHENTICATED) == 0) {
                                return EVAL_BODY_INCLUDE;
                            } else {
                                return SKIP_BODY;
                            }
                        } else {
                            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                                this.logUtil.putF("Role is not valid - Processing new login", this, tagStrings.DO_START_TAG);
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
                            this.logUtil.putF("Invalid Login", this, tagStrings.DO_START_TAG);
                        }
                        if (this.userName != null && Reflect.compare(this.userName, stringUtil.EMPTY_STRING) != 0 && this.password != null && Reflect.compare(this.password, stringUtil.EMPTY_STRING) != 0) {
                            pageContext.getOut().print("Sorry your username and/or password is invalid.<p/>");
                        }
                    }
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                        this.logUtil.putF(Std.string(new StringMaker().append("Major authentication error - userName: ").append(this.userName).append(" Password: ").append(this.password).append(" Command: ").append(this.command)), this, tagStrings.DO_START_TAG);
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

