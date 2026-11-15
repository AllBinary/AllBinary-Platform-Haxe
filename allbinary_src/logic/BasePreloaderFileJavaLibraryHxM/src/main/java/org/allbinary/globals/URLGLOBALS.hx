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
package org.allbinary.globals;


class URLGLOBALS {
    private static var urlGlobalsInterface : UrlGlobalsInterface = AppUrlGlobals.NULL_APP_URL_GLOBALS;
    public static function init(urlGlobalsInterface : UrlGlobalsInterface) : Void {
        URLGLOBALS.urlGlobalsInterface = urlGlobalsInterface;
    }

    public static function isTestingMode() : Bool {
        return URLGLOBALS.urlGlobalsInterface.isTestingMode();
    }

    public static function getWebappPath() : String {
        return URLGLOBALS.urlGlobalsInterface.getWebappPath();
    }

    public static function getTestHtmlPath() : String {
        return URLGLOBALS.urlGlobalsInterface.getTestHtmlPath();
    }

    // throws Exception
    public static function getMainPath() : String {
        return URLGLOBALS.urlGlobalsInterface.getMainPath();
    }

    public function new() {
    }
}

