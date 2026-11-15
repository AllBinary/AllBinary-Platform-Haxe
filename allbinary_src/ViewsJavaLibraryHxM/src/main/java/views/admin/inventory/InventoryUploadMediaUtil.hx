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
package views.admin.inventory;

//import java.io.ByteArrayInputStream;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.item.ItemInterface;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.http.file.upload.media.UploadMediaSingleton;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileUtil;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.logic.visual.media.MediaData;
import org.allbinary.logic.visual.media.MediaTypeData;
import org.allbinary.logic.visual.media.MediaUtil;
import org.allbinary.string.CommonStrings;

class InventoryUploadMediaUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final mediaUtil : MediaUtil = MediaUtil.getInstance();
    private final LARGEWIDTH : Int = 1024;
    private final LARGEHEIGHT : Int = 1024;
    private final MEDIUMWIDTH : Int = 256;
    private final MEDIUMHEIGHT : Int = 256;
    private final SMALLWIDTH : Int = 128;
    private final SMALLHEIGHT : Int = 128;
    private final SMALL : String = "Small";
    private final MEDIUM : String = "Medium";
    private final LARGE : String = "Large";
    private var storeFrontInterface : StoreFrontInterface;
    private var itemInterface : ItemInterface;
    public function new(storeFrontInterface : StoreFrontInterface, itemInterface : ItemInterface) {
        this.storeFrontInterface = storeFrontInterface;
        this.itemInterface = itemInterface;
    }

    // throws Exception
    public function saveFiles(byteArray : haxe.ds.Vector<Int>, fileName : String, mediaData : MediaData) : ItemInterface {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            this.logUtil.putF("Start FileName: " + fileName, this, "saveFiles()");
        }
        if (StringValidationUtil.getInstance().isEmpty(fileName)) {
            throw new haxe.Exception("Image File Name Was Null");
        }
        var fileUtil : FileUtil = FileUtil.getInstance();
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(URLGLOBALS.getWebappPath());
        stringBuffer.append(this.storeFrontInterface.getCurrentHostNamePath());
        stringBuffer.append(this.itemInterface.getCategory());
        var fullPath : String = Std.string(stringBuffer);
        var imageDirectoryFile : AbFile = AbFile.createAbFile(fullPath);
        if (!imageDirectoryFile.isDirectory()) {
            throw new haxe.Exception("Unable to save file to non existant directory");
        }
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(fullPath);
        stringBuffer.append(fileName);
        stringBuffer.append(AbPathData.getInstance().EXTENSION_SEP);
        stringBuffer.append(mediaData.getName());
        var originalImageFile : AbFile = AbFile.createAbFile(Std.string(stringBuffer));
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            this.logUtil.putF("Saving Original Image: " + originalImageFile, this, "saveFiles()");
        }
        originalImageFile.createNewFile();
        fileUtil.write(new ByteArrayInputStream(byteArray), originalImageFile);
        var uploadMedia : UploadMediaSingleton = UploadMediaSingleton.getInstance();
        var isMediaSupported : Bool = uploadMedia.isWriterSupported(mediaData.getName()) || uploadMedia.isReaderSupported(mediaData.getName());
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append("Is Image Type: ");
            stringBuffer.append(mediaData.getName());
            stringBuffer.append(" supported: ");
            stringBuffer.appendboolean(isMediaSupported);
            this.logUtil.putF(Std.string(stringBuffer), this, "saveFiles()");
        }
        var defaultMediaData : MediaData = MediaData.getDefault();
        this.setFileNames(fileName);
        if (isMediaSupported) {
            var isMediaResizable : Bool = uploadMedia.isWriterMedia(mediaData.getName(), MediaTypeData.getInstance().RESIZABLE_MEDIA);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append("Is ");
                stringBuffer.append(Std.string(mediaData));
                stringBuffer.append(" Image Resize Supported:");
                stringBuffer.appendboolean(uploadMedia.isSupported(mediaData.getName()));
                stringBuffer.append(" WriterMedia: ");
                stringBuffer.appendboolean(isMediaResizable);
                this.logUtil.putF(Std.string(stringBuffer), this, "saveFiles()");
            }
            if (isMediaResizable) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
                    this.logUtil.putF("Saving Small Image: " + this.itemInterface.getSmallImage(), this, "saveFiles()");
                }
                this.mediaUtil.saveImageFile(originalImageFile, this.itemInterface.getSmallImage(), fullPath, mediaData, this.SMALLWIDTH, this.SMALLHEIGHT);
                this.mediaUtil.saveImageFile(originalImageFile, this.itemInterface.getMediumImage(), fullPath, mediaData, this.MEDIUMWIDTH, this.MEDIUMHEIGHT);
                this.mediaUtil.saveImageFile(originalImageFile, this.itemInterface.getLargeImage(), fullPath, mediaData, this.LARGEWIDTH, this.LARGEHEIGHT);
            } else {
                var isConvertable : Bool = mediaData.isConvertableTo(defaultMediaData);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
                    stringBuffer.delete(0, stringBuffer.length());
                    stringBuffer.append("Converting: ");
                    stringBuffer.append(defaultMediaData.getName());
                    stringBuffer.append(" into ");
                    stringBuffer.append(mediaData.getName());
                    stringBuffer.append(" if Convertable is it: ");
                    stringBuffer.appendboolean(isConvertable);
                    this.logUtil.putF(Std.string(stringBuffer), this, "saveFiles()");
                }
                if (isConvertable) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
                        this.logUtil.putF("Saving Small Image: " + this.itemInterface.getSmallImage(), this, "saveFiles()");
                    }
                    this.mediaUtil.saveImageFile(originalImageFile, this.itemInterface.getSmallImage(), fullPath, defaultMediaData, this.SMALLWIDTH, this.SMALLHEIGHT);
                    this.mediaUtil.saveImageFile(originalImageFile, this.itemInterface.getMediumImage(), fullPath, defaultMediaData, this.MEDIUMWIDTH, this.MEDIUMHEIGHT);
                    this.mediaUtil.saveImageFile(originalImageFile, this.itemInterface.getLargeImage(), fullPath, defaultMediaData, this.LARGEWIDTH, this.LARGEHEIGHT);
                } else {
                    var smallImageFile : AbFile = AbFile.createAbFile(this.itemInterface.getSmallImage());
                    smallImageFile.createNewFile();
                    fileUtil.write(new ByteArrayInputStream(byteArray), smallImageFile);
                    var mediumImageFile : AbFile = AbFile.createAbFile(this.itemInterface.getMediumImage());
                    smallImageFile.createNewFile();
                    fileUtil.write(new ByteArrayInputStream(byteArray), mediumImageFile);
                    var largeImageFile : AbFile = AbFile.createAbFile(this.itemInterface.getSmallImage());
                    largeImageFile.createNewFile();
                    fileUtil.write(new ByteArrayInputStream(byteArray), largeImageFile);
                }
            }
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().CATEGORY)) {
            final commonStrings : CommonStrings = CommonStrings.getInstance();
            this.logUtil.putF(commonStrings.END, this, "saveFiles()");
        }
        return this.itemInterface;
    }

    private function setFileNames(fileName : String) : Void {
        var stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(this.itemInterface.getId());
        stringBuffer.append(AbPathData.getInstance().EXTENSION_SEP);
        stringBuffer.append(MediaData.getDefault().getName());
        var END : String = Std.string(stringBuffer);
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(fileName);
        stringBuffer.append(this.SMALL);
        stringBuffer.append(END);
        var newImageFileName : String = Std.string(stringBuffer);
        this.itemInterface.setSmallImage(newImageFileName);
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(fileName);
        stringBuffer.append(this.MEDIUM);
        stringBuffer.append(END);
        newImageFileName = Std.string(stringBuffer);
        this.itemInterface.setMediumImage(newImageFileName);
        stringBuffer.delete(0, stringBuffer.length());
        stringBuffer.append(fileName);
        stringBuffer.append(this.LARGE);
        stringBuffer.append(END);
        newImageFileName = Std.string(stringBuffer);
        this.itemInterface.setLargeImage(newImageFileName);
    }

}

