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
package org.allbinary.logic.control.search;

//import java.util.HashMap;
//import java.util.Set;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.data.tree.dom.ToDomHelper;
import org.allbinary.logic.StdUtil;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class SearchParams {
    private var columnsAndSearchValues : HashMap;
    private var order : String = null;
    private var sortBy : String = null;
    private var listLength : String = null;
    private var startPage : String = null;
    private var endPage : String = null;
    public function new(request : HttpServletRequest) {
        this.columnsAndSearchValues = StdUtil.getInstance().createHashMap();
        this.setLength(request.getParameter(SearchData.LENGTH));
        this.setOrder(request.getParameter(SearchData.ORDER));
        var page : String = request.getParameter(SearchData.PAGE);
        this.setStartPage(page);
        this.setEndPage(page);
        this.setSortBy(request.getParameter(SearchData.SORTBY));
        var index : Int = 0;
        var columnName : String = request.getParameter(SearchData.COLUMNNAME + "[0]");
        var columnValue : String = request.getParameter(SearchData.COLUMNVALUE + "[0]");
        while (columnName != null) {
            this.add(columnName, columnValue);
            index++;
            columnName = request.getParameter(SearchData.COLUMNNAME + "[" + index + "]");
            columnValue = request.getParameter(SearchData.COLUMNVALUE + "[" + index + "]");
        }
    }

    public function add(column : String, value : String) : Void {
        this.columnsAndSearchValues.put(column, value);
    }

    public function setOrder(value : String) : Void {
        this.order = value;
    }

    public function setSortBy(value : String) : Void {
        this.sortBy = value;
    }

    public function setLength(value : String) : Void {
        this.listLength = value;
    }

    public function setStartPage(value : String) : Void {
        this.startPage = value;
    }

    public function setEndPage(value : String) : Void {
        this.endPage = value;
    }

    public function get() : HashMap {
        return this.columnsAndSearchValues;
    }

    public function getOrder() : String {
        return this.order;
    }

    public function getSortBy() : String {
        return this.sortBy;
    }

    public function getLength() : String {
        return this.listLength;
    }

    public function getLengthInt() : Null<Int> {
        if (this.listLength != null) {
            return this.listLength;
        } else {
            return 0;
        }
    }

    public function getStartPage() : String {
        return this.startPage;
    }

    public function getEndPage() : String {
        return this.endPage;
    }

    public function getStartPageInt() : Null<Int> {
        if (this.startPage != null) {
            return this.startPage;
        } else {
            return 0;
        }
    }

    public function getEndPageInt() : Null<Int> {
        if (this.endPage != null) {
            return this.endPage;
        } else {
            return 0;
        }
    }

    // throws Exception
    public function getParamsNode(document : Document) : Node {
        var paramsNode : Node = ModDomHelper.createNameValueNodes(document, SearchData.PARAMS, SearchData.PARAMS);
        paramsNode.appendChild(this.getFieldsNode(document));
        paramsNode.appendChild(this.getOrderNode(document));
        paramsNode.appendChild(this.getSortByNode(document));
        paramsNode.appendChild(this.getLengthNode(document));
        return paramsNode;
    }

    // throws Exception
    private function getFieldsNode(document : Document) : Node {
        var fieldsNode : Node = ModDomHelper.createNameValueNodes(document, SearchData.FIELDS, Std.string(this.columnsAndSearchValues.size()));
        var set : Set = this.columnsAndSearchValues.keySet();
        final searchValueArray : haxe.ds.Vector<Any> = set.toArray();
        final size : Int = searchValueArray.length;
        for (index in 0...size) {
            var key : String = (cast searchValueArray[index] : String);
            var searchValue : String = (cast this.columnsAndSearchValues.get(key) : String);
            fieldsNode.appendChild(ModDomHelper.createNameValueNodes(document, SearchData.FIELD, key, ToDomHelper.convertNull(searchValue)));
        }
        return fieldsNode;
    }

    // throws Exception
    private function getOrderNode(document : Document) : Node {
        return ModDomHelper.createNameValueNodes(document, SearchData.ORDER, ToDomHelper.convertNull(this.getOrder()));
    }

    // throws Exception
    private function getSortByNode(document : Document) : Node {
        return ModDomHelper.createNameValueNodes(document, SearchData.SORTBY, ToDomHelper.convertNull(this.getSortBy()));
    }

    // throws Exception
    private function getLengthNode(document : Document) : Node {
        return ModDomHelper.createNameValueNodes(document, SearchData.LENGTH, ToDomHelper.convertNull(this.getLength()));
    }

}

