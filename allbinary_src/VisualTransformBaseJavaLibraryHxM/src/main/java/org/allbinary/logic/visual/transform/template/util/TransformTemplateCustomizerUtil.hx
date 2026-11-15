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
package org.allbinary.logic.visual.transform.template.util;

//import java.util.HashMap;
import org.allbinary.globals.GLOBALS2;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.visual.transform.info.CustomizerTransformInfoData;
import org.allbinary.logic.visual.transform.template.customizer.bodies.BodyData;
import org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class TransformTemplateCustomizerUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : TransformTemplateCustomizerUtil = new TransformTemplateCustomizerUtil();
    public static function getInstance() : TransformTemplateCustomizerUtil {
        return TransformTemplateCustomizerUtil.instance;
    }

    private final CUSTOMIZER_NAME : String;
    private final BODY_VIEWNAMEKEY : String;
    private final TITLE_VIEWNAMEKEY : String;
    private final GLOBALS_NEW : String;
    private final GLOBALS_INSERT : String;
    private final GLOBALS_DELETE : String;
    private final GLOBALS_EDIT : String;
    private final GLOBALS_UPDATE : String;
    public function new() {
        final commonStrings : CommonStrings = CommonStrings.getInstance();
        final SPACE : String = CommonSeps.getInstance().SPACE;
        this.CUSTOMIZER_NAME = SPACE + CustomizerTransformInfoData.NAME;
        this.BODY_VIEWNAMEKEY = SPACE + BodyData.getInstance().VIEWNAMEKEY;
        this.TITLE_VIEWNAMEKEY = SPACE + TitleData.getInstance().VIEWNAMEKEY;
        this.GLOBALS_NEW = GLOBALS2.NEW + SPACE;
        this.GLOBALS_INSERT = commonStrings.INSERT + SPACE;
        this.GLOBALS_DELETE = commonStrings.DELETE + SPACE;
        this.GLOBALS_EDIT = GLOBALS2.EDIT + SPACE;
        this.GLOBALS_UPDATE = commonStrings.UPDATE + SPACE;
    }

    public function getPageNameHack(viewName : String, storeName : String) : String {
        final SPACE : String = CommonSeps.getInstance().SPACE;
        final ONE_EMPTY_STRING_ARRAY : haxe.ds.Vector<String> = StringUtil.getInstance().ONE_EMPTY_STRING_ARRAY;
        var hashMap : HashMap = StdUtil.getInstance().createHashMap();
        hashMap.put(haxe.ds.Vector.fromArrayCopy([viewName + SPACE]), ONE_EMPTY_STRING_ARRAY);
        hashMap.put(haxe.ds.Vector.fromArrayCopy([storeName + SPACE]), ONE_EMPTY_STRING_ARRAY);
        hashMap.put(haxe.ds.Vector.fromArrayCopy([this.CUSTOMIZER_NAME]), ONE_EMPTY_STRING_ARRAY);
        hashMap.put(haxe.ds.Vector.fromArrayCopy([this.BODY_VIEWNAMEKEY]), ONE_EMPTY_STRING_ARRAY);
        hashMap.put(haxe.ds.Vector.fromArrayCopy([this.TITLE_VIEWNAMEKEY]), ONE_EMPTY_STRING_ARRAY);
        hashMap.put(haxe.ds.Vector.fromArrayCopy([this.GLOBALS_NEW]), ONE_EMPTY_STRING_ARRAY);
        hashMap.put(haxe.ds.Vector.fromArrayCopy([this.GLOBALS_INSERT]), ONE_EMPTY_STRING_ARRAY);
        hashMap.put(haxe.ds.Vector.fromArrayCopy([this.GLOBALS_DELETE]), ONE_EMPTY_STRING_ARRAY);
        hashMap.put(haxe.ds.Vector.fromArrayCopy([this.GLOBALS_EDIT]), ONE_EMPTY_STRING_ARRAY);
        hashMap.put(haxe.ds.Vector.fromArrayCopy([this.GLOBALS_UPDATE]), ONE_EMPTY_STRING_ARRAY);
        var replace : Replace = null;
        var rootViewName : String = replace.all(viewName);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("RootViewName for ObjectConfig: " + rootViewName, this, "getPageNameHack");
        }
        return rootViewName;
    }

}

