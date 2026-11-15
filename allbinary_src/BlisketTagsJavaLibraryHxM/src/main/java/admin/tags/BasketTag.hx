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
//import javax.servlet.jsp.JspTagException;
import admin.taghelpers.BasketHelperFactory;
import admin.taghelpers.BasketRequestHelperFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.user.commerce.inventory.basket.BasketData;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;
import tags.CustomTagSupport;

class BasketTag extends CustomTagSupport {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var command : String = null;
    private var storeName : String = null;
    private var propertiesHashMap : HashMap = null;
    public function new() {
        super();
    }

    public function setCommand(command : String) : Void {
        this.command = command;
    }

    public function setStoreName(value : String) : Void {
        this.storeName = value;
    }

    // throws LicensingException
    private function isBasketEmpty() : Bool {
        try {
            var anyType : Any = new BasketHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var method : Method = Type.getClass(anyType).getMethod("isBasketEmpty", null);
            var emptyBoolean : Null<Bool> = (cast method.invoke(anyType, null) : Null<Bool>);
            return emptyBoolean;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "isBasketEmpty()", e);
            }
            return true;
        }
    }

    // throws LicensingException
    private function addItemToBasket() : Bool {
        try {
            var anyType : Any = new BasketRequestHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var method : Method = Type.getClass(anyType).getMethod("addItemToBasket", null);
            var emptyBoolean : Null<Bool> = (cast method.invoke(anyType, null) : Null<Bool>);
            return emptyBoolean;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to add item from Basket";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "addItemToBasket()", e);
            }
            return false;
        }
    }

    // throws LicensingException
    private function removeItemFromBasket() : Bool {
        try {
            var anyType : Any = new BasketRequestHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var method : Method = Type.getClass(anyType).getMethod("removeItemFromBasket", null);
            var emptyBoolean : Null<Bool> = (cast method.invoke(anyType, null) : Null<Bool>);
            return emptyBoolean;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to remove item from Basket";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "removeItemFromBasket()", e);
            }
            return false;
        }
    }

    // throws LicensingException
    private function adjustBasket() : Bool {
        try {
            var anyType : Any = new BasketRequestHelperFactory().getInstance(this.propertiesHashMap, this.pageContext);
            var method : Method = Type.getClass(anyType).getMethod("adjustBasket", null);
            var emptyBoolean : Null<Bool> = (cast method.invoke(anyType, null) : Null<Bool>);
            return emptyBoolean;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to Adjust Basket";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "adjustBasket()", e);
            }
            return false;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.command != null) {
                this.propertiesHashMap = StdUtil.getInstance().createHashMap();
                this.propertiesHashMap.put(StoreFrontData.getInstance().NAME, this.storeName);
                if (Reflect.compare(this.command, BasketData.INSERT) == 0) {
                    if (!this.addItemToBasket()) {
                        this.pageContext.getOut().println("Item is not currently being sold.<p/>");
                    }
                } else if (Reflect.compare(this.command, BasketData.DELETE) == 0) {
                    this.removeItemFromBasket();
                } else if (Reflect.compare(this.command, BasketData.ADJUST) == 0) {
                    this.adjustBasket();
                } else if (Reflect.compare(this.command, BasketData.ISEMPTY) == 0) {
                    if (this.isBasketEmpty()) {
                        return this.EVAL_BODY_INCLUDE;
                    } else {
                        return SKIP_BODY;
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

