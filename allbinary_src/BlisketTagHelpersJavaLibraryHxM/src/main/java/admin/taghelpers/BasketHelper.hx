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
//import javax.servlet.jsp.PageContext;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.basket.BasketInterface;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.communication.log.LogUtil;

class BasketHelper extends TagHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var weblisketSession : WeblisketSession;
    private var storeFrontInterface : StoreFrontInterface = null;
    private var propertiesHashMap : HashMap;
    private var pageContext : PageContext;
    private final MAX : Int = 200;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        this.propertiesHashMap = hashMap;
        this.pageContext = pageContext;
        var storeName : String = (cast this.propertiesHashMap.get(StoreFrontData.getInstance().NAME) : String);
        if (storeName != null) {
            this.storeFrontInterface = StoreFrontFactory.getInstance(storeName);
        }
        this.weblisketSession = new WeblisketSession(hashMap, pageContext);
    }

    public function isBasketEmpty() : Null<Bool> {
        try {
            var basket : BasketInterface = this.weblisketSession.getOrder().getBasket();
            if (Std.int(basket.getNumberOfItems()) <= 0) {
                return true;
            } else {
                return false;
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "isBasketEmpty()", e);
            }
            return true;
        }
    }

}

