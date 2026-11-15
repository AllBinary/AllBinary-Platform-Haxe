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
package org.allbinary.logic.visual.transform;

//import javax.xml.transform.URIResolver;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.CustomUriResolver;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigAndManipulatorFactory;
import org.allbinary.logic.visual.transform.info.objectConfig.TransformInfoObjectConfigInterface;

class TransformInfoCustomUriTransformer extends BasicTransformer {
    public function new(abeClientInformation : AbeClientInformationInterface, transformInfoInterface : TransformInfoInterface) {
        super(abeClientInformation, transformInfoInterface);
        final transformInfoObjectConfigInterface : TransformInfoObjectConfigInterface = (cast TransformInfoObjectConfigAndManipulatorFactory.getInstance().getInstance(abeClientInformation, transformInfoInterface) : TransformInfoObjectConfigInterface);
        this.setURIResolver((cast new CustomUriResolver(transformInfoObjectConfigInterface.getImportUriPath(), (cast this.getURIResolver() : BasicUriResolver)) : URIResolver));
    }

}

