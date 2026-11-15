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


class FileUploadData {
    private static final instance : FileUploadData = new FileUploadData();
    public static function getInstance() : FileUploadData {
        return FileUploadData.instance;
    }

    public final FILE : String = "download_file_permissions.xml";
    public final UPLOAD_TO_FILE_PATH : String = "FILE_UPLOAD_UPLOAD_TO_FILE_PATH";
    public final FILE_DATA : String = "FILE_UPLOAD_FILE_DATA";
    public function new() {
    }
}

