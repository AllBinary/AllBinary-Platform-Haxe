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
package views.admin.inventory.listings;

//import java.util.HashMap;
//import java.util.HashSet;
//import java.util.Set;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.business.context.modules.storefront.StoreFrontInterface;
import org.allbinary.business.user.commerce.inventory.item.BasicItemData;
import org.allbinary.data.tables.context.module.storefronts.StoreFrontsEntity;
import org.allbinary.data.tables.staticpages.StaticPagesEntity;
import org.allbinary.data.tables.user.commerce.inventory.item.InventoryEntity;
import org.allbinary.globals.GLOBALS2;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.control.search.SearchParams;
import org.allbinary.logic.control.search.SearchRequest;
import org.allbinary.logic.io.AbDataOutputStream;
import org.allbinary.logic.io.DataOutputStreamFactory;
import org.allbinary.logic.io.InputOutputTypeData;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.SpecialCharacterUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.string.tokens.UniqueTokens;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ServiceClientInformationInterfaceFactory;
import org.allbinary.string.CommonPhoneStrings;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import views.generic.inventory.InventoryColumnUtil;
import views.generic.inventory.InventorySearchUtil;

class ProductListing implements ProductListingInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final directory : Directory = Directory.getInstance();
    public final basicItemData : BasicItemData = BasicItemData.getInstance();
    private final storeFronts : StoreFrontsEntity;
    private final staticPages : StaticPagesEntity;
    private final inventory : InventoryEntity;
    private final searchRequest : SearchRequest;
    private final INVENTORY : String = ".InventoryView";
    public function new(searchRequest : SearchRequest) {
        this.searchRequest = searchRequest;
        this.storeFronts = new StoreFrontsEntity();
        this.staticPages = new StaticPagesEntity();
        this.inventory = new InventoryEntity();
    }

    // throws Exception
    private function getHashSet(storeFront : StoreFrontInterface) : HashSet {
        var inventoryColumnUtil : InventoryColumnUtil = InventoryColumnUtil.getInstance();
        var keywords : BasicArrayList = inventoryColumnUtil.getColumnWhereLike(this.inventory, storeFront.getCategoryPath(), basicItemData.KEYWORDS);
        var subStoreVector : BasicArrayList = storeFront.getSubStores();
        var size : Int = subStoreVector.size();
        for (index in 0...size) {
            var subStore : String = (cast subStoreVector.get(index) : String);
            var substoreKeywords : BasicArrayList = inventoryColumnUtil.getColumnWhereLike(this.inventory, AbPathData.getInstance().SEPARATOR + subStore, basicItemData.CATEGORY);
            keywords.addAllList(substoreKeywords);
        }
        var uniqueTokens : UniqueTokens = new UniqueTokens();
        var keywordHashSet : HashSet = uniqueTokens.getWhithoutDashesAndSkipNumberOnlyTokens(keywords);
        return keywordHashSet;
    }

    // throws Exception
    private function savePage(file : String, data : String) : Void {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().STATICPAGEGENERATIONLOGGING)) {
            this.logUtil.putF("Creating File: " + file, this, "generateAll()");
        }
        var newFile : AbFile = AbFile.createAbFile(file);
        if (newFile.exists()) {
            newFile.delete();
        }
        newFile.createNewFile();
        if (newFile.exists()) {
            var idOutData : AbDataOutputStream = DataOutputStreamFactory.getInstance().getInstanceForAbFile(newFile);
            idOutData.writeBytes(data);
            idOutData.flush();
            StreamUtil.getInstance().close(idOutData);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().STATICPAGEGENERATIONLOGGING)) {
                this.logUtil.putF("Wrote Total Bytes: " + newFile.length(), this, "generateAll()");
            }
        } else {
            throw new haxe.Exception("Could Not Create: " + file);
        }
    }

    // throws Exception
    private function create(keywordData : String, keywordFilenameHashMap : HashMap, vector : BasicArrayList, staticPath : AbPath) : Void {
        var stringBuffer : StringMaker = new StringMaker();
        var hashMap : HashMap = SpecialCharacterUtil.getHashMap();
        hashMap.put(CommonSeps.getInstance().SPACE, StringUtil.getInstance().EMPTY_STRING);
        var pageName : String = new Replace(hashMap).all(keywordData);
        var searchParams : SearchParams = this.searchRequest.getParams();
        searchParams.add(basicItemData.KEYWORDS, keywordData);
        searchParams.setStartPage(CommonPhoneStrings.getInstance().ZERO);
        this.searchRequest.setParams(searchParams);
        this.searchRequest.setFileBaseName(pageName);
        final abeClientInformation : AbeClientInformationInterface = ServiceClientInformationInterfaceFactory.getInstance();
        final inventorySearchUtil : InventorySearchUtil = InventorySearchUtil.getInstance();
        var productListingPages : haxe.ds.Vector<String> = inventorySearchUtil.search(abeClientInformation, searchRequest, vector);
        for (index in 0...productListingPages.length) {
            if (productListingPages[index] == null) {
                break;
            }
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().STATICPAGEGENERATIONLOGGING)) {
                this.logUtil.putF("Saving Listing: " + index, this, "generateAll()");
            }
            var indexStr : String = StringUtil.getInstance().EMPTY_STRING;
            if (index > 0) {
                indexStr = index.toString();
            }
            keywordFilenameHashMap.put(keywordData, pageName + indexStr);
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append(staticPath.toString());
            stringBuffer.append(pageName);
            stringBuffer.append(indexStr);
            stringBuffer.append(AbPathData.getInstance().EXTENSION_SEP);
            stringBuffer.append(InputOutputTypeData.getInstance().DEFAULT);
            var file : String = stringBuffer.toString();
            if (!this.directory.create(staticPath)) {
                throw new haxe.Exception("Could Not Create Directory: " + staticPath);
            }
            this.savePage(file, productListingPages[index]);
        }
    }

    private function addStaticPageInfoToDatabase(storeFront : StoreFrontInterface, keywordFilenameHashMap : HashMap) : Void {
        var keywordHashSet : Set = keywordFilenameHashMap.keySet();
        final keywordArray : haxe.ds.Vector<Any> = keywordHashSet.toArray();
        final size : Int = keywordArray.length;
        for (index in 0...size) {
            var insertVector : BasicArrayList = new BasicArrayListD();
            var keywordData : String = (cast keywordArray[index] : String);
            var fileName : String = (cast keywordFilenameHashMap.get(keywordData) : String);
            insertVector.add(storeFront.getName());
            insertVector.add(keywordData);
            insertVector.add(fileName);
            this.staticPages.insert(insertVector);
        }
    }

    // throws Exception
    public function generateAll() : String {
        try {
            final storeFront : StoreFrontInterface = this.searchRequest.getStoreFront();
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(URLGLOBALS.getWebappPath());
            stringBuffer.append(storeFront.getName());
            stringBuffer.append(AbPathData.getInstance().SEPARATOR);
            stringBuffer.append(storeFront.getStaticPath());
            final staticPath : AbPath = new AbPath(stringBuffer.toString(), StringUtil.getInstance().EMPTY_STRING);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().STATICPAGEGENERATIONLOGGING)) {
                this.logUtil.putF("Store Static Pages Path: " + staticPath, this, "generateAll()");
            }
            final keywordHashSet : HashSet = this.getHashSet(storeFront);
            final keywordArray : haxe.ds.Vector<Any> = keywordHashSet.toArray();
            final size : Int = keywordArray.length;
            var keywordFilenameHashMap : HashMap = StdUtil.getInstance().createHashMap();
            if (size == 0) {
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append("Products For ");
                stringBuffer.append(storeFront.getName());
                stringBuffer.append(" Store Not Found");
                return stringBuffer.toString();
            }
            final inventorySearchUtil : InventorySearchUtil = InventorySearchUtil.getInstance();
            final vector : BasicArrayList = inventorySearchUtil.getBasicItemIdColumn(this.searchRequest);
            for (index in 0...size) {
                var keywordData : String = (cast keywordArray[index] : String);
                if (keywordData.length > 1) {
                    this.create(keywordData, keywordFilenameHashMap, vector, staticPath);
                }
            }
            this.addStaticPageInfoToDatabase(storeFront, keywordFilenameHashMap);
            stringBuffer.delete(0, stringBuffer.length());
            stringBuffer.append("Static Files Generated Successfully For ");
            stringBuffer.append(storeFront.getName());
            stringBuffer.append(" it used packages ");
            stringBuffer.append(storeFront.getPackageLocation());
            stringBuffer.append(this.INVENTORY);
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

    // throws Exception
    public function generateAll(storeName : String) : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            if (storeName != null) {
                if (Reflect.compare(storeName, GLOBALS2.GENERATEALLSTORES) != 0) {
                    this.searchRequest.setStoreFront(this.storeFronts.getStoreFrontInterface(storeName));
                    stringBuffer.append(this.generateAll());
                    stringBuffer.append("<br />");
                } else {
                    var storeFrontVector : BasicArrayList = this.storeFronts.getStoreFrontNames();
                    final size : Int = storeFrontVector.size();
                    for (index in 0...size) {
                        storeName = (cast storeFrontVector.get(index) : String);
                        this.searchRequest.setStoreFront(this.storeFronts.getStoreFrontInterface(storeName));
                        stringBuffer.append(this.generateAll());
                        stringBuffer.append("<br />");
                    }
                }
            } else {
                return "Generation Failed No Store Specified<br/>";
            }
            stringBuffer.append("All Static Pages Generated<br/>");
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            throw e;
        }
    }

}

