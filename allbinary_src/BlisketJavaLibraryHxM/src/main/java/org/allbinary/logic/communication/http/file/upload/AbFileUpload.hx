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
package org.allbinary.logic.communication.http.file.upload;

//import java.io.IOException;
//import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletRequestContext;

class AbFileUpload extends FileUpload {
    public function new(fileItemFactory : FileItemFactory) {
        super(fileItemFactory);
    }

    // throws FileUploadException, IOException
    public function getItemIterator(request : HttpServletRequest) : FileItemIterator {
        return super.getItemIterator(new ServletRequestContext(request));
    }

}

