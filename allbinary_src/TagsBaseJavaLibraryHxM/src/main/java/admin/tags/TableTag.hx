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
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.JspTagException;
import admin.taghelpers.TagHelperFactoryInterface;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.SqlStrings;
import org.allbinary.logic.java.bool.BooleanUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;
import tags.PropertiesTag;

class TableTag extends PropertiesTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var enabled : String = null;
    private var tagHelperFactoryInterface : TagHelperFactoryInterface = null;
    private var tagRequestHelperFactoryInterface : TagHelperFactoryInterface = null;
    private var requestObject : Any = null;
    private var current : Null<Int> = null;
    private var total : Null<Int> = null;
    public function new() {
        super();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.CONSTRUCTOR);
        }
    }

    public function setIsSelected(enabled : String) : Void {
        this.enabled = enabled;
    }

    // throws Exception
    public function isEnabled() : Bool {
        if (!StringValidationUtil.getInstance().isEmpty(this.enabled)) {
            if (BooleanUtil.getInstance().getFromString(this.enabled) || Reflect.compare(this.enabled, "on") == 0) {
                return true;
            }
        }
        return false;
    }

    public function setTagHelperFactory(tagHelperFactoryInterface : TagHelperFactoryInterface) : Void {
        this.tagHelperFactoryInterface = tagHelperFactoryInterface;
    }

    public function getTagHelperFactoryInterface() : TagHelperFactoryInterface {
        return this.tagHelperFactoryInterface;
    }

    public function setTagRequestHelperFactory(tagHelperFactoryInterface : TagHelperFactoryInterface) : Void {
        this.tagRequestHelperFactoryInterface = tagHelperFactoryInterface;
    }

    public function getTagRequestHelperFactoryInterface() : TagHelperFactoryInterface {
        return this.tagRequestHelperFactoryInterface;
    }

    public function setCurrent(current : Null<Int>) : Void {
        this.current = current;
    }

    public function getCurrent() : Null<Int> {
        return this.current;
    }

    public function setTotal(total : Null<Int>) : Void {
        this.total = total;
    }

    public function getTotal() : Null<Int> {
        return this.total;
    }

    // throws LicensingException
    public function drop() : String {
        try {
            final anyType : Any = this.getTagHelperFactoryInterface().getInstance(this.getPropertiesHashMap(), pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("drop", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to drop table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.DROP, e);
            }
            return error;
        }
    }

    // throws LicensingException
    public function create() : String {
        try {
            final anyType : Any = this.getTagHelperFactoryInterface().getInstance(this.getPropertiesHashMap(), pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("create", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to create table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "create()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    public function restore() : String {
        try {
            final anyType : Any = this.getTagHelperFactoryInterface().getInstance(this.getPropertiesHashMap(), pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("restore", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to restore backup";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "restore()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    public function backup() : String {
        try {
            final anyType : Any = this.getTagHelperFactoryInterface().getInstance(this.getPropertiesHashMap(), pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("backup", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to make backup";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "backup()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    public function insert() : String {
        try {
            var helperClass : Class<Dynamic> = Type.getClass(this.requestObject);
            var method : Method = helperClass.getMethod("insert", null);
            var result : String = (cast method.invoke(this.requestObject, null) : String);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to insert";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "insert()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    public function delete() : String {
        try {
            var helperClass : Class<Dynamic> = Type.getClass(this.requestObject);
            var method : Method = helperClass.getMethod(commonStrings.delete, null);
            var result : String = (cast method.invoke(this.requestObject, null) : String);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to delete";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "delete()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    public function update() : String {
        try {
            var helperClass : Class<Dynamic> = Type.getClass(this.requestObject);
            var method : Method = helperClass.getMethod("update", null);
            var result : String = (cast method.invoke(this.requestObject, null) : String);
            return result;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to update";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "update()", e);
            }
            return error;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                var request : HttpServletRequest = (cast this.pageContext.getRequest() : HttpServletRequest);
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("TableTag Helper: ");
                stringBuffer.append(Type.getClassName(Type.getClass(this.getTagHelperFactoryInterface())));
                stringBuffer.append(" Request URI: ");
                stringBuffer.append(request.getRequestURI());
                this.logUtil.putF(stringBuffer.toString(), this, this.tagStrings.DO_START_TAG);
            }
            if (this.getTagRequestHelperFactoryInterface() != null) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                    this.logUtil.putF("TableTag RequestHelper: " + Type.getClassName(Type.getClass(this.getTagRequestHelperFactoryInterface())), this, this.tagStrings.DO_START_TAG);
                }
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                    this.logUtil.putF("TableTag RequestHelper: null", this, this.tagStrings.DO_START_TAG);
                }
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAG)) {
                this.logUtil.putF("TableTag this.getCommand(): " + this.getCommand(), this, tagStrings.DO_START_TAG);
            }
            if (this.isEnabled()) {
                if (this.getCommand() != null) {
                    if (this.getCommand().compareTo(this.commonStrings.INSERT) == 0 || this.getCommand().compareTo(SqlStrings.getInstance().INSERT_INTO) == 0 || this.getCommand().compareTo(commonStrings.DELETE) == 0 || this.getCommand().compareTo(commonStrings.UPDATE) == 0 || this.getCommand().compareTo(SqlStrings.getInstance().UPDATE) == 0) {
                        this.requestObject = this.getTagRequestHelperFactoryInterface().getInstance(this.getPropertiesHashMap(), pageContext);
                    }
                    if (this.getCommand().compareTo(this.commonStrings.INSERT) == 0 || this.getCommand().compareTo(SqlStrings.getInstance().INSERT_INTO) == 0) {
                        this.insert();
                    } else if (this.getCommand().compareTo(commonStrings.DELETE) == 0) {
                        this.delete();
                    } else if (this.getCommand().compareTo(commonStrings.UPDATE) == 0 || this.getCommand().compareTo(SqlStrings.getInstance().UPDATE) == 0) {
                        this.update();
                    }
                    if (this.getCommand().compareTo(org.allbinary.globals.GLOBALS2.BACKUP) == 0) {
                        var output : String = this.backup();
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                            this.pageContext.getOut().print(output + "<br />");
                        }
                        return SKIP_BODY;
                    } else if (this.getCommand().compareTo(org.allbinary.globals.GLOBALS2.RESTORE) == 0) {
                        this.getPropertiesHashMap().put("current", this.getCurrent());
                        this.getPropertiesHashMap().put("total", this.getTotal());
                        var output : String = this.restore();
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                            this.pageContext.getOut().print(output + "<br />");
                        }
                        return SKIP_BODY;
                    } else if (this.getCommand().compareTo(commonStrings.DROP) == 0) {
                        var output : String = this.drop();
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                            this.pageContext.getOut().print(output + "<br />");
                        }
                        return SKIP_BODY;
                    } else if (this.getCommand().compareTo(commonStrings.CREATE) == 0) {
                        var output : String = this.create();
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                            this.pageContext.getOut().print(output + "<br />");
                        }
                        return SKIP_BODY;
                    } else if (this.getCommand().compareTo(commonStrings.INSERT) == 0) {
                        var output : String = this.insert();
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                            this.pageContext.getOut().print(output + "<br />");
                        }
                    } else if (this.getCommand().compareTo(commonStrings.DELETE) == 0) {
                        var output : String = this.delete();
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                            this.pageContext.getOut().print(output + "<br />");
                        }
                    } else if (this.getCommand().compareTo(commonStrings.UPDATE) == 0) {
                        var output : String = this.update();
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                            this.pageContext.getOut().print(output + "<br />");
                        }
                    }
                }
            }
            return EVAL_BODY_INCLUDE;
        } catch (e : LicensingException) {
            AbResponseHandler.sendJspTagLicensingRedirect(this.pageContext, e);
            return SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

