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
package org.allbinary.logic.visual.media;


class MediaDataFactory {
    private static final instance : MediaDataFactory = new MediaDataFactory();
    public static function getInstance() : MediaDataFactory {
        return MediaDataFactory.instance;
    }

    public final AVI : MediaData = new MediaData("avi");
    public final BMP : MediaData = new MediaData("bmp");
    public final CEL : MediaData = new MediaData("cel");
    public final FITS : MediaData = new MediaData("fits");
    public final FLI : MediaData = new MediaData("fli");
    public final GBR : MediaData = new MediaData("gbr");
    public final GIF : MediaData = new MediaData("gif");
    public final GIH : MediaData = new MediaData("gih");
    public final JPG : MediaData = new MediaData("jpg");
    public final PIX : MediaData = new MediaData("pix");
    public final PNG : MediaData = new MediaData("png");
    public final PNM : MediaData = new MediaData("pnm");
    public final PSD : MediaData = new MediaData("psd");
    public final PSP : MediaData = new MediaData("psp");
    public final PS : MediaData = new MediaData("ps");
    public final SGI : MediaData = new MediaData("SGI");
    public final SWF : MediaData = new MediaData("swf");
    public final TGA : MediaData = new MediaData("tga");
    public final TIFF : MediaData = new MediaData("tiff");
    public final WMF : MediaData = new MediaData("wmf");
    public function new() {
    }
}

