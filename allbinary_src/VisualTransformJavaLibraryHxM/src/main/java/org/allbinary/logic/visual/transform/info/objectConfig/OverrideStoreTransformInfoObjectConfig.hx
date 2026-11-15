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
package org.allbinary.logic.visual.transform.info.objectConfig;

import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.w3c.dom.Document;

class OverrideStoreTransformInfoObjectConfig extends GenericStoreTransformInfoObjectConfig {
    public function new(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface) {
        super(abeClientInformation, transformInfoInterface);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface, document : Document) {
        super(abeClientInformation, transformInfoInterface, document);
        this.setDocument(this.generate(this.toXmlDoc()));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface, name : String, type : String) {
        super(abeClientInformation, transformInfoInterface, name, type);
        this.setDocument(this.generate(this.toXmlDoc()));
    }

    // throws Exception
    public function generate(objectConfigDocument : Document) : Document {
        var newObjectConfigDocument : Document = super.generate(objectConfigDocument);
        return newObjectConfigDocument;
    }

}

