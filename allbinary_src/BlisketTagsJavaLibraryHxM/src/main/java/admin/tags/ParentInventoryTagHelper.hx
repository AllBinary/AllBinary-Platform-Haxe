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

//import javax.servlet.jsp.tagext.Tag;
import org.allbinary.logic.string.StringMaker;

class ParentInventoryTagHelper {
    private static final instance : ParentInventoryTagHelper = new ParentInventoryTagHelper();
    public static function getInstance() : ParentInventoryTagHelper {
        return ParentInventoryTagHelper.instance;
    }

    // throws Exception
    public function isValid(tagClass : Any, parentTag : Tag) : Void {
        if (parentTag == null) {
            throw new haxe.Exception("Must have parent tag.");
        } else if (!(Std.isOfType(parentTag, tags.HelperTag))) {
            var stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append("Must have at least a ");
            stringBuffer.append("tags.HelperTag");
            stringBuffer.append(" as parent");
            stringBuffer.append("and not: ");
            stringBuffer.append(Type.getClassName(Type.getClass(parentTag)));
            throw new haxe.Exception(Std.string(stringBuffer));
        }
    }

    public function new() {
    }
}

