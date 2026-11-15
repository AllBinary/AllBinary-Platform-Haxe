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
package views.compound.objectConfig;

//import java.io.ByteArrayInputStream;
//import java.io.InputStream;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tree.dom.document.DocumentToNode;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.visual.transform.TransformFactory;
import org.allbinary.logic.visual.transform.TransformInterface;
import org.allbinary.logic.visual.transform.info.RootTransformInfoData;
import org.allbinary.logic.visual.transform.info.TransformInfoData;
import org.allbinary.logic.visual.transform.info.TransformInfoDomNode;
import org.allbinary.logic.visual.transform.info.TransformInfoHttpInterface;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.objectConfig.GenericStoreTransformInfoObjectConfig;
import org.allbinary.string.CommonSeps;
import org.w3c.dom.Document;

class CompoundContextTransformInfoObjectConfig extends GenericStoreTransformInfoObjectConfig {
    public final logUtil : LogUtil = LogUtil.getInstance();
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
    public function get() : String {
        var storeName : String = this.getTransformInfoInterface().getStoreName();
        var httpTransformInfoInterface : TransformInfoHttpInterface = (cast this.getTransformInfoInterface() : TransformInfoHttpInterface);
        var templateNameOverride : String = StringUtil.getInstance().getNonNull((cast httpTransformInfoInterface.getPropertiesHashMap().get(TransformInfoData.getInstance().PARTIAL) : String));
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(storeName);
        stringBuffer.append(templateNameOverride);
        stringBuffer.append(CommonSeps.getInstance().SPACE);
        stringBuffer.append(RootTransformInfoData.NAME);
        var rootComponentInterface : TransformInterface = TransformFactory.getInstance().getInstance(abeClientInformation, stringBuffer.toString(), this.getTransformInfoInterface());
        var viewVector : BasicArrayList = this.getTransformDomNodes();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Root View Called with: " + viewVector.size(), this, "get(transformInfoInterface)");
        }
        var rootView : String = rootComponentInterface.view();
        final startXMLHeader : String = "<xsl:text disable-output-escaping=\"yes\" ><![CDATA[";
        final endXMLHeader : String = "]]></xsl:text>";
        final size : Int = viewVector.size();
        for (index in 0...size) {
            var objectConfigTransformInfoDomNode : TransformInfoDomNode = (cast viewVector.get(index) : TransformInfoDomNode);
            var templateKey : String = objectConfigTransformInfoDomNode.getReplaceKey();
            var componentInterface : TransformInterface = TransformFactory.getInstance().getInstance(abeClientInformation, objectConfigTransformInfoDomNode.getTransformInfoInterface().getName(), this.getTransformInfoInterface());
            var replacementViewString : String = componentInterface.view();
            replacementViewString = DocumentToNode.convertDocumentToNodeString(replacementViewString);
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append(startXMLHeader);
            stringBuffer.append(replacementViewString);
            stringBuffer.append(endXMLHeader);
            var templateValue : String = stringBuffer.toString();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append("Replacing: ");
                stringBuffer.append(templateKey);
                stringBuffer.append(" with ");
                stringBuffer.append(templateValue);
                this.logUtil.putF(stringBuffer.toString(), this, "get()");
            }
            var replace : Replace = new Replace(templateKey, templateValue);
            rootView = replace.all(rootView);
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("End: Result of a compound view: " + rootView, this, "get()");
        }
        return rootView;
    }

    // throws Exception
    public function createInputStream() : InputStream {
        var completeTemplateViewBytes : haxe.ds.Vector<Int> = this.get().getBytes();
        var bais : ByteArrayInputStream = new ByteArrayInputStream(completeTemplateViewBytes);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEW)) {
            this.logUtil.putF("Template: " + haxe.io.Bytes.ofData(completeTemplateViewBytes).toString().toString(), this, "createInputStream()");
        }
        return bais;
    }

}

