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
package org.allbinary.business.user.commerce.inventory.item;

import org.allbinary.business.user.commerce.money.Money;
import org.allbinary.data.tables.TableMappingInterface;

interface ItemInterface extends TableMappingInterface {
    function setId(itemId : String) : Void;

    function setNumber(number : String) : Void;

    function setInBaskets(value : String) : Void;

    function setWeight(value : String) : Void;

    function setEnabled(value : String) : Void;

    function setNewOrUsed(value : String) : Void;

    function setSummary(value : String) : Void;

    function setDistributor(value : String) : Void;

    function setIdUsedByDistributor(value : String) : Void;

    function setProducedBy(value : String) : Void;

    function setProductionDate(value : String) : Void;

    function setStartProductionDate(value : String) : Void;

    function setDescription(value : String) : Void;

    function setKeywords(value : String) : Void;

    function setCategory(value : String) : Void;

    function setType(value : String) : Void;

    function setSmallImage(value : String) : Void;

    function setMediumImage(value : String) : Void;

    function setLargeImage(value : String) : Void;

    function setTimeEntered(value : String) : Void;

    function setLastModified(value : String) : Void;

    function setPrice(value : Money) : Void;

    function setComment(value : String) : Void;

    function setCustoms(value : String) : Void;

    function setDownloads(value : String) : Void;

    function setGroups(value : String) : Void;

    function setOptions(value : String) : Void;

    function setPermissions(value : String) : Void;

    function setSpecials(value : String) : Void;

    function getId() : String;

    function getNumber() : String;

    function getInBaskets() : String;

    function getWeight() : String;

    function getEnabled() : String;

    function getNewOrUsed() : String;

    function getSummary() : String;

    function getDistributor() : String;

    function getIdUsedByDistributor() : String;

    function getProducedBy() : String;

    function getProductionDate() : String;

    function getStartProductionDate() : String;

    function getDescription() : String;

    function getKeywords() : String;

    function getCategory() : String;

    function getType() : String;

    function getSmallImage() : String;

    function getMediumImage() : String;

    function getLargeImage() : String;

    function getTimeEntered() : String;

    function getLastModified() : String;

    function getPrice() : Money;

    function getComment() : String;

    function getCustoms() : String;

    function getDownloads() : String;

    function getGroups() : String;

    function getOptions() : String;

    function getPermissions() : String;

    function getSpecials() : String;

    function getTotal() : Money;

}

