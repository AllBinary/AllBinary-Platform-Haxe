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

//import java.util.HashMap;
//import javax.servlet.jsp.PageContext;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigNoManipulationFactory;

class TransformInfoHttpStoreNoManipulation extends TransformInfoHttpStore {
    public function new(propertiesHashMap : HashMap, pageContext : PageContext) {
        super(propertiesHashMap, pageContext);
    }

    // throws Exception
    public function setObjectConfigFile(value : String) : Void {
        this.setObjectConfigFileName(value);
        this.setObjectConfigInterface(TransformInfoObjectConfigNoManipulationFactory.getInstance().getInstance(this, this.getObjectConfigFilePath()));
    }

    // throws Exception
    public function setObjectConfig(value : String) : Void {
        throw new haxe.Exception("Should not set from config");
    }

}

