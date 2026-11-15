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
package org.allbinary.media.image;

//import java.awt.image.BufferedImage;
//import java.io.File;

class ImageProcessorInput {
    private var bufferedImageArray : haxe.ds.Vector<BufferedImage>;
    private var files : haxe.ds.Vector<File>;
    public function new(files : haxe.ds.Vector<File>, bufferedImageArray : haxe.ds.Vector<BufferedImage>) {
        super();
        this.bufferedImageArray = bufferedImageArray;
        this.files = files;
    }

    public function getBufferedImageArray() : haxe.ds.Vector<BufferedImage> {
        return this.bufferedImageArray;
    }

    public function getFiles() : haxe.ds.Vector<File> {
        return this.files;
    }

}

