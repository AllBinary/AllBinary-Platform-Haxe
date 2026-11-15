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
package org.allbinary.business.category;

import org.allbinary.data.tree.dom.DomNodeHelper;
import org.allbinary.data.tree.dom.DomSearchHelper;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringUtil;
import org.apache.commons.lang3.StringUtils;
import org.w3c.dom.Attr;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;

class CategoryUtil {
    public function new() {
    }

    // synchronized
    public static function getPathLevel(categoryPath : AbPath) : Int {
        var count : Int = StringUtils.countMatches(Std.string(categoryPath), AbPathData.getInstance().SEPARATOR);
        return count;
    }

    // synchronized
    public static function getNameFromNode(node : Node) : String {
        var attributes : NamedNodeMap = node.getAttributes();
        var attrNode : Attr = (cast attributes.getNamedItem(CategoryData.getInstance().LABEL) : Attr);
        if (attrNode != null) {
            return attrNode.getValue();
        } else {
            var labelNode : Node = DomSearchHelper.getNodeNoThrow(CategoryData.getInstance().LABEL, node.getChildNodes());
            if (labelNode != null) {
                return DomNodeHelper.getTextNodeValue(labelNode);
            }
        }
        return StringUtil.getInstance().EMPTY_STRING;
    }

}

