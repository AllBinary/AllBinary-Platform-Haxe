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
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFront;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.basket.BasketData;
import org.allbinary.business.user.commerce.inventory.basket.BasketInterface;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntityFactory;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;

class BasketRequestHelper extends TagHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    private final weblisketSession : WeblisketSession;
    private final storeFrontInterface : StoreFrontInterface = null;
    private final propertiesHashMap : HashMap;
    private final pageContext : PageContext;
    private final request : HttpServletRequest;
    private var id : String = null;
    private var num : String = null;
    private final MAX : Int = 200;
    public function new(propertiesHashMap : HashMap, pageContext : PageContext) {
        super();
        this.propertiesHashMap = propertiesHashMap;
        this.pageContext = pageContext;
        this.request = (cast pageContext.getRequest() : HttpServletRequest);
        var storeName : String = (cast propertiesHashMap.get(StoreFrontData.getInstance().NAME) : String);
        if (storeName != null) {
            this.storeFrontInterface = StoreFrontFactory.getInstance(storeName);
        } else {
            this.storeFrontInterface = new StoreFront();
        }
        this.weblisketSession = new WeblisketSession(propertiesHashMap, pageContext);
        this.getFormData();
    }

    private function getFormData() : Void {
        this.id = this.request.getParameter(basicItemData.ID);
        this.num = this.request.getParameter(BasketData.ITEMTOTALINBASKET);
    }

    public function addItemToBasket() : Null<Bool> {
        try {
            if (this.id != null && this.num != null) {
                var basket : BasketInterface = this.weblisketSession.getOrder().getBasket();
                if (InventoryEntityFactory.getInstance().getInventoryEntityInstance().getItem(this.id) == null) {
                    return false;
                }
                basket.addItem(this.id, num);
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF("Successfully added item to Basket", this, "addItemToBasket()");
            }
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "addItemToBasket()", e);
            }
            return false;
        }
    }

    public function removeItemFromBasket() : Null<Bool> {
        try {
            if (this.id != null) {
                var basket : BasketInterface = this.weblisketSession.getOrder().getBasket();
                basket.removeItem(this.id);
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF("Successfully removed item from Basket", this, "removeItemFromBasket()");
            }
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "removeItemFromBasket()", e);
            }
            return false;
        }
    }

    public function adjustBasket() : Null<Bool> {
        try {
            var basket : BasketInterface = this.weblisketSession.getOrder().getBasket();
            if (this.id != null && this.num != null) {
                basket.adjustItem(this.id, this.num);
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGS)) {
                this.logUtil.putF("Successfull Adjusted Basket", this, "adjustBasket()");
            }
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "adjustBasket()", e);
            }
            return false;
        }
    }

}

