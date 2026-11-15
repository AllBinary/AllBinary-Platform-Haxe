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
package admin.taghelpers;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.jsp.PageContext;
import org.allbinary.globals.GLOBALS2;
import org.allbinary.logic.communication.http.request.RequestMapInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import tags.HelperTag;

class MultipartRequestParamForwardHelper {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final pageContext : PageContext;
    private final requestMapInterface : RequestMapInterface;
    private final page : String;
    private final command : String;
    private final paramVector : BasicArrayList;
    public function new(parentHelperTag : HelperTag, page : String, command : String, paramVector : BasicArrayList, pageContext : PageContext) {
        this.pageContext = pageContext;
        this.page = page;
        this.command = command;
        this.paramVector = paramVector;
        this.requestMapInterface = InventoryItemViewParentTagHelper.getInstance().getRequestMapInterface(parentHelperTag);
    }

    // throws Exception
    public function forward() : Void {
        try {
            if (this.shouldForward()) {
                var params : String = this.getParams();
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append(this.page);
                stringBuffer.append(params);
                this.pageContext.forward(Std.string(stringBuffer));
            }
        } catch (e : haxe.Exception) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put(commonStrings.EXCEPTION, this, "forward()", e);
            }
        }
    }

    private function getParams() : String {
        final commonSeps : CommonSeps = CommonSeps.getInstance();
        final AMP : String = commonSeps.AMPERSAND;
        final QUESTION : String = commonSeps.QUESTION;
        final EQUALS : String = commonSeps.EQUALS;
        final hashMap : HashMap = this.requestMapInterface.getRequestHashMap();
        var stringBuffer : StringMaker = new StringMaker();
        var size : Int = this.paramVector.size();
        for (index in 0...size) {
            var key : String = (cast this.paramVector.get(index) : String);
            var value : String = (cast hashMap.get(key) : String);
            if (index != 0) {
                stringBuffer.append(AMP);
            } else {
                stringBuffer.append(QUESTION);
            }
            stringBuffer.append(key);
            stringBuffer.append(EQUALS);
            stringBuffer.append(value);
        }
        return Std.string(stringBuffer);
    }

    private function shouldForward() : Bool {
        final hashMap : HashMap = this.requestMapInterface.getRequestHashMap();
        var requestCommand : String = (cast hashMap.get(GLOBALS2.ADMINCOMMAND) : String);
        if (StringValidationUtil.getInstance().isEmpty(this.command) || (!StringValidationUtil.getInstance().isEmpty(requestCommand) && Reflect.compare(this.command, requestCommand) == 0)) {
            return true;
        }
        return false;
    }

}

