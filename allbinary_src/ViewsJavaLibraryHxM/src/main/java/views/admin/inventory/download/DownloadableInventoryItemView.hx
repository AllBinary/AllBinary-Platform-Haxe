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
package views.admin.inventory.download;

//import java.io.ByteArrayInputStream;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.business.user.commerce.inventory.item.BasicItemView;
import org.allbinary.business.user.commerce.inventory.item.ItemInterface;
import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem;
import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemView;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.MultipartRequestParams;
import org.allbinary.logic.communication.http.request.RequestMapInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FilePathData;
import org.allbinary.logic.io.file.FileUtil;
import org.allbinary.logic.io.file.zip.ZipFileUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.apache.commons.fileupload.FileItem;
import views.business.context.modules.storefront.HttpStoreComponentView;

class DownloadableInventoryItemView extends HttpStoreComponentView implements RequestMapInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    public final request : HttpServletRequest;
    public var id : String = null;
    public var itemInterface : ItemInterface = null;
    public var downloadableItem : DownloadableItem = null;
    private var requestHashMap : HashMap = null;
    public function new(transformInfoInterface : TransformInfoInterface) {
        super(transformInfoInterface);
        this.request = (cast this.getPageContext().getRequest() : HttpServletRequest);
        this.getFormData();
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(transformInfoInterface : TransformInfoInterface, empty : String) {
        super(transformInfoInterface);
        this.request = (cast this.getPageContext().getRequest() : HttpServletRequest);
    }

    public static var TYPE_ID : Int = 11;
    public function getTypeId() : Int {
        return DownloadableInventoryItemView.TYPE_ID;
    }

    // throws Exception
    private function getFormData() : Void {
        this.setRequestHashMap(new MultipartRequestParams(this.request).toHashMap());
        this.id = (cast this.getRequestHashMap().get(basicItemData.ID) : String);
    }

    public function addDomNodeInterfaces() : Void {
        var vector : BasicArrayList = new BasicArrayListD();
        if (this.downloadableItem != null) {
            vector.add(new DownloadableItemView(this.downloadableItem));
        }
        this.addDomNodeInterface(new BasicItemView(this.itemInterface, vector));
    }

    // throws Exception
    public function view() : String {
        try {
            this.addDomNodeInterfaces();
            return super.view();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "view()", e);
            }
            throw e;
        }
    }

    // throws Exception
    public function processFile(fileItem : FileItem) : Void {
        final fileName : String = fileItem.getName();
        final fullPath : String = this.getItemFilePath();
        final itemResourceFile : AbFile = AbFile.createAbFile(fullPath);
        itemResourceFile.mkdir();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(fullPath);
        stringBuffer.append(fileName);
        this.logUtil.putF("FileName: " + fileName, this, "processFile()");
        final file : AbFile = AbFile.createAbFile(Std.string(stringBuffer));
        this.logUtil.putF(file.getPath(), this, "processFiles()");
        file.createNewFile();
        var byteArray : haxe.ds.Vector<Int> = fileItem.get();
        FileUtil.getInstance().write(new ByteArrayInputStream(byteArray), file);
    }

    // throws Exception
    public function unzip(fileItem : FileItem) : Void {
        final fileName : String = fileItem.getName();
        final fullPath : String = this.getItemFilePath();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(fullPath);
        stringBuffer.append(fileName);
        this.logUtil.putF("FileName: " + fileName, this, "unzip()");
        final file : AbFile = AbFile.createAbFile(Std.string(stringBuffer));
        this.logUtil.putF(file.getPath(), this, "unzip()");
        ZipFileUtil.getInstance().unzip(fullPath, file, fileName);
    }

    private function getItemFilePath() : String {
        final storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(this.getWeblisketSession().getStoreName());
        final filePathData : FilePathData = FilePathData.getInstance();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append(URLGLOBALS.getWebappPath());
        stringBuffer.append(storeFrontInterface.getCurrentHostNamePath());
        stringBuffer.append(this.itemInterface.getCategory());
        stringBuffer.appendchar(filePathData.SEPARATORCHAR);
        stringBuffer.append(this.itemInterface.getId());
        stringBuffer.appendchar(filePathData.SEPARATORCHAR);
        stringBuffer.append(this.downloadableItem.getId());
        stringBuffer.appendchar(filePathData.SEPARATORCHAR);
        return Std.string(stringBuffer);
    }

    private function setRequestHashMap(requestHashMap : HashMap) : Void {
        this.requestHashMap = requestHashMap;
    }

    public function getRequestHashMap() : HashMap {
        return this.requestHashMap;
    }

    public function getDownloadableItem() : DownloadableItem {
        return this.downloadableItem;
    }

}

