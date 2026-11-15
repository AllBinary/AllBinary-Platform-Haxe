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
package org.allbinary.logic.visual.transform.data;

//import javax.servlet.jsp.PageContext;
import org.allbinary.logic.communication.http.request.session.WeblisketSession;
import org.allbinary.logic.control.search.SearchRequest;

class TransformStoreDocumentFactory {
    public function new() {
    }

    // throws Exception
    public static function getInstance(pageContext : PageContext, weblisketSession : WeblisketSession) : TransformDocumentInterface {
        return (cast new TransformStoreDocument(pageContext, weblisketSession) : TransformDocumentInterface);
    }

    // throws Exception
    public static function getInstance(searchRequest : SearchRequest) : TransformDocumentInterface {
        return (cast new TransformStoreDocument(searchRequest) : TransformDocumentInterface);
    }

}

