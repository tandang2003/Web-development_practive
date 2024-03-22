package com.nhom44.util;

import java.util.Objects;

public class PriceObjectHelper {
    @Override
    public String toString() {
        return "PriceObjectHelper{" +
                "amount=" + amount +
                ", strType='" + strType + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        PriceObjectHelper that = (PriceObjectHelper) o;
        return amount == that.amount;
    }

    @Override
    public int hashCode() {
        return Objects.hash(amount, strType);
    }

    public String getStrType() {
        return strType;
    }

    public void setStrType(String strType) {
        this.strType = strType;
    }

    public long getAmount() {
        return amount;
    }

    public void setAmount(long amount) {
        this.amount = amount;
    }

    public PriceObjectHelper(long amount, String strType) {
        this.amount = amount;
        this.strType = strType;
    }

    private long amount;
    private String strType;

}
