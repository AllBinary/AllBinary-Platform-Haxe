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

//import java.util.HashMap;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.context.modules.storefront.StoreFrontFactory;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.item.BasicItem;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.business.user.commerce.inventory.item.BasicItemView;
import org.allbinary.business.user.commerce.inventory.item.ItemInterface;
import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem;
import org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemView;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil;
import org.allbinary.logic.communication.http.request.HttpRequestUtil;
import org.allbinary.logic.communication.http.request.MultipartRequestParams;
import org.allbinary.logic.communication.http.request.RequestMapInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.io.path.PathUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.visual.media.MediaData;
import org.allbinary.logic.visual.transform.info.TransformInfoInterface;
import org.apache.commons.fileupload.FileItem;
import views.business.context.modules.storefront.HttpStoreComponentView;

class InventoryItemView extends HttpStoreComponentView implements RequestMapInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    public final request : HttpServletRequest;
    private var imageFileName : String = null;
    private var mediaData : MediaData = null;
    public var itemInterface : ItemInterface = null;
    public var downloadableItemVector : BasicArrayList = null;
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

    public static var TYPE_ID : Int = 10;
    public function getTypeId() : Int {
        return InventoryItemView.TYPE_ID;
    }

    // throws Exception
    private function getFormData() : Void {
        this.setRequestHashMap(new MultipartRequestParams(this.request).toHashMap());
        var imageFileItemObject : Any = this.getRequestHashMap().get(basicItemData.IMAGE);
        if (HttpFileUploadUtil.getInstance().isValid(imageFileItemObject)) {
            var fileItem : FileItem = (cast imageFileItemObject : FileItem);
            if (fileItem != null && fileItem.getSize() > 1) {
                this.imageFileName = HttpRequestUtil.getInstance().generateFileName(fileItem.getName());
                final pathData : AbPathData = AbPathData.getInstance();
                final pathUtil : PathUtil = PathUtil.getInstance();
                this.mediaData = MediaData.get(pathData.getExtension(this.imageFileName));
                this.imageFileName = pathUtil.getWithoutExtension(this.imageFileName);
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VIEWERROR)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("Uploaded File Data: ");
                    stringBuffer.append(this.imageFileName);
                    stringBuffer.append(" Extension: ");
                    stringBuffer.append(this.mediaData.getName());
                    this.logUtil.putF(Std.string(stringBuffer), this, "getFormData()");
                }
            }
        }
        this.itemInterface = (cast new BasicItem(this.getRequestHashMap()) : ItemInterface);
    }

    public function addDomNodeInterfaces() : Void {
        var vector : BasicArrayList = new BasicArrayListD();
        var downloadableItem : DownloadableItem = null;
        final size : Int = this.downloadableItemVector.size();
        for (index in 0...size) {
            downloadableItem = (cast this.downloadableItemVector.get(index) : DownloadableItem);
            vector.add(new DownloadableItemView(downloadableItem));
        }
        this.addDomNodeInterface(new BasicItemView(this.itemInterface, vector));
    }

    public function getItemInterface() : ItemInterface {
        return this.itemInterface;
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
    public function processImageFiles() : Void {
        var set : Set = this.getRequestHashMap().keySet();
        final fieldNameArray : haxe.ds.Vector<Any> = set.toArray();
        final size : Int = fieldNameArray.length;
        for (index in 0...size) {
            var fieldName : String = (cast fieldNameArray[index] : String);
            if (Reflect.compare(fieldName, basicItemData.IMAGE) == 0) {
                var storeFrontInterface : StoreFrontInterface = StoreFrontFactory.getInstance(this.getWeblisketSession().getStoreName());
                var inventoryUploadMediaUtil : InventoryUploadMediaUtil = new InventoryUploadMediaUtil(storeFrontInterface, this.itemInterface);
                var fileItem : FileItem = (cast this.getRequestHashMap().get(basicItemData.IMAGE) : FileItem);
                this.itemInterface = inventoryUploadMediaUtil.saveFiles(fileItem.get(), this.imageFileName, this.mediaData);
            }
        }
    }

    private function setRequestHashMap(requestHashMap : HashMap) : Void {
        this.requestHashMap = requestHashMap;
    }

    public function getRequestHashMap() : HashMap {
        return this.requestHashMap;
    }

}

