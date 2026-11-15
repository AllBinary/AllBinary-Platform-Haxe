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
package views.compound;

//import java.io.InputStream;
//import javax.xml.transform.URIResolver;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.StoreUriResolver;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;
import org.allbinary.logic.visual.transform.AbTransformer;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import views.compound.objectConfig.CompoundContextTransformInfoObjectConfig;

class CompoundTransform extends AbTransformer {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.setURIResolver((cast new StoreUriResolver(this.getTransformInfoInterface(), (cast this.getURIResolver() : BasicUriResolver)) : URIResolver));
        var objectConfig : CompoundContextTransformInfoObjectConfig = new CompoundContextTransformInfoObjectConfig(this.abeClientInformation, this.getTransformInfoInterface(), this.getTransformInfoInterface().getObjectConfigInterface().toXmlDoc());
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("\nObjectConfig: \n" + objectConfig.toString(), this, this.commonStrings.CONSTRUCTOR);
        }
        var templateInputStream : InputStream = objectConfig.createInputStream();
        this.setInputStream(templateInputStream);
    }

}

