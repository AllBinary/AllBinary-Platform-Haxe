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
//import javax.xml.transform.URIResolver;
//import javax.xml.transform.stream.StreamSource;
import org.allbinary.logic.visual.transform.info.CompositeTransformInfoInterface;

interface BasicTransformerInterface extends CompositeTransformInfoInterface {
    function setInputStream(inputStream : InputStream) : Void;

    function setURIResolver(uriResolver : URIResolver) : Void;

    function getStreamSource() : StreamSource;

    function getInputStream() : InputStream;

    function getURIResolver() : URIResolver;

    // throws Exception
    function translate(xmlDocumentStr : String) : String;

}

