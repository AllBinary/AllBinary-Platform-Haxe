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

import org.allbinary.business.init.InitInfo;
import org.allbinary.logic.string.StringValidationUtil;

class WebAppUrlGlobals extends UrlGlobalsInterface {
    private var path : String = null;
    private var isWebappPathSet : Bool = false;
    public function isTestingMode() : Bool {
        return InitInfo.getInstance().isTesting();
    }

    public function getWebappPath() : String {
        return this.path;
    }

    // synchronized
    public function setWebappPath(path : String) : Void {
        path = path;
        this.isWebappPathSet = true;
    }

    public function getTestHtmlPath() : String {
        return InitInfo.getInstance().getTestHtmlPath();
    }

    // throws Exception
    public function getMainPath() : String {
        var mainPath : String = InitInfo.getInstance().getMainPath();
        if (!StringValidationUtil.getInstance().isEmpty(mainPath)) {
            return mainPath;
        } else if (this.isWebappPathSet) {
            return this.getWebappPath();
        } else {
            throw new haxe.Exception("Webapp Path is not set");
        }
    }

    public function new() {
        super();
    }
}

