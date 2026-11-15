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

//import java.io.InputStream;
//import java.io.StringBufferInputStream;
//import javax.xml.transform.URIResolver;
//import javax.xml.transform.stream.StreamSource;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGenerator;
import org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGeneratorFactory;
import org.allbinary.string.CommonStrings;

class AbTransformer implements BasicTransformerInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var transformInfoInterface : TransformInfoInterface;
    private var inputStream : InputStream = null;
    private var uriResolver : URIResolver = null;
    public function new(transformInfoInterface : TransformInfoInterface) {
        this.transformInfoInterface = transformInfoInterface;
    }

    public function getTransformInfoInterface() : TransformInfoInterface {
        return this.transformInfoInterface;
    }

    public function setInputStream(inputStream : InputStream) : Void {
        this.inputStream = inputStream;
    }

    public function setURIResolver(uriResolver : URIResolver) : Void {
        this.uriResolver = uriResolver;
    }

    public function getInputStream() : InputStream {
        return this.inputStream;
    }

    public function getURIResolver() : URIResolver {
        return this.uriResolver;
    }

    public function getStreamSource() : StreamSource {
        return new StreamSource(this.getInputStream());
    }

    // throws Exception
    public function translate(xmlDocumentStr : String) : String {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().XMLLOGGING)) {
                this.logUtil.putF("xml: \n" + xmlDocumentStr, this, "translate(String xmlDocumentStr)");
            }
            if (this.getURIResolver() == null) {
                throw new haxe.Exception("No URIResolver");
            }
            var result : String = XslHelper.getInstance().translate(this.getURIResolver(), new StreamSource(this.getInputStream()), new StreamSource(new StringBufferInputStream(xmlDocumentStr)));
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().XSLLOGGING)) {
                this.logUtil.putF("translated xml: " + result, this, "translate(String xmlDocumentStr)");
            }
            var transformInfoObjectConfigGeneratorInterface : TransformInfoObjectConfigGenerator = TransformInfoObjectConfigGeneratorFactory.getInstance().getInstance(this.getTransformInfoInterface());
            return transformInfoObjectConfigGeneratorInterface.process(result);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(this.transformInfoInterface.log(), this, "translate(document)", e);
            }
            throw e;
        }
    }

}

