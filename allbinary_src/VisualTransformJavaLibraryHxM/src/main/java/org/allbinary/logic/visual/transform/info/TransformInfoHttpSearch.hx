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
package org.allbinary.logic.visual.transform.info;

import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.control.search.SearchRequest;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

class TransformInfoHttpSearch extends TransformInfoHttp {
    public function new(searchRequest : SearchRequest) {
        super(searchRequest.getPropertiesHashMap(), searchRequest.getPageContext());
        if (searchRequest.getStoreFront().getName() != null) {
            this.setStoreName(searchRequest.getStoreFront().getName());
        } else {
            this.setStoreName(StringUtil.getInstance().EMPTY_STRING);
        }
        var dataFileName : String = searchRequest.getXslFile();
        this.setTemplateFile(dataFileName);
    }

    // throws Exception
    private function getPath() : String {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(URLGLOBALS.getMainPath());
        stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH);
        stringBuffer.append(this.getStoreName());
        stringBuffer.append(AbPathData.getInstance().SEPARATOR);
        return Std.string(stringBuffer);
    }

    // throws Exception
    public function getTemplateFilePath() : AbPath {
        return new AbPath(this.getPath(), this.getTemplateFile());
    }

    // throws Exception
    public function getObjectConfigFilePath() : AbPath {
        return new AbPath(this.getPath(), this.getObjectConfigFile());
    }

    // throws Exception
    public function getDataFilePath() : AbPath {
        return new AbPath(this.getPath(), this.getDataFile());
    }

}

