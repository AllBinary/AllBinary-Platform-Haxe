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
import org.allbinary.business.context.modules.storefront.StoreFront;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.string.CommonSeps;

class StoreFrontHelper extends TagHelper {
    private final storeFrontInterface : StoreFrontInterface = null;
    private final currentLocation : String = null;
    private final currentHomeLocation : String = null;
    public function new(hashMap : HashMap, pageContext : PageContext) {
        super();
        var storeName : String = (cast hashMap.get(StoreFrontData.getInstance().NAME) : String);
        if (storeName != null) {
            this.storeFrontInterface = StoreFrontFactory.getInstance(storeName);
            this.currentLocation = new Replace(CommonSeps.getInstance().SPACE, "%20").all(this.storeFrontInterface.getCurrentHostName() + this.storeFrontInterface.getCurrentHostNamePath());
            this.currentHomeLocation = new Replace(CommonSeps.getInstance().SPACE, "%20").all(this.storeFrontInterface.getCurrentHomeHostName() + this.storeFrontInterface.getCurrentHomeHostNamePath());
        } else {
            final stringUtil : StringUtil = StringUtil.getInstance();
            this.storeFrontInterface = new StoreFront();
            this.currentLocation = stringUtil.EMPTY_STRING;
            this.currentHomeLocation = stringUtil.EMPTY_STRING;
        }
    }

    public function getCurrentLocation() : String {
        return this.currentLocation;
    }

    public function getCurrentHomeLocation() : String {
        return this.currentHomeLocation;
    }

}

