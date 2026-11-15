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
package admin.tags;

//import java.lang.reflect.Method;
//import javax.servlet.jsp.JspTagException;
import admin.taghelpers.StaticPagesHelperFactory;
import admin.taghelpers.StaticPagesRequestHelperFactory;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.search.SearchData;
import org.allbinary.logic.system.security.licensing.LicensingException;
import org.allbinary.logic.visual.transform.info.TransformInfoData;

class StaticPagesTag extends TableTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var xslFile : String = null;
    public function new() {
        super();
        this.setTagHelperFactory(new StaticPagesHelperFactory());
        this.setTagRequestHelperFactory(new StaticPagesRequestHelperFactory());
    }

    public function setXsl(value : String) : Void {
        this.xslFile = value;
    }

    // throws LicensingException
    public function generateStaticPages() : String {
        try {
            var anyType : Any = new StaticPagesRequestHelperFactory().getInstance(this.getPropertiesHashMap(), this.pageContext);
            var helperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = helperClass.getMethod("generateStaticPages", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to generate staticpages table";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "generateStaticPages()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    public function makePublic() : String {
        try {
            var anyType : Any = new StaticPagesRequestHelperFactory().getInstance(this.getPropertiesHashMap(), this.pageContext);
            var helperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = helperClass.getMethod("makePublic", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to makePublic";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "makePublic()", e);
            }
            return error;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.isEnabled()) {
                if (this.getCommand() != null) {
                    if (this.getCommand().compareTo(SearchData.GENERATESTATICPAGES) == 0) {
                        this.getPropertiesHashMap().put(TransformInfoData.getInstance().TEMPLATEFILENAME, this.xslFile);
                        final output : String = this.generateStaticPages();
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                            this.pageContext.getOut().print(output);
                        }
                    } else if (this.getCommand().compareTo(SearchData.MAKEPUBLIC) == 0) {
                        final output : String = this.makePublic();
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                            this.pageContext.getOut().print(output);
                        }
                    } else {
                        return super.doStartTag();
                    }
                }
            }
            return SKIP_BODY;
        } catch (e : LicensingException) {
            AbResponseHandler.sendJspTagLicensingRedirect(this.pageContext, e);
            return SKIP_BODY;
        } catch (e : haxe.Exception) {
            AbResponseHandler.sendJspTagRedirect(this.pageContext, e);
            return SKIP_BODY;
        }
    }

}

