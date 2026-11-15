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
//import javax.servlet.jsp.JspTagException;
//import javax.servlet.jsp.tagext.TagSupport;
import admin.taghelpers.StoreFrontsHelperFactory;
import admin.taghelpers.StoreFrontsRequestHelperFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;

class StoreFrontsTag extends TableTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
        super();
        this.setTagHelperFactory(new StoreFrontsHelperFactory());
        this.setTagRequestHelperFactory(new StoreFrontsRequestHelperFactory());
    }

    // throws LicensingException
    private function generateSelect() : String {
        try {
            var anyType : Any = this.getTagHelperFactoryInterface().getInstance(this.getPropertiesHashMap(), pageContext);
            var method : Method = Type.getClass(anyType).getMethod("generateSelect", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to generate storefronts select";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "generateSelect()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    private function install() : String {
        try {
            var anyType : Any = this.getTagRequestHelperFactoryInterface().getInstance(this.getPropertiesHashMap(), pageContext);
            var method : Method = Type.getClass(anyType).getMethod("install", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to generate storefronts select";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "generateSelect()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    private function sendStoreCreatedEmails() : String {
        try {
            var anyType : Any = this.getTagRequestHelperFactoryInterface().getInstance(this.getPropertiesHashMap(), pageContext);
            var method : Method = Type.getClass(anyType).getMethod("sendStoreCreatedEmails", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to send email";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "sendStoreCreatedEmails()", e);
            }
            return error;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.isEnabled()) {
                if (this.getCommand() != null) {
                    var storeFrontData : StoreFrontData = StoreFrontData.getInstance();
                    if (this.getCommand().compareTo(storeFrontData.SELECT) == 0) {
                        this.pageContext.getOut().print(this.generateSelect());
                    } else if (this.getCommand().compareTo(storeFrontData.INSTALL) == 0) {
                        this.getPropertiesHashMap().put("current", this.getCurrent());
                        this.getPropertiesHashMap().put("total", this.getTotal());
                        if (Std.int(this.getCurrent()) == Std.int(this.getTotal())) {
                            return TagSupport.EVAL_BODY_INCLUDE;
                        }
                        this.install();
                    } else if (this.getCommand().compareTo(storeFrontData.INSTALL_COMPLETE) == 0) {
                        this.sendStoreCreatedEmails();
                    } else {
                        return super.doStartTag();
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

