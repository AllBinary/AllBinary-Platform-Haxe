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
package org.allbinary.logic.visual.transform.info;


class BasicViewData {
    private static final instance : BasicViewData = new BasicViewData();
    public static function getInstance() : BasicViewData {
        return BasicViewData.instance;
    }

    public function new() {
        this.USERDIR = this.GENERICDIR + "user/";
        this.ADDRESSDIR = this.USERDIR + "address/";
        this.BILLINGADDRESSDIR = this.ADDRESSDIR + "billing/";
        this.SHIPPINGADDRESSDIR = this.ADDRESSDIR + "shipping/";
        this.COMMERCEDIR = this.USERDIR + "commerce/";
        this.INVENTORYDIR = this.COMMERCEDIR + "inventory/";
        this.BASKETDIR = this.INVENTORYDIR + "basket/";
        this.ITEMDIR = this.INVENTORYDIR + "item/";
        this.MONEYDIR = this.COMMERCEDIR + "money/";
        this.SHIPPINGDIR = this.COMMERCEDIR + "shipping/";
        this.ORDERDIR = this.INVENTORYDIR + "order/";
        this.ORDEREMAILDIR = this.ORDERDIR + "email/";
        this.ORDERHISTORYDIR = this.ORDERDIR + "history/";
        this.ORDERREVIEWDIR = this.ORDERDIR + "review/";
        this.PAYMENTDIR = this.MONEYDIR + "payment/";
        this.GENERATIONDIR = this.GENERICDIR + "generation/";
        this.PRODUCTSDIR = this.GENERICDIR + "products/";
        this.IGNOREXMLXSL = this.GENERICDIR + "ignoreXmlView.xsl";
        this.REVIEWORDERVIEWXSL = this.ORDERREVIEWDIR + "reviewOrderView.xsl";
        this.ORDERVIEWXSL = this.REVIEWORDERVIEWXSL;
        this.INVENTORYXSL = this.INVENTORYDIR + "inventory.xsl";
        this.BASKETXSL = this.BASKETDIR + "basket.xsl";
        this.CHECKOUTBASKETXSL = this.BASKETDIR + "staticBasket.xsl";
        this.MINIBASKETXSL = this.BASKETDIR + "miniBasket.xsl";
        this.BILLINGADDRESSCHANGEFORMXSL = this.BILLINGADDRESSDIR + "billingAddressChangeForm.xsl";
        this.BILLINGADDRESSINPUTFORMXSL = this.BILLINGADDRESSDIR + "billingAddressInputForm.xsl";
        this.BILLINGADDRESSVIEWXSL = this.BILLINGADDRESSDIR + "billingAddressView.xsl";
        this.SHIPPINGADDRESSCHANGEFORMXSL = this.SHIPPINGADDRESSDIR + "shippingAddressChangeForm.xsl";
        this.SHIPPINGADDRESSINPUTFORMXSL = this.SHIPPINGADDRESSDIR + "shippingAddressInputForm.xsl";
        this.SHIPPINGADDRESSVIEWXSL = this.SHIPPINGADDRESSDIR + "shippingAddressView.xsl";
        this.NEWTAXADDRESSXSL = this.SHIPPINGADDRESSDIR + "newTaxAddressView.xsl";
        this.EDITTAXADDRESSXSL = this.SHIPPINGADDRESSDIR + "editTaxAddressView.xsl";
        this.SHIPPINGMETHODSXSL = this.SHIPPINGDIR + "shippingMethods.xsl";
        this.ORDERCUSTOMEREMAILVIEWXSL = this.ORDEREMAILDIR + "orderCustomerEmailView.xsl";
        this.ORDERMANAGEREMAILVIEWXSL = this.ORDEREMAILDIR + "orderManagerEmailView.xsl";
        this.EDITCUSTOMERXSL = this.USERDIR + "editCustomerInputForm.xsl";
        this.ORDERHISTORYXSL = this.ORDERHISTORYDIR + "orderHistory.xsl";
        this.PAYMENTVIEWXSL = this.PAYMENTDIR + "paymentView.xsl";
        this.SUMMARYXSL = this.ITEMDIR + "summary/summary.xsl";
        this.PAYMENTGATEWAYOPTIONSXSL = this.PAYMENTDIR + "paymentGatewayOptions.xsl";
        this.MAKEPAYMENTVIEWXSL = this.PAYMENTDIR + "invoice/" + "makePayment.xsl";
    }

    public final GENERICDIR : String = "generic/";
    public final USERDIR : String;
    public final ADDRESSDIR : String;
    public final BILLINGADDRESSDIR : String;
    public final SHIPPINGADDRESSDIR : String;
    public final COMMERCEDIR : String;
    public final INVENTORYDIR : String;
    public final BASKETDIR : String;
    public final ITEMDIR : String;
    public final MONEYDIR : String;
    public final SHIPPINGDIR : String;
    public final ORDERDIR : String;
    public final ORDEREMAILDIR : String;
    public final ORDERHISTORYDIR : String;
    public final ORDERREVIEWDIR : String;
    public final PAYMENTDIR : String;
    public final GENERATIONDIR : String;
    public final PRODUCTSDIR : String;
    public final IGNOREXMLXSL : String;
    public final REVIEWORDERVIEWXSL : String;
    public final ORDERVIEWXSL : String;
    public final INVENTORYXSL : String;
    public final BASKETXSL : String;
    public final CHECKOUTBASKETXSL : String;
    public final MINIBASKETXSL : String;
    public final BILLINGADDRESSCHANGEFORMXSL : String;
    public final BILLINGADDRESSINPUTFORMXSL : String;
    public final BILLINGADDRESSVIEWXSL : String;
    public final SHIPPINGADDRESSCHANGEFORMXSL : String;
    public final SHIPPINGADDRESSINPUTFORMXSL : String;
    public final SHIPPINGADDRESSVIEWXSL : String;
    public final NEWTAXADDRESSXSL : String;
    public final EDITTAXADDRESSXSL : String;
    public final SHIPPINGMETHODSXSL : String;
    public final ORDERCUSTOMEREMAILVIEWXSL : String;
    public final ORDERMANAGEREMAILVIEWXSL : String;
    public final EDITCUSTOMERXSL : String;
    public final ORDERHISTORYXSL : String;
    public final PAYMENTVIEWXSL : String;
    public final SUMMARYXSL : String;
    public final PAYMENTGATEWAYOPTIONSXSL : String;
    public final MAKEPAYMENTVIEWXSL : String;
}

