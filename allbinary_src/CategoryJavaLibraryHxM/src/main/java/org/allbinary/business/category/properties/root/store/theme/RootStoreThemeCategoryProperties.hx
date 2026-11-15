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
package org.allbinary.business.category.properties.root.store.theme;

//import java.util.HashMap;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.category.properties.root.store.RootStoreCategoryProperties;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpStoreInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Node;

class RootStoreThemeCategoryProperties extends RootStoreCategoryProperties {
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, abPath : AbPath) {
        super(transformInfoInterface, abPath);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, node : Node) {
        super(transformInfoInterface, node);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, categoryPropertiesHashMap : HashMap) {
        super(transformInfoInterface, categoryPropertiesHashMap);
    }

    // throws Exception
    public function initPath() : Void {
        var transformInfoHttpStoreInterface : TransformInfoHttpStoreInterface = (cast this.transformInfoInterface : TransformInfoHttpStoreInterface);
        var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(transformInfoHttpStoreInterface.getStoreName());
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH);
        stringBuffer.append(storeFrontInterface.getName());
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().THEMEPATH);
        var abPath : AbPath = new AbPath(stringBuffer.toString(), StringUtil.getInstance().EMPTY_STRING);
        var httpServletRequest : HttpServletRequest = (cast transformInfoHttpStoreInterface.getPageContext().getRequest() : HttpServletRequest);
        this.webAppAbPath = new AbPath(httpServletRequest.getContextPath() + abPath.toString(), StringUtil.getInstance().EMPTY_STRING);
        this.setRootFilePath(new AbPath(URLGLOBALS.getMainPath() + abPath.toString(), StringUtil.getInstance().EMPTY_STRING));
    }

}

