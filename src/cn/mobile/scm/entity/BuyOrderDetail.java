package cn.mobile.scm.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class BuyOrderDetail implements Serializable {

	@Override
	public String toString() {
		return "BuyOrderDetail [bodId=" + bodId + ", goodsId=" + goodsId
				+ ", goodsName=" + goodsName + ", goodsUnit=" + goodsUnit
				+ ", goodsType=" + goodsType + ", goodsColor=" + goodsColor
				+ ", bodAmount=" + bodAmount + ", bodBuyPrice=" + bodBuyPrice
				+ ", bodTotalPrice=" + bodTotalPrice + ", boId=" + boId
				+ ", bodImeiList=" + bodImeiList + "]";
	}

	private static final long serialVersionUID = -4001513144832388483L;

	private String bodId;

    private String goodsId;

    private String goodsName;

    private String goodsUnit;

    private String goodsType;

    private String goodsColor;

    private Integer bodAmount;

    private BigDecimal bodBuyPrice;

    private BigDecimal bodTotalPrice;

    private String boId;

    private String bodImeiList;

    public String getBodId() {
        return bodId;
    }

    public void setBodId(String bodId) {
        this.bodId = bodId;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName;
    }

    public String getGoodsUnit() {
        return goodsUnit;
    }

    public void setGoodsUnit(String goodsUnit) {
        this.goodsUnit = goodsUnit;
    }

    public String getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(String goodsType) {
        this.goodsType = goodsType;
    }

    public String getGoodsColor() {
        return goodsColor;
    }

    public void setGoodsColor(String goodsColor) {
        this.goodsColor = goodsColor;
    }

    public Integer getBodAmount() {
        return bodAmount;
    }

    public void setBodAmount(Integer bodAmount) {
        this.bodAmount = bodAmount;
    }

    public BigDecimal getBodBuyPrice() {
        return bodBuyPrice;
    }

    public void setBodBuyPrice(BigDecimal bodBuyPrice) {
        this.bodBuyPrice = bodBuyPrice;
    }

    public BigDecimal getBodTotalPrice() {
        return bodTotalPrice;
    }

    public void setBodTotalPrice(BigDecimal bodTotalPrice) {
        this.bodTotalPrice = bodTotalPrice;
    }

    public String getBoId() {
        return boId;
    }

    public void setBoId(String boId) {
        this.boId = boId;
    }

    public String getBodImeiList() {
        return bodImeiList;
    }

    public void setBodImeiList(String bodImeiList) {
        this.bodImeiList = bodImeiList;
    }
}