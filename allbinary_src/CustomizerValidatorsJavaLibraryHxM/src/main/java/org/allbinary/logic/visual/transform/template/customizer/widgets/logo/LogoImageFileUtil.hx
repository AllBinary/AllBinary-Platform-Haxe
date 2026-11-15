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
package org.allbinary.logic.visual.transform.template.customizer.widgets.logo;

//import java.io.ByteArrayInputStream;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileUtil;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.io.path.AbPath;
import org.apache.commons.fileupload.FileItem;

class LogoImageFileUtil {
    private final directory : Directory = Directory.getInstance();
    private final fileName : String;
    private final imageFileAbPath : AbPath;
    public function new(imageAbPath : AbPath, imageFile : String) {
        this.fileName = imageFile;
        this.imageFileAbPath = imageAbPath;
    }

    // throws Exception
    public function saveFiles(fileItem : FileItem) : Void {
        if (this.fileName == null) {
            throw new haxe.Exception("Image File Name Was Null");
        }
        if (!this.directory.create(this.imageFileAbPath)) {
            throw new haxe.Exception("Unable to save file to non creatable directory");
        }
        final originalImageFile : AbFile = AbFile.createAbFile(Std.string(this.imageFileAbPath) + this.fileName);
        originalImageFile.createNewFile();
        FileUtil.getInstance().write(new ByteArrayInputStream(fileItem.get()), originalImageFile);
    }

}

