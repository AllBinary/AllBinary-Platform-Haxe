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
import admin.taghelpers.CategoryHelperFactory;
import admin.taghelpers.CategoryRequestHelperFactory;
import org.allbinary.business.category.CategoryData;
import org.allbinary.logic.communication.http.request.AbResponseHandler;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.security.licensing.LicensingException;
import org.allbinary.logic.visual.transform.info.TransformInfoData;

class CategoryTag extends TableTag {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var xsl : String = null;
    public function new() {
        super();
        this.setTagHelperFactory(new CategoryHelperFactory());
        this.setTagRequestHelperFactory(new CategoryRequestHelperFactory());
    }

    public function setXsl(value : String) : Void {
        this.xsl = value;
    }

    // throws LicensingException
    private function viewCategory() : String {
        try {
            var anyType : Any = new CategoryRequestHelperFactory().getInstance(this.getPropertiesHashMap(), this.pageContext);
            var helperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = helperClass.getMethod("viewCategory", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to view a Category";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "viewCategory()", e);
            }
            return error;
        }
    }

    // throws LicensingException
    private function viewCategories() : String {
        try {
            var anyType : Any = new CategoryRequestHelperFactory().getInstance(this.getPropertiesHashMap(), this.pageContext);
            var helperClass : Class<Dynamic> = Type.getClass(anyType);
            var method : Method = helperClass.getMethod("viewCategories", null);
            var result : String = (cast method.invoke(anyType, null) : String);
            return result;
        } catch (e : LicensingException) {
            throw e;
        } catch (e : haxe.Exception) {
            var error : String = "Failed to view a Categories";
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "viewCategories()", e);
            }
            return error;
        }
    }

    // throws JspTagException
    public function doStartTag() : Int {
        try {
            if (this.isEnabled()) {
                if (this.getCommand() != null) {
                    this.getPropertiesHashMap().put(TransformInfoData.getInstance().TEMPLATEFILENAME, this.xsl);
                    if (this.getCommand().compareTo(CategoryData.getInstance().VIEW) == 0) {
                        var output : String = this.viewCategory();
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                            pageContext.getOut().print(output);
                        }
                    } else if (this.getCommand().compareTo(CategoryData.getInstance().VIEW) == 0) {
                        var output : String = this.viewCategories();
                        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().JSPTAGEXTRAOUTPUT)) {
                            pageContext.getOut().print(output);
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

