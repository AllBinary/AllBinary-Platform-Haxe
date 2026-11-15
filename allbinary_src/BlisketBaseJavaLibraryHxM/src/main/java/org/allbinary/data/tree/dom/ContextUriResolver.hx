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
package org.allbinary.data.tree.dom;

//import javax.xml.transform.Source;
//import javax.xml.transform.TransformerException;
//import javax.xml.transform.URIResolver;
//import javax.xml.transform.stream.StreamSource;
import org.allbinary.globals.FREEBLISKET_PATH_GLOBALS;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.crypt.file.CryptFileReader;
import org.allbinary.logic.io.path.AbFilePath;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData;

class ContextUriResolver implements URIResolver {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final uriResolverStrings : URIResolverStrings = URIResolverStrings.getInstance();
    private var basicURIResolver : BasicUriResolver;
    public function new(basicURIResolver : BasicUriResolver) {
        this.basicURIResolver = basicURIResolver;
    }

    // throws TransformerException
    public function resolve(href : String, base : String) : Source {
        try {
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(URLGLOBALS.getMainPath());
            stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH);
            stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().INSTALLPATH);
            stringBuffer.append(AbPathData.getInstance().SEPARATOR);
            stringBuffer.append(href);
            final fileAbPath : AbPath = new AbFilePath(Std.string(stringBuffer));
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().XMLLOGGING)) {
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append(this.uriResolverStrings.ATTEMPT);
                stringBuffer.append(href);
                stringBuffer.append(this.uriResolverStrings.BASE);
                stringBuffer.append(base);
                stringBuffer.append(this.uriResolverStrings.NEW_PATH);
                stringBuffer.append(Std.string(fileAbPath));
                stringBuffer.append(this.uriResolverStrings.NOTE);
                stringBuffer.append(FREEBLISKET_PATH_GLOBALS.getInstance().XSLPATH);
                stringBuffer.append(this.uriResolverStrings.URL_GLOBAL);
                stringBuffer.append(this.uriResolverStrings.REQUIRED_EXTENSION);
                stringBuffer.append(this.basicURIResolver.getExtension());
                this.logUtil.putF(Std.string(stringBuffer), this, this.uriResolverStrings.RESOLVE);
            }
            return new StreamSource(new CryptFileReader(TransformInfoTemplateData.getInstance().UNCRYPTED_EXTENSION, TransformInfoTemplateData.getInstance().ENCRYPTED_EXTENSION).getInputStream(fileAbPath));
        } catch (e : TransformerException) {
            throw e;
        } catch (e : haxe.Exception) {
            throw new TransformerException(e);
        }
    }

    public function toString() : String {
        try {
            return URLGLOBALS.getMainPath() + FREEBLISKET_PATH_GLOBALS.getInstance().INSTALLPATH + this.uriResolverStrings.IMPORT_URL;
        } catch (e : haxe.Exception) {
            return "ContextUriResolver - Does not work without webapp path should be changed";
        }
    }

}

