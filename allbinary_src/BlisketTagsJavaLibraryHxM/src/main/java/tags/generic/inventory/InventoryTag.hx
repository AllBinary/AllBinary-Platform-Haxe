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
package tags.generic.inventory;

//import java.lang.reflect.Method;
//import javax.servlet.jsp.JspTagException;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;
import taghelpers.InventoryHelperFactory;
import tags.StoreValidationTransformTag;

class InventoryTag extends StoreValidationTransformTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
        super();
    }

    // throws LicensingException
    private function search() : Void {
        try {
            var anyType : Any = new InventoryHelperFactory().getInstance(this.getPropertiesHashMap(), this.pageContext);
            var addressHelperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = addressHelperClass.getMethod("search", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            pageContext.getOut().print(result);
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to search Inventory by keyword";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "search()", e);
            }
            try {
                pageContext.getOut().print(error + "<br>");
                pageContext.getOut().print("Exception: " + e + "<br>");
            } catch (e2 : haxe.Exception) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LICENSINGERROR)) {
                    this.logUtil.put("Exception in Exception Handling", this, "search()", e);
                }
            }
        }
    }

    // throws LicensingException
    private function viewSummary() : Void {
        try {
            var anyType : Any = new InventoryHelperFactory().getInstance(this.getPropertiesHashMap(), this.pageContext);
            var helperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = helperClass.getMethod("viewSummary", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            pageContext.getOut().print(result);
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to View Summary";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "viewSummary()", e);
            }
            try {
                pageContext.getOut().print(error + "<br>");
                pageContext.getOut().print("Exception: " + e + "<br>");
            } catch (e2 : haxe.Exception) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().LICENSINGERROR)) {
                    this.logUtil.put("Exception in Exception Handling", this, "viewSummary())", e);
                }
            }
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.getCommand() != null) {
                if (this.getCommand().compareTo(org.allbinary.globals.GLOBALS2.SEARCH) == 0) {
                    this.setName("Basic Search Inventory View");
                    this.setObjectFile("views.generic.inventory.AutoSearchValidationInventoryView");
                    this.search();
                    return EVAL_BODY_INCLUDE;
                } else if (this.getCommand().compareTo(org.allbinary.globals.GLOBALS2.VIEWSUMMARY) == 0) {
                    this.setName("Basic Inventory View");
                    this.setObjectFile("views.generic.inventory.AutoValidationInventoryView");
                    this.viewSummary();
                    return EVAL_BODY_INCLUDE;
                } else if (this.getCommand().compareTo(org.allbinary.globals.GLOBALS2.VIEW) == 0) {
                    this.setName("Basic Inventory View");
                    this.setObjectFile("views.generic.inventory.AutoValidationInventoryView");
                    return super.doStartTag();
                } else {
                    throw new haxe.Exception("No Such View Command: " + this.getCommand());
                }
            }
            throw new haxe.Exception("Command Null");
        } catch (e : LicensingException) {
            AbResponseHandler.sendJspTagLicensingRedirect(this.pageContext, e);
            return SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

