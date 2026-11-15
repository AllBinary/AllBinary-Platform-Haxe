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
package org.allbinary.log;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.logic.StdUtil;

class LOGGING {
    private var name : String;
    private static var logging : BasicArrayList = new BasicArrayListD();
    public function new(value : String) {
        this.name = value;
        LOGGING.logging.add(value);
    }

    public static function contains(logType : LOGGING) : Bool {
        return LOGGING.logging.contains(logType.toString());
    }

    public function toString() : String {
        return this.name;
    }

    public static final GRAPHICSPAINT : LOGGING = new LOGGING("Graphics Paint");
    public static final GRAPHICSCREATION : LOGGING = new LOGGING("Graphics Creation");
    public static final GRAPHICSDELETION : LOGGING = new LOGGING("Graphics Deletion");
    public static final LOADINGERROR : LOGGING = new LOGGING("Loading Error");
    public static final MENUEVENT : LOGGING = new LOGGING("Menu Action Event");
    public static final MOUSEEVENT : LOGGING = new LOGGING("Mouse Action Event");
    public static final KEYEVENT : LOGGING = new LOGGING("Keyboard Action Event");
    public static final ACTIONEVENT : LOGGING = new LOGGING("Action Event");
    public static final ADJUSTMENTEVENT : LOGGING = new LOGGING("Adjustment Action Event");
    public static final COMPONENTEVENT : LOGGING = new LOGGING("Component Action Event");
    public static final CONTAINEREVENT : LOGGING = new LOGGING("Container Action Event");
    public static final FOCUSEVENT : LOGGING = new LOGGING("Focus Action Event");
    public static final HIERARCHYEVENT : LOGGING = new LOGGING("Hierarchy Action Event");
    public static final INPUTEVENT : LOGGING = new LOGGING("Input Action Event");
    public static final INVOCATIONEVENT : LOGGING = new LOGGING("Invocation Action Event");
    public static final ITEMEVENT : LOGGING = new LOGGING("Item Action Event");
    public static final PAINTEVENT : LOGGING = new LOGGING("Paint Action Event");
    public static final TEXTEVENT : LOGGING = new LOGGING("Text Action Event");
    public static final WINDOWEVENT : LOGGING = new LOGGING("Window Action Event");
}

